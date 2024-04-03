#include "mbed.h"
#include "functions.hpp"

// GPIO
DigitalOut red(PB_14); // for debugging purposes
DigitalOut blue(PB_7); //



int main()
{   
    // uart2 setup
    uart2_setup();

    // clear terminal and move cursor to (0,0)
    printf("\033[2J"); printf("\033[H");

   

    sleep();

}



