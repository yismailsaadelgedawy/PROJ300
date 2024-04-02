// functions file
#include "functions.hpp"
#include "mbed.h"
#include <cstdint>
#include <cstdlib>
#include "string"
#include "iostream"

// USART2
UnbufferedSerial uart2(PD_5, PD_6);

// the 6 bytes to be transmitted
uint8_t opcode;     // uint8_t = unsigned char
uint8_t sel;
uint8_t op1h;
uint8_t op1l;
uint8_t op2h;
uint8_t op2l;

// the two "raw" operands
uint16_t op1;
uint16_t op2;


// typedefs - where names are assigned specific addresses according to the memory map

// General purpose registers
typedef enum {r0=0x0000,r1=0x1000,r2=0x2000,r3=0x3000,r4=0x4000,r5=0x5000,r6=0x6000,r7=0x7000,r8=0x8000,r9=0x9000,r10=0xA000,r11=0xB000,r12=0xC000} gpr_t;

// Memory mapped registers
typedef enum {led=0x401,keyboard_input,audio,vga_row,vga_column,sprite_mov,vga_sel,vga_colour} mmr_t;

// stack releated section
string var_names[2996];
uint16_t var_values[2996];
uint16_t stack_addr[2996]; // stack address counter; starts at boundary address of stack memory
uint16_t str_idx = 0;
uint16_t ldr_idx = 0;

 



void uart2_setup() {

    uart2.baud(9600);    // WARNING: does not work properly below 9600 baud (e.g. 300 baud)
                         // tested using scope
    uart2.format(
        /* bits */ 8,
        /* parity */ SerialBase::None,
        /* stop bit */ 1
    );

}

void transmit(char ch) {

    // wait until TXE bit is high (transferred data to shift register)
    // i.e. wait until Tx buffer is empty
    while(!(USART2->SR & 0x80)) {} 
        
    // places byte in DR
    // clears the TXE bit automatically
    USART2->DR = ch;

    wait_us(100000);   // 100ms delay

}

void transmit_instruction() {

    op1h = op1 >> 8;
    op1l = op1 & 0x00FF;
    op2h = op2 >> 8;
    op2l = op2 & 0x00FF;

    transmit(opcode);
    transmit(sel);
    transmit(op1h);
    transmit(op1l);
    transmit(op2h);
    transmit(op2l);

    print_instruction();
}

void transmit_ALinstruction() {

    transmit(opcode);
    transmit(sel);
    transmit(op1h);
    transmit(op1l);
    transmit(op2h);
    transmit(op2l);

    print_instruction();
}

void test_instruction(uint8_t opcd, uint8_t select, uint16_t oprnd1, uint16_t oprnd2) {

    op1 = oprnd1;
    op2 = oprnd2;

    opcode = opcd;
    sel = select;
    op1h = op1 >> 8;
    op1l = op1 & 0x00FF;
    op2h = op2 >> 8;
    op2l = op2 & 0x00FF;

    printf("opcode: %x \n",opcode);
    printf("sel: %x \n",sel);
    printf("op1h: %x \n",op1h);
    printf("op1l: %x \n",op1l);
    printf("op2h: %x \n",op2h);
    printf("op2l: %x \n",op2l);


}

void print_instruction() {

    printf("opcode: %x \n",opcode);
    printf("sel: %x \n",sel);
    printf("op1h: %x \n",op1h);
    printf("op1l: %x \n",op1l);
    printf("op2h: %x \n",op2h);
    printf("op2l: %x \n\n",op2l);
}

// instructions
// will make heavy use of function overloading - redefinition of function
// with differing arguments

// example: nop()
void nop() {

    opcode = 0x00;
    sel = 0x00;
    op1 = 0x0000;
    op2 = 0x0000;    

    transmit_instruction();   

}

