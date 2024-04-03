#include "mbed.h"
#include "functions.hpp"

// GPIO
DigitalOut red(PB_14); // for debugging purposes
DigitalOut blue(PB_7); //



int main()
{   
    
    uart2_setup();  // uart2 setup
    clear_terminal();   // clear terminal

    

    stack_usage();
   

    sleep();

}



