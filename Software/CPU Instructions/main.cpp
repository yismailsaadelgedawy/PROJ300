#include "mbed.h"

// GPIO
UnbufferedSerial uart2(PD_5, PD_6);  // USART2
DigitalOut red(PB_14); // for debugging purposes
DigitalOut blue(PB_7); //

// functions

void transmit(char ch);



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


    // begin transmission of bytes
    
    red = 1;
    transmit(0x4A);
    transmit(0x4B);
    transmit(0x4C);
    transmit(0x4D);
    transmit(0x4E);
    transmit(0x4F);

    red = 0;

    sleep();

}



void transmit(char ch) {

    // wait until TXE bit is high (transferred data to shift register)
    // i.e. wait until Tx buffer is empty
    while(!(USART2->SR & 0x80)) {} 
        
    // places byte in DR
    // clears the TXE bit automatically
    USART2->DR = ch;

    wait_us(100000);   // 100ms delay

    while(!(USART2->SR & 0x80)) {}
    USART2->DR = '$'; // signifies to RAM to move on to next address
    wait_us(100000);


}

