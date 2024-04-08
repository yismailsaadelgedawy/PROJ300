// functions file
#include "functions.hpp"

// USART2
UnbufferedSerial uart2(PD_5, PD_6);

// instruction counter
uint16_t instruction_cnt = 1;

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



// stack releated section
string var_names[2996];
uint16_t var_values[2996];
uint16_t stack_addr[2996]; // stack address counter; starts at boundary address of stack memory
uint16_t str_idx = 0;
uint16_t ldr_idx = 0;

void programming_start() {
    printf("\033[38;5;229m"); // pale yellow
    printf("\n--------- PROGRAMMING CPU... ---------\n");
}

void programming_end() {
    printf("\n--------- PROGRAMMING COMPLETE! ---------\n");
}


void clear_terminal() {
    // clear terminal and move cursor to (0,0)
    printf("\033[2J"); printf("\033[H");
} 

void stack_usage() {

    cout << "\n////////////////////////////////////////////////////////" << endl << endl;
    cout << "\nThe variables stored on the stack are:" << endl << endl;

    for(int i=0;i<str_idx;i++) {

        cout << var_names[i] << " ";

    }

    cout << "\nTheir values: " << endl;

    for(int i=0;i<str_idx;i++) {

        cout << var_values[i] << " ";

    }

    cout << "\nTheir addresses: " << endl;

    for(int i=0;i<str_idx;i++) {

        printf("%03x ",stack_addr[i]);

    }

    cout << "\n\n////////////////////////////////////////////////////////" << endl << endl;
    


}
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

    wait_us(10000);   // 10ms delay


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

    print_instruction();

}

