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

    // simulating an instruction
    transmit(0x01); // opcode
    transmit(0x01); // sel
    transmit(0x00); // op1h
    transmit(0x02); // op1l
    transmit(0x00); // op2h
    transmit(0x03); // op2l

    // simulating an instruction
    transmit(0x02); // opcode
    transmit(0x01); // sel
    transmit(0x00); // op1h
    transmit(0x03); // op1l
    transmit(0x00); // op2h
    transmit(0x05); // op2l

    // simulating an instruction
    transmit(0x03); // opcode
    transmit(0x01); // sel
    transmit(0x00); // op1h
    transmit(0x05); // op1l
    transmit(0x00); // op2h
    transmit(0x07); // op2l

    // simulating an instruction
    transmit(0x04); // opcode
    transmit(0x01); // sel
    transmit(0x00); // op1h
    transmit(0x08); // op1l
    transmit(0x00); // op2h
    transmit(0x09); // op2l

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

    wait_us(10000);   // 10ms delay


}