// example: mov(r0, 5)
void mov(gpr_t gpr, uint16_t literal) {

    opcode = 0x01;
    sel = 0x00;
    op1 = gpr;
    op2 = literal;

    transmit_instruction();

}
// example: move(r0, r1)
void mov(gpr_t gpr1, gpr_t gpr2) {

    opcode = 0x01;
    sel = 0x01;
    op1 = gpr1;
    op2 = gpr2;

    transmit_instruction();

}

// example: str(r0, 0x44C)
void str(gpr_t gpr, uint16_t addr) {

    opcode = 0x03;
    sel = 0x00;
    op1 = gpr;
    op2 = addr;

    transmit_instruction();

}
// example: str(2, 0x44C)
void str(uint16_t literal, uint16_t addr) {

    opcode = 0x03;
    sel = 0x01;
    op1 = literal;
    op2 = addr;

    transmit_instruction();

}
// example: word("myvar", 25)
void word(string var_name, uint16_t var_value) {

    var_names[str_idx] = var_name;
    var_values[str_idx] = var_value;
    stack_addr[str_idx] = 0x44C + str_idx; // boundary address for stack mem is 0x44C

    // implicitly calls str
    str(var_value,stack_addr[str_idx]);

    str_idx++;

    cout << "Variable stored on stack is: " << var_names[str_idx] << "with value: " << var_values[str_idx] << "at address: " << stack_addr[str_idx] << endl;


}

// example: ldr(r0, 0x44C)
void ldr(gpr_t gpr, uint16_t addr) {

    opcode = 0x02;
    sel = 0x00;
    op1 = gpr;
    op2 = addr;

    transmit_instruction();

}
// example: ldr(r0, "[]", 0x44C)
void ldr(gpr_t gpr, string a, uint16_t deref_addr) {

    opcode = 0x03;
    sel = 0x01;
    op1 = gpr;
    op2 = deref_addr;

    transmit_instruction();

}
// example: ldr(r0, num1)
void ldr(gpr_t gpr, string var_name) {

    for(int i=0; i<2996; i++) {

        if(var_names[i] == var_name) {

            ldr_idx = i;
            break;
        }
    }

    // implicity calls ldr
    ldr(gpr,"[]",stack_addr[ldr_idx]);

    

    cout << "Variable loaded from stack is: " << var_names[ldr_idx] << "with value: " << var_values[ldr_idx] << "at address: " << stack_addr[ldr_idx] << endl;


}

// example: cmp(r0, 1)
void cmp(gpr_t gpr, uint16_t literal) {

    opcode = 0x04;
    sel = 0x02;
    op1 = gpr;
    op2 = literal;

    transmit_instruction();

}
// example: cmp(r0, r1)
void cmp(gpr_t gpr1, gpr_t gpr2) {

    opcode = 0x04;
    sel = 0x03;
    op1 = gpr1;
    op2 = gpr2;

    transmit_instruction();

}

// example: b(61)
void b(uint16_t addr) {

    opcode = 0x05;
    sel = 0x00; // dc
    op1 = 0x00; // dc
    op2 = addr;

    transmit_instruction();

}

// example: bgt(61)
void bgt(uint16_t addr) {

    opcode = 0x06;
    sel = 0x00; // dc
    op1 = 0x00; // dc
    op2 = addr;

    transmit_instruction();

}

// example: blt(61)
void blt(uint16_t addr) {

    opcode = 0x07;
    sel = 0x00; // dc
    op1 = 0x00; // dc
    op2 = addr;

    transmit_instruction();

}

// example: beq(61)
void beq(uint16_t addr) {

    opcode = 0x08;
    sel = 0x00; // dc
    op1 = 0x00; // dc
    op2 = addr;

    transmit_instruction();

}

// example:
void add(gpr_t gpr, uint16_t literal1, uint16_t literal2) {

    opcode = 0x09;
    sel = 0x00;
    op1 = 0x00;

    
    op1h = (gpr >> 8) | (literal1 >> 8);
    op1l = op1 & 0x00FF;
    op2h = op2 >> 8;
    op2l = op2 & 0x0FF;

    

    transmit_ALinstruction();

}




