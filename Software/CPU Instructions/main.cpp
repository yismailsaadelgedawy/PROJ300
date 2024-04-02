#include "mbed.h"
#include "functions.hpp"

// GPIO
DigitalOut red(PB_14); // for debugging purposes
DigitalOut blue(PB_7); //



int main()
{   
    // uart2 setup
    uart2_setup();

    test_instruction(0x01, 0x00, 0x4000, 0x2000);

  

    sleep();

}



