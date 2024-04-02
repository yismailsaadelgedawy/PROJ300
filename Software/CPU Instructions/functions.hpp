#ifndef functions_h
#define functions_h
#include "stdint.h "    // for data typedefs


// header guard to prevent multiple inclusions of the same h file

void uart2_setup();
void transmit(char ch);
void transmit_instruction();
void test_instruction(uint8_t opcd, uint8_t select, uint16_t oprnd1, uint16_t oprnd2);
void print_instruction();

// instructions







#endif