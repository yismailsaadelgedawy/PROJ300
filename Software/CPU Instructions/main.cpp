#include "mbed.h"


UnbufferedSerial uart(PD_5, PD_6);  // USART2
DigitalOut green(PB_0); // for debugging purposes


// main() runs in its own thread in the OS
int main()
{

    // 0x4A
    char letter = 'J';

    // Set desired properties (9600-8-N-1).
    uart.baud(9600);    // WARNING: does not work properly below 9600 baud (e.g. 300 baud)
                        // tested using scope
    uart.format(
        /* bits */ 8,
        /* parity */ SerialBase::None,
        /* stop bit */ 1
    );

    


    // wait until TXE bit is high (transferred data to shift register)
    // i.e. wait until Tx buffer is empty
    while(!(USART2->SR & 0x80)) {} 
        
    // places byte in DR
    // clears the TXE bit automatically
    USART2->DR = letter;

    wait_us(1000000);   // 1 second delay

    green = 1;

    sleep();

    green = 0;  // test

    
    

}

