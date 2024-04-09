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
    mov(r1, 0xF00); // red
    mov(r2, 0x0F0); // green
    mov(r3, 0x00F); // blue
    ldr(r0, "[]", vga_column);
    cmp(r0, 213); // if column < 213
    blt(11); // if
    cmp(r0, 426); // if column < 426
    blt(13); // if
    cmp(r0, 639); // if column < 639
    blt(15); // if
    str(r1, vga_colour); 
    b(4);
    str(r2, vga_colour); 
    b(4);
    str(r3, vga_colour);
    b(4);

    stack_usage();

    programming_end();
    //////////// program end ////////////
   

    sleep();    // saves power

}



