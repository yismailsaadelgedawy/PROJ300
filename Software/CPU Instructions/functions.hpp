#ifndef functions_h
#define functions_h
#include "stdint.h "    // for data typedefs
#include "mbed.h"
#include <cstdint>
#include <cstdlib>
#include "string"
#include "iostream"

// typedefs - where names are assigned specific addresses according to the memory map

// General purpose registers
typedef enum {r0=0x0000,r1=0x1000,r2=0x2000,r3=0x3000,r4=0x4000,r5=0x5000,r6=0x6000,r7=0x7000,r8=0x8000,r9=0x9000,r10=0xA000,r11=0xB000,r12=0xC000} gpr_t;

// Memory mapped registers
typedef enum {led=0x401,keyboard_input,audio,vga_row,vga_column,sprite_mov,vga_sel,vga_colour,tmr,switches} mmr_t;

// header guard to prevent multiple inclusions of the same h file

// general functions
void clear_terminal();
void stack_usage();
void uart2_setup();
void transmit(char ch);
void transmit_instruction();
void transmit_ALinstruction();
void test_instruction(uint8_t opcd, uint8_t select, uint16_t oprnd1, uint16_t oprnd2);
void print_instruction();
void programming_start();
void programming_end();


// instructions
void nop();
void mov(gpr_t gpr, uint16_t literal);
void mov(gpr_t gpr1, gpr_t gpr2);
void str(gpr_t gpr, uint16_t addr);
void str(uint16_t literal, uint16_t addr);
void str(gpr_t gpr, mmr_t mmr);
void str(uint16_t literal, mmr_t mmr);
void word(string var_name, uint16_t var_value);
void ldr(gpr_t gpr, uint16_t addr);
void ldr(gpr_t gpr, string a, uint16_t deref_addr);
void ldr(gpr_t gpr, mmr_t mmr);
void ldr(gpr_t gpr, string a, mmr_t deref_mmr);
void ldr(gpr_t gpr, string var_name);
void cmp(gpr_t gpr, uint16_t literal);
void cmp(gpr_t gpr1, gpr_t gpr2);
void b(uint16_t addr);
void bgt(uint16_t addr);
void blt(uint16_t addr);
void beq(uint16_t addr);
void add(gpr_t gpr_result, uint16_t literal1, uint16_t literal2);
void add(gpr_t gpr_result, uint16_t literal1, gpr_t gpr_op2);
void add(gpr_t gpr_result, gpr_t gpr_op1, uint16_t literal2);
void add(gpr_t gpr_result, gpr_t gpr_op1, gpr_t gpr_op2);
void sub(gpr_t gpr_result, uint16_t literal1, uint16_t literal2);
void sub(gpr_t gpr_result, uint16_t literal1, gpr_t gpr_op2);
void sub(gpr_t gpr_result, gpr_t gpr_op1, uint16_t literal2);
void sub(gpr_t gpr_result, gpr_t gpr_op1, gpr_t gpr_op2);
void mul(gpr_t gpr_result, uint16_t literal1, gpr_t gpr_op2);
void mul(gpr_t gpr_result, uint16_t literal1, uint16_t literal2);
void mul(gpr_t gpr_result, gpr_t gpr_op1, uint16_t literal2);
void mul(gpr_t gpr_result, gpr_t gpr_op1, gpr_t gpr_op2);
void lsr(gpr_t gpr_result, gpr_t gpr_op1, uint16_t literal2);
void AND(gpr_t gpr_result, uint16_t literal1, uint16_t literal2);
void AND(gpr_t gpr_result, uint16_t literal1, gpr_t gpr_op2);
void AND(gpr_t gpr_result, gpr_t gpr_op1, uint16_t literal2);
void AND(gpr_t gpr_result, gpr_t gpr_op1, gpr_t gpr_op2);
void OR(gpr_t gpr_result, uint16_t literal1, uint16_t literal2);
void OR(gpr_t gpr_result, uint16_t literal1, gpr_t gpr_op2);
void OR(gpr_t gpr_result, gpr_t gpr_op1, uint16_t literal2);
void OR(gpr_t gpr_result, gpr_t gpr_op1, gpr_t gpr_op2);
void mvn(gpr_t gpr, uint16_t literal);
void mvn(gpr_t gpr1, gpr_t gpr2);








#endif