#include "mbed.h"
#include "functions.hpp"

// GPIO
DigitalOut red(PB_14); // for debugging purposes
DigitalOut blue(PB_7); //
InterruptIn userbtn(PC_13);

// CPU sleep to ensure power efficient code!
void programISR();


int main()
{   
    
    uart2_setup();      // uart2 setup
    clear_terminal();   // clear terminal
    userbtn.rise(&programISR);

    cout << "Press BLUE BUTTON To Program CPU" << endl;
    sleep();

   
    blue = 1;   // eot indicator
    sleep();    // saves power

}


void programISR() {

    userbtn.rise(0);    // disable to account for bounce - these queue!
    blue = 0;

    //////////// program start ////////////
    programming_start();

    word("num1", 1);    // variables stored on stack
    word("num2", 2);    //
    ldr(r0, "num1");
    ldr(r1, "num2");
    add(r2, r0,r1);

    stack_usage();
    programming_end();
    //////////// program end ////////////

    userbtn.rise(&programISR);  // re-enable

}