void print_instruction() {
    
    printf("\n%d: ", instruction_cnt);
    printf("%04x, ",opcode);            // print 4 digits, with trailing zeros if needed
    printf("%02x, ",sel);
    printf("%02x",op1h);
    printf("%02x, ",op1l);
    printf("%02x",op2h);
    printf("%02x\n\n",op2l);

    instruction_cnt++;
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
// example: mov(r0, r1)
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
// example: str(r0, vga_colour)
void str(gpr_t gpr, mmr_t mmr) {

    if(mmr == keyboard_input || mmr == vga_row || mmr == vga_column) {

        printf("\nERROR: ATTEMPTING TO WRITE TO READ ONLY REGISTER\n");
        sleep();

    }

    opcode = 0x03;
    sel = 0x00;
    op1 = gpr;
    op2 = mmr;

    transmit_instruction();

}
// example: str(2, vga_colour)
void str(uint16_t literal, mmr_t mmr) {

    if(mmr == keyboard_input || mmr == vga_row || mmr == vga_column) {

        printf("\nERROR: ATTEMPTING TO WRITE TO READ ONLY REGISTER\n");
        sleep();

    }

    opcode = 0x03;
    sel = 0x01;
    op1 = literal;
    op2 = mmr;

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

    opcode = 0x02;
    sel = 0x01;
    op1 = gpr;
    op2 = deref_addr;

    transmit_instruction();

}
// example: ldr(r0, vga_colour)
void ldr(gpr_t gpr, mmr_t mmr) {

    opcode = 0x02;
    sel = 0x00;
    op1 = gpr;
    op2 = mmr;

    transmit_instruction();

}
// example: ldr(r0, "[]", vga_colour)
void ldr(gpr_t gpr, string a, mmr_t deref_mmr) {

    opcode = 0x02;
    sel = 0x01;
    op1 = gpr;
    op2 = deref_mmr;

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

// example: add(r2, 11,10)
void add(gpr_t gpr_result, uint16_t literal1, uint16_t literal2) {

    opcode = 0x09;
    sel = 0x00;
    op1 = literal1;
    op2 = literal2;
    
    op1h = (gpr_result >> 8) | (literal1 >> 8);
    op1l = op1 & 0x00FF;
    op2h = op2 >> 8;
    op2l = op2 & 0x00FF;    

    transmit_ALinstruction();

}
// example: add(r2, 11,r0)
void add(gpr_t gpr_result, uint16_t literal1, gpr_t gpr_op2) {

    opcode = 0x09;
    sel = 0x01;
    op1 = literal1;
    op2 = gpr_op2;
    
    op1h = (gpr_result >> 8) | (literal1 >> 8);
    op1l = op1 & 0x00FF;
    op2h = op2 >> 12;
    op2l = 0x00;    // dc    

    transmit_ALinstruction();

}
// example: add(r2, r1,10)
void add(gpr_t gpr_result, gpr_t gpr_op1, uint16_t literal2) {

    opcode = 0x09;
    sel = 0x02;
    op1 = gpr_op1;
    op2 = literal2;
    
    op1h = (gpr_result >> 8) | (gpr_op1 >> 12);
    op1l = op1 & 0x00FF;
    op2h = op2 >> 8;
    op2l = op2 & 0x00FF;

    transmit_ALinstruction();

}
// example: add(r2, r1,r1)
void add(gpr_t gpr_result, gpr_t gpr_op1, gpr_t gpr_op2) {

    opcode = 0x09;
    sel = 0x03;
    op1 = gpr_op1;
    op2 = gpr_op2;
    
    op1h = (gpr_result >> 8) | (gpr_op1 >> 12);
    op1l = op1 & 0x00FF;
    op2h = op2 >> 12;
    op2l = op2 & 0x00FF;

    transmit_ALinstruction();

}

// example: sub(r2, 11,10)
void sub(gpr_t gpr_result, uint16_t literal1, uint16_t literal2) {

    opcode = 0x0A;
    sel = 0x00;
    op1 = literal1;
    op2 = literal2;
    
    op1h = (gpr_result >> 8) | (literal1 >> 8);
    op1l = op1 & 0x00FF;
    op2h = op2 >> 8;
    op2l = op2 & 0x00FF;    

    transmit_ALinstruction();

}
// example: sub(r2, 11,r0)
void sub(gpr_t gpr_result, uint16_t literal1, gpr_t gpr_op2) {

    opcode = 0x0A;
    sel = 0x01;
    op1 = literal1;
    op2 = gpr_op2;
    
    op1h = (gpr_result >> 8) | (literal1 >> 8);
    op1l = op1 & 0x00FF;
    op2h = op2 >> 12;
    op2l = 0x00;    // dc    

    transmit_ALinstruction();

}
// example: sub(r2, r1,10)
void sub(gpr_t gpr_result, gpr_t gpr_op1, uint16_t literal2) {

    opcode = 0x0A;
    sel = 0x02;
    op1 = gpr_op1;
    op2 = literal2;
    
    op1h = (gpr_result >> 8) | (gpr_op1 >> 12);
    op1l = op1 & 0x00FF;
    op2h = op2 >> 8;
    op2l = op2 & 0x00FF;

    transmit_ALinstruction();

}
// example: sub(r2, r1,r1)
void sub(gpr_t gpr_result, gpr_t gpr_op1, gpr_t gpr_op2) {

    opcode = 0x0A;
    sel = 0x03;
    op1 = gpr_op1;
    op2 = gpr_op2;
    
    op1h = (gpr_result >> 8) | (gpr_op1 >> 12);
    op1l = op1 & 0x00FF;
    op2h = op2 >> 12;
    op2l = op2 & 0x00FF;

    transmit_ALinstruction();

}

// example: mul(r2, 11,10)
void mul(gpr_t gpr_result, uint16_t literal1, uint16_t literal2) {

    opcode = 0x0B;
    sel = 0x00;
    op1 = literal1;
    op2 = literal2;
    
    op1h = (gpr_result >> 8) | (literal1 >> 8);
    op1l = op1 & 0x00FF;
    op2h = op2 >> 8;
    op2l = op2 & 0x00FF;    

    transmit_ALinstruction();

}
// example: mul(r2, 11,r0)
void mul(gpr_t gpr_result, uint16_t literal1, gpr_t gpr_op2) {

    opcode = 0x0B;
    sel = 0x01;
    op1 = literal1;
    op2 = gpr_op2;
    
    op1h = (gpr_result >> 8) | (literal1 >> 8);
    op1l = op1 & 0x00FF;
    op2h = op2 >> 12;
    op2l = 0x00;    // dc    

    transmit_ALinstruction();

}
// example: mul(r2, r1,10)
void mul(gpr_t gpr_result, gpr_t gpr_op1, uint16_t literal2) {

    opcode = 0x0B;
    sel = 0x02;
    op1 = gpr_op1;
    op2 = literal2;
    
    op1h = (gpr_result >> 8) | (gpr_op1 >> 12);
    op1l = op1 & 0x00FF;
    op2h = op2 >> 8;
    op2l = op2 & 0x00FF;

    transmit_ALinstruction();

}
// example: mul(r2, r1,r1)
void mul(gpr_t gpr_result, gpr_t gpr_op1, gpr_t gpr_op2) {

    opcode = 0x0B;
    sel = 0x03;
    op1 = gpr_op1;
    op2 = gpr_op2;
    
    op1h = (gpr_result >> 8) | (gpr_op1 >> 12);
    op1l = op1 & 0x00FF;
    op2h = op2 >> 12;
    op2l = op2 & 0x00FF;

    transmit_ALinstruction();

}

// example: lsr(r2, r1,1)
void lsr(gpr_t gpr_result, gpr_t gpr_op1, uint16_t literal2) {

    opcode = 0x0C;
    sel = 0x02;
    op1 = gpr_op1;
    op2 = literal2;
    
    op1h = (gpr_result >> 8) | (gpr_op1 >> 12);
    op1l = op1 & 0x00FF;
    op2h = op2 >> 8;
    op2l = op2 & 0x00FF;

    transmit_ALinstruction();

}

// example: AND(r2, 11,10)
void AND(gpr_t gpr_result, uint16_t literal1, uint16_t literal2) {

    opcode = 0x0D;
    sel = 0x00;
    op1 = literal1;
    op2 = literal2;
    
    op1h = (gpr_result >> 8) | (literal1 >> 8);
    op1l = op1 & 0x00FF;
    op2h = op2 >> 8;
    op2l = op2 & 0x00FF;    

    transmit_ALinstruction();

}
// example: AND(r2, 11,r0)
void AND(gpr_t gpr_result, uint16_t literal1, gpr_t gpr_op2) {

    opcode = 0x0D;
    sel = 0x01;
    op1 = literal1;
    op2 = gpr_op2;
    
    op1h = (gpr_result >> 8) | (literal1 >> 8);
    op1l = op1 & 0x00FF;
    op2h = op2 >> 12;
    op2l = 0x00;    // dc    

    transmit_ALinstruction();

}
// example: AND(r2, r1,10)
void AND(gpr_t gpr_result, gpr_t gpr_op1, uint16_t literal2) {

    opcode = 0x0D;
    sel = 0x02;
    op1 = gpr_op1;
    op2 = literal2;
    
    op1h = (gpr_result >> 8) | (gpr_op1 >> 12);
    op1l = op1 & 0x00FF;
    op2h = op2 >> 8;
    op2l = op2 & 0x00FF;

    transmit_ALinstruction();

}
// example: AND(r2, r1,r1)
void AND(gpr_t gpr_result, gpr_t gpr_op1, gpr_t gpr_op2) {

    opcode = 0x0D;
    sel = 0x03;
    op1 = gpr_op1;
    op2 = gpr_op2;
    
    op1h = (gpr_result >> 8) | (gpr_op1 >> 12);
    op1l = op1 & 0x00FF;
    op2h = op2 >> 12;
    op2l = op2 & 0x00FF;

    transmit_ALinstruction();

}

// example: OR(r2, 11,10)
void OR(gpr_t gpr_result, uint16_t literal1, uint16_t literal2) {

    opcode = 0x0E;
    sel = 0x00;
    op1 = literal1;
    op2 = literal2;
    
    op1h = (gpr_result >> 8) | (literal1 >> 8);
    op1l = op1 & 0x00FF;
    op2h = op2 >> 8;
    op2l = op2 & 0x00FF;    

    transmit_ALinstruction();

}
// example: OR(r2, 11,r0)
void OR(gpr_t gpr_result, uint16_t literal1, gpr_t gpr_op2) {

    opcode = 0x0E;
    sel = 0x01;
    op1 = literal1;
    op2 = gpr_op2;
    
    op1h = (gpr_result >> 8) | (literal1 >> 8);
    op1l = op1 & 0x00FF;
    op2h = op2 >> 12;
    op2l = 0x00;    // dc    

    transmit_ALinstruction();

}
// example: OR(r2, r1,10)
void OR(gpr_t gpr_result, gpr_t gpr_op1, uint16_t literal2) {

    opcode = 0x0E;
    sel = 0x02;
    op1 = gpr_op1;
    op2 = literal2;
    
    op1h = (gpr_result >> 8) | (gpr_op1 >> 12);
    op1l = op1 & 0x00FF;
    op2h = op2 >> 8;
    op2l = op2 & 0x00FF;

    transmit_ALinstruction();

}
// example: OR(r2, r1,r1)
void OR(gpr_t gpr_result, gpr_t gpr_op1, gpr_t gpr_op2) {

    opcode = 0x0E;
    sel = 0x03;
    op1 = gpr_op1;
    op2 = gpr_op2;
    
    op1h = (gpr_result >> 8) | (gpr_op1 >> 12);
    op1l = op1 & 0x00FF;
    op2h = op2 >> 12;
    op2l = op2 & 0x00FF;

    transmit_ALinstruction();

}

// example: mvn(r0, 0)
void mvn(gpr_t gpr, uint16_t literal) {

    opcode = 0x0F;
    sel = 0x00;
    op1 = gpr;
    op2 = literal;

    transmit_instruction();

}
// example: mvn(r2, r1)
void mvn(gpr_t gpr1, gpr_t gpr2) {

    opcode = 0x0F;
    sel = 0x01;
    op1 = gpr1;
    op2 = gpr2;

    transmit_instruction();

}






