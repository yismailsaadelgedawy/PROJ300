#include "mbed.h"

// GPIO
UnbufferedSerial uart2(PD_5, PD_6);  // USART2
DigitalOut red(PB_14); // for debugging purposes
DigitalOut blue(PB_7); // 



int main()
{
    

    /////////// UART2 SETUP START ///////////

    uart2.baud(9600);    // WARNING: does not work properly below 9600 baud (e.g. 300 baud)
                         // tested using scope
    uart2.format(
        /* bits */ 8,
        /* parity */ SerialBase::None,
        /* stop bit */ 1
    );

    /////////// UART2 SETUP END ////////////




    const char letters[8] = "ABCDEFG";
    const char instructions[5] = {0x01,0x02,0x03,0x04,0x05};
    const unsigned int array_size1 = sizeof(letters) / sizeof(char); // not needed for char, but useful for other data types
    const unsigned int array_size2 = sizeof(instructions) / sizeof(char); // 
    
    while(1) {


        // this loop sends characters to the FPGA
        // 'A' is 0x41
        // array_size - 1 to not print the NULL character
        // at the end of the string
        for (int i=0; i<(array_size1-1); i++) { 

            blue = 0;

            // wait until TXE bit is high (transferred data to shift register)
            // i.e. wait until Tx buffer is empty
            while(!(USART2->SR & 0x80)) {} 
                
            // places byte in DR
            // clears the TXE bit automatically
            USART2->DR = letters[i];

            wait_us(1000000);   // 1 second delay

            red = !red; // not ~red (not Verilog lol)


        }

        // this loop sends user-defined bytes to the FPGA
        for (int i=0; i<array_size2; i++) {

            red = 0;

            // wait until TXE bit is high (transferred data to shift register)
            // i.e. wait until Tx buffer is empty
            while(!(USART2->SR & 0x80)) {} 
                
            // places byte in DR
            // clears the TXE bit automatically
            USART2->DR = instructions[i];

            wait_us(1000000);   // 1 second delay

            blue = !blue;


        }



    }

    
}

