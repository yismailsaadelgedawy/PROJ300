#ifndef functions_h
#define functions_h
#include "stdint.h "    // for data typedefs

// typedefs - where names are assigned specific addresses according to the memory map

// General purpose registers
typedef enum {r0=0x0000,r1=0x1000,r2=0x2000,r3=0x3000,r4=0x4000,r5=0x5000,r6=0x6000,r7=0x7000,r8=0x8000,r9=0x9000,r10=0xA000,r11=0xB000,r12=0xC000} gpr_t;

// Memory mapped registers
typedef enum {led=0x401,keyboard_input,audio,vga_row,vga_column,sprite_mov,vga_sel,vga_colour} mmr_t;

// header guard to prevent multiple inclusions of the same h file

void uart2_setup();
void transmit(char ch);
void transmit_instruction();
void test_instruction(uint8_t opcd, uint8_t select, uint16_t oprnd1, uint16_t oprnd2);
void print_instruction();

// instructions
void add(gpr_t gpr_result, uint16_t literal1, uint16_t literal2);
void add(gpr_t gpr_result, uint16_t literal1, gpr_t gpr_op2);
void add(gpr_t gpr_result, gpr_t gpr_op1, uint16_t literal2);
void add(gpr_t gpr_result, gpr_t gpr_op1, gpr_t gpr_op2);







#endif