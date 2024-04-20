#include "mbed.h"
#include "functions.hpp"

// GPIO
DigitalOut red(PB_14); // for debugging purposes
DigitalOut blue(PB_7); //



int main()
{   
    
    uart2_setup();      // uart2 setup
    clear_terminal();   // clear terminal

    //////////// program start ////////////
    programming_start();

    str(0x01, vga_sel); // manual rendering mode
    mov(r0, 0x000); // r0 init - colour data
    str(0, tmr); // make sure timer is stopped
    str(r0, vga_colour);
    str(70, tmr); // tmr start 70ms
    ldr(r1, "[]", tmr); // tmr state
    cmp(r1, 1); // is timer done
    beq(9); // if
    b(5); // else
    add(r0, r0,1);   
    add(r1, r1,2);   
    add(r2, r2,3);   
    add(r3, r3,4);   
    add(r4, r4,5);   
    add(r5, r5,6);   
    add(r6, r6,7);   
    add(r7, r7,8);   
    add(r8, r8,9);   
    add(r9, r9,10);
    add(r10, r10,11);
    add(r11, r11,12);
    add(r12, r12,r0);
    str(r0, led); // leds on
    b(2); // back to start

    stack_usage();
    programming_end();
    //////////// program end ////////////
   

    sleep();    // saves power

}



