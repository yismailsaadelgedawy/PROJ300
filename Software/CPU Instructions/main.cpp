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
    add(r3, r3,7);   
    add(r4, r4,15);   
    add(r5, r5,31);   
    add(r6, r6,63);   
    add(r7, r7,127);   
    add(r8, r8,255);   
    add(r9, r9,511);
    add(r10, r10,1023);
    add(r11, r11,2047);
    add(r12, r12,4095);
    str(r0, led); // leds on
    b(2); // back to start

    stack_usage();
    programming_end();
    //////////// program end ////////////

    userbtn.rise(&programISR);  // re-enable

}



