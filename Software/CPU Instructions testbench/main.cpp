#include "mbed.h"
#include "functions.hpp"

// GPIO
DigitalOut red(PB_14); // for debugging purposes
DigitalOut blue(PB_7); //



int main()
{   
    
    uart2_setup();  // uart2 setup
    clear_terminal();   // clear terminal

    // testing instructions

    cout << "/////////// nop ///////////" << endl << endl;
    nop();

    cout << "/////////// mov ///////////" << endl << endl;
    mov(r0, 1);
    mov(r1, 2);
    mov(r2, 3);
    mov(r3, 4);
    mov(r4, 5);
    mov(r5, 6);
    mov(r6, 7);
    mov(r7, 8);
    mov(r8, 9);
    mov(r9, 10);
    mov(r10, 11);
    mov(r11, 12);
    mov(r12, 13);

    mov(r0,  r1);
    mov(r1,  r2);
    mov(r2,  r3);
    mov(r3,  r4);
    mov(r4,  r5);
    mov(r5,  r6);
    mov(r6,  r7);
    mov(r7,  r8);
    mov(r8,  r9);
    mov(r9,  r10);
    mov(r10, r11);
    mov(r11, r12);
    mov(r12, r0);

    cout << "/////////// str ///////////" << endl << endl;
    str (r0,  0x44C);
    str (r1,  0x44D);
    str (r2,  0x44E);
    str (r3,  0x44F);
    str (r4,  0x450);
    str (r5,  0x451);
    str (r6,  0x452);
    str (r7,  0x453);
    str (r8,  0x454);
    str (r9,  0x455);
    str (r10, 0x456);
    str (r11, 0x457);
    str (r12, 0x458);

    str (1,  0x459);
    str (2,  0x45A);
    str (3,  0x45B);
    str (4,  0x45C);
    str (5,  0x45D);
    str (6,  0x45E);
    str (7,  0x45F);
    str (8,  0x460);
    str (9,  0x461);
    str (10, 0x462);
    str (11, 0x463);
    str (12, 0x464);
    str (13, 0x465);

    cout << "/////////// ldr ///////////" << endl << endl;
    ldr (r0,  0x459);
    ldr (r1,  0x45A);
    ldr (r2,  0x45B);
    ldr (r3,  0x45C);
    ldr (r4,  0x45D);
    ldr (r5,  0x45E);
    ldr (r6,  0x45F);
    ldr (r7,  0x460);
    ldr (r8,  0x461);
    ldr (r9,  0x462);
    ldr (r10, 0x463);
    ldr (r11, 0x464);
    ldr (r12, 0x465);

    ldr (r0, "[]",  0x459);
    ldr (r1, "[]",  0x45A);
    ldr (r2, "[]",  0x45B);
    ldr (r3, "[]",  0x45C);
    ldr (r4, "[]",  0x45D);
    ldr (r5, "[]",  0x45E);
    ldr (r6, "[]",  0x45F);
    ldr (r7, "[]",  0x460);
    ldr (r8, "[]",  0x461);
    ldr (r9, "[]",  0x462);
    ldr (r10, "[]", 0x463);
    ldr (r11, "[]", 0x464);
    ldr (r12, "[]", 0x465);

    cout << "/////////// cmp ///////////" << endl << endl;
    cmp (r0, 1);
    cmp (r1, 1);
    cmp (r2, 2);
    cmp (r3, 1);
    cmp (r4, 1);
    cmp (r5, 1);
    cmp (r6, 1);
    cmp (r7, 1);
    cmp (r8, 1);
    cmp (r9, 1);
    cmp (r10, 1);
    cmp (r11, 1);
    cmp (r12, 1);

    cmp (r0, r1);
    cmp (r1, r2);
    cmp (r2, r3);
    cmp (r3, r4);
    cmp (r4, r5);
    cmp (r5, r6);
    cmp (r6, r7);
    cmp (r7, r8);
    cmp (r8, r9);
    cmp (r9, r10);
    cmp (r10, r11);
    cmp (r11, r12);
    cmp (r12, r0);

    cout << "/////////// b ///////////" << endl << endl;
    b(0X006E);
    cout << "/////////// bgt ///////////" << endl << endl;
    bgt(0x006E);
    cout << "/////////// blt ///////////" << endl << endl;
    blt(0X006E);
    cout << "/////////// beq ///////////" << endl << endl;
    beq(0x006E);

    cout << "/////////// add ///////////" << endl << endl;
    add (r2, 11,10);
    add (r2, 11,r0);
    add (r2, r1,10);
    add (r2, r0,r1);

    cout << "/////////// sub ///////////" << endl << endl;
    sub (r2, 11,10);
    sub (r2, 11,r0);
    sub (r2, r1,10);
    sub (r2, r0,r1);

    cout << "/////////// mul ///////////" << endl << endl;
    mul (r2, 11,10);
    mul (r2, 11,r0);
    mul (r2, r1,10);
    mul (r2, r0,r1);

    cout << "/////////// lsr ///////////" << endl << endl;
    lsr (r2, r1,1);

    cout << "/////////// and ///////////" << endl << endl;
    AND (r2, 11,10);
    AND (r2, 11,r0);
    AND (r2, r1,10);
    AND (r2, r0,r1);

    cout << "/////////// or ///////////" << endl << endl;
    OR (r2, 11,10);
    OR (r2, 11,r0);
    OR (r2, r1,10);
    OR (r2, r0,r1);

    cout << "/////////// mvn ///////////" << endl << endl;
    mvn (r2, 1);
    mvn (r2, r1);

    cout << "\n/////////// storing into memory mapped registers ///////////" << endl << endl;
    str(led,0x08);
    str(audio,0x08);
    str(sprite_mov,0x01);
    str(vga_sel,0x01);
    str(vga_colour,0xFFF);  // white

    cout << "\n/////////// loading from memory mapped registers ///////////" << endl << endl;
    ldr(r0, "[]", led);
    ldr(r1, "[]", audio);
    ldr(r2, "[]", sprite_mov);
    ldr(r3, "[]", vga_sel);
    ldr(r4, "[]", vga_colour);
    


    cout << "\n/////////// storing vars onto the stack ///////////" << endl << endl;
    word("num1", 10);
    word("num2", 11);
    word("num3", 12);

    cout << "\n/////////// loading vars from the stack ///////////" << endl << endl;
    ldr(r0, "num1");
    ldr(r1, "num2");
    ldr(r2, "num3");

    

    stack_usage();
   

    sleep();

}



