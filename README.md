# 32-bit ARM Inspired FPGA Computer

## Introduction

Here, you will find some media to showcase the workings/feautures of the project.
For detail on how all of this works, see my LinkedIn profile post at: https://www.linkedin.com/in/youssef-el-geddawy-ab2085292/

### Overall System Running

https://github.com/user-attachments/assets/22ee120e-133d-488a-b780-022c8d299afa

The assembly program running is the following:

```
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

// showcase program //
```


### Keyboard Piano

https://github.com/user-attachments/assets/b63c3ae4-20a9-44ec-8537-4e127ff7aa50

The assembly program running is the following:

```
str(0x01, vga_sel); // manual rendering mode
ldr(r0, "[]", keyboard_input); // read key pressed
cmp(r0, 0x1C); // A
beq(5); // if
b(13); // else
str(0x1C, audio); // A note
str(0xF00, vga_colour); // red
ldr(r0, "[]", keyboard_input); // read key pressed
cmp(r0, 0x00); // key released
beq(11); // if
b(7); // else
str(0x00, audio); // tune off
str(0x00, vga_colour); // display off
cmp(r0, 0x32); // B
beq(16); // if
b(24); // else
str(0x32, audio); // B note
str(0xE80, vga_colour); // orange
ldr(r0, "[]", keyboard_input); // read key pressed
cmp(r0, 0x00); // key released
beq(22); // if
b(18); // else
str(0x00, audio); // tune off
str(0x00, vga_colour); // display off
cmp(r0, 0x21); // C
beq(27); // if
b(35); // else
str(0x21, audio); // C note
str(0xFF0, vga_colour); // yellow
ldr(r0, "[]", keyboard_input); // read key pressed
cmp(r0, 0x00); // key released
beq(33); // if
b(29); // else
str(0x00, audio); // tune off
str(0x00, vga_colour); // display off
cmp(r0, 0x23); // D
beq(38); // if
b(46); // else
str(0x23, audio); // D note
str(0x0F0, vga_colour); // green
ldr(r0, "[]", keyboard_input); // read key pressed
cmp(r0, 0x00); // key released
beq(44); // if
b(40); // else
str(0x00, audio); // tune off
str(0x00, vga_colour); // display off
cmp(r0, 0x24); // E
beq(49); // if
b(57); // else
str(0x24, audio); // E note
str(0x00F, vga_colour); // blue
ldr(r0, "[]", keyboard_input); // read key pressed
cmp(r0, 0x00); // key released
beq(55); // if
b(51); // else
str(0x00, audio); // tune off
str(0x00, vga_colour); // display off
cmp(r0, 0x2B); // F
beq(60); // if
b(68); // else
str(0x2B, audio); // F note
str(0xB3E, vga_colour); // indigo
ldr(r0, "[]", keyboard_input); // read key pressed
cmp(r0, 0x00); // key released
beq(66); // if
b(62); // else
str(0x00, audio); // tune off
str(0x00, vga_colour); // display off
cmp(r0, 0x34); // G
beq(71); // if
b(1); // else
str(0x34, audio); // G note
str(0x83F, vga_colour); // violet
ldr(r0, "[]", keyboard_input); // read key pressed
cmp(r0, 0x00); // key released
beq(77); // if
b(73); // else
str(0x00, audio); // tune off
str(0x00, vga_colour); // display off
b(1);

// showcase program //
```


### Hardware Timers and Blinky

https://github.com/user-attachments/assets/cfb77016-71fe-4d39-8311-53863db17fb7

The assembly program running is the following:

```
str(0x00, led); // LEDs off initially
str(100, tmr); // start 100ms tmr
ldr(r0, "[]", tmr); // timer state
cmp(r0, 0x01);  // if done
beq(6); // if
b(2); // else
str(0xFF, led); // LEDs on
str(0x00, tmr); // stop tmr;
str(100, tmr); // start 100ms timer
ldr(r0, "[]", tmr); // timer state
cmp(r0, 0x01);  // if done
beq(13); // if
b(9); // else
str(0x00, led); // LEDs off
str(0x00, tmr); // stop tmr;
b(1);

```



