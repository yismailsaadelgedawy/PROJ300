`timescale 1ns/1ns
module TopLevel_tb;

// this tests the CPU connected to memory (full system)

// internal wires

// in
logic rst, clk;

// inst and wiring
TopLevel dut (

    // in
    .rst(rst),
    .clk(clk)

);

// clock
always begin

    clk <= 1;
    #5ns;
    clk <= 0;
    #5ns;

end


// makes debugging easier when testbenching
// fetch1=6'd0 not fetch1=0, since that is implied as fetch1=32'd0!!
typedef enum logic [5:0] {

    fetch1=6'd0,fetch2,fetch3,nop1,mov1,ALTmov1,ALTmov2,ldr1,ldr2,ALTldr1,ALTldr2,ALTldr3,ALTldr4,str1,str2,str3,str4,
    ALTstr1,ALTstr2,ALTstr3,ALTstr4,cmp1,b1,bgt1,blt1,beq1,add1,add2,sub1,sub2,mul1,mul2,lsr1,lsr2,and1,and2,or1,or2,mvn1,mvn2

} CPUstate_t;

// loop var
int unsigned i;

// keep track of assertion fails
int unsigned err;


// testing
initial begin

    $display("\n\n");

    // rst
    rst = 1;
    #7ns;
    assert(dut.b2v_inst27.CPUstate == fetch1) else begin $error("failed rst"); err++; end
    #3ns;

    ///////////////////////////////////////////

    // fetch (2 cycles since we are already at fetch1 upon rst)
    rst = 0;
    #17ns;
    assert(dut.b2v_inst27.CPUstate == fetch3) else begin $error("failed fetch"); err++; end
    assert(dut.IR == 4'b0000 && dut.rop1 == 16'h0000 && dut.rop2 == 16'h0000 && dut.rsel == 2'b00) else begin $error("failed fetch"); err++; end
    assert(dut.PC == 'd1) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    // nop (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == nop1) else begin $error("failed nop"); err++; end
    assert(dut.PC == 'd1) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    // fetch (3 cycles)
    rst = 0;
    #27ns;
    assert(dut.b2v_inst27.CPUstate == fetch3) else begin $error("failed fetch"); err++; end
    //assert( {dut.IR,dut.rsel,dut.rop1,dut.rop2} == {4'b0001,2'b00,16'h0000,16'h0001} ) else begin $error("failed fetch"); err++; end
    assert(dut.PC == 'd2) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd2) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    // fetch (3 cycles)
    rst = 0;
    #27ns;
    assert(dut.b2v_inst27.CPUstate == fetch3) else begin $error("failed fetch"); err++; end
    //assert( {dut.IR,dut.rsel,dut.rop1,dut.rop2} == {4'b0001,2'b00,16'h1000,16'h0002} ) else begin $error("failed fetch"); err++; end
    assert(dut.PC == 'd3) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd3) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    // fetch (3 cycles)
    rst = 0;
    #27ns;
    assert(dut.b2v_inst27.CPUstate == fetch3) else begin $error("failed fetch"); err++; end
    //assert( {dut.IR,dut.rsel,dut.rop1,dut.rop2} == {4'b0001,2'b00,16'h2000,16'h0003} ) else begin $error("failed fetch"); err++; end
    assert(dut.PC == 'd4) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd4) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    // fetch (3 cycles)
    rst = 0;
    #27ns;
    assert(dut.b2v_inst27.CPUstate == fetch3) else begin $error("failed fetch"); err++; end
    //assert( {dut.IR,dut.rsel,dut.rop1,dut.rop2} == {4'b0001,2'b00,16'h3000,16'h0004} ) else begin $error("failed fetch"); err++; end
    assert(dut.PC == 'd5) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd5) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    // fetch (3 cycles)
    rst = 0;
    #27ns;
    assert(dut.b2v_inst27.CPUstate == fetch3) else begin $error("failed fetch"); err++; end
    //assert( {dut.IR,dut.rsel,dut.rop1,dut.rop2} == {4'b0001,2'b00,16'h4000,16'h0005} ) else begin $error("failed fetch"); err++; end
    assert(dut.PC == 'd6) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd6) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    // fetch (3 cycles)
    rst = 0;
    #27ns;
    assert(dut.b2v_inst27.CPUstate == fetch3) else begin $error("failed fetch"); err++; end
    //assert( {dut.IR,dut.rsel,dut.rop1,dut.rop2} == {4'b0001,2'b00,16'h5000,16'h0006} ) else begin $error("failed fetch"); err++; end
    assert(dut.PC == 'd7) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd7) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    // fetch (3 cycles)
    rst = 0;
    #27ns;
    assert(dut.b2v_inst27.CPUstate == fetch3) else begin $error("failed fetch"); err++; end
    //assert( {dut.IR,dut.rsel,dut.rop1,dut.rop2} == {4'b0001,2'b00,16'h6000,16'h0007} ) else begin $error("failed fetch"); err++; end
    assert(dut.PC == 'd8) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd8) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    // fetch (3 cycles)
    rst = 0;
    #27ns;
    assert(dut.b2v_inst27.CPUstate == fetch3) else begin $error("failed fetch"); err++; end
    //assert( {dut.IR,dut.rsel,dut.rop1,dut.rop2} == {4'b0001,2'b00,16'h7000,16'h0008} ) else begin $error("failed fetch"); err++; end
    assert(dut.PC == 'd9) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd9) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    // fetch (3 cycles)
    rst = 0;
    #27ns;
    assert(dut.b2v_inst27.CPUstate == fetch3) else begin $error("failed fetch"); err++; end
    //assert( {dut.IR,dut.rsel,dut.rop1,dut.rop2} == {4'b0001,2'b00,16'h8000,16'h0009} ) else begin $error("failed fetch"); err++; end
    assert(dut.PC == 'd10) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd10) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    // fetch (3 cycles)
    rst = 0;
    #27ns;
    assert(dut.b2v_inst27.CPUstate == fetch3) else begin $error("failed fetch"); err++; end
    //assert( {dut.IR,dut.rsel,dut.rop1,dut.rop2} == {4'b0001,2'b00,16'h9000,16'h000A} ) else begin $error("failed fetch"); err++; end
    assert(dut.PC == 'd11) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd11) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    // fetch (3 cycles)
    rst = 0;
    #27ns;
    assert(dut.b2v_inst27.CPUstate == fetch3) else begin $error("failed fetch"); err++; end
    //assert( {dut.IR,dut.rsel,dut.rop1,dut.rop2} == {4'b0001,2'b00,16'hA000,16'h000B} ) else begin $error("failed fetch"); err++; end
    assert(dut.PC == 'd12) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd12) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    // fetch (3 cycles)
    rst = 0;
    #27ns;
    assert(dut.b2v_inst27.CPUstate == fetch3) else begin $error("failed fetch"); err++; end
    //assert( {dut.IR,dut.rsel,dut.rop1,dut.rop2} == {4'b0001,2'b00,16'hB000,16'h000C} ) else begin $error("failed fetch"); err++; end
    assert(dut.PC == 'd13) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd13) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    // fetch (3 cycles)
    rst = 0;
    #27ns;
    assert(dut.b2v_inst27.CPUstate == fetch3) else begin $error("failed fetch"); err++; end
    //assert( {dut.IR,dut.rsel,dut.rop1,dut.rop2} == {4'b0001,2'b00,16'hC000,16'h000D} ) else begin $error("failed fetch"); err++; end
    assert(dut.PC == 'd14) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd14) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;


    // checking that GPRs have been loaded correctly //
    assert(dut.b2v_inst18.regA == 1)  else begin $error("mov r0,   #1"); err++; end
    assert(dut.b2v_inst18.regB == 2)  else begin $error("mov r1,   #2"); err++; end
    assert(dut.b2v_inst18.regC == 3)  else begin $error("mov r2,   #3"); err++; end
    assert(dut.b2v_inst18.regD == 4)  else begin $error("mov r3,   #4"); err++; end
    assert(dut.b2v_inst18.regE == 5)  else begin $error("mov r4,   #5"); err++; end
    assert(dut.b2v_inst18.regF == 6)  else begin $error("mov r5,   #6"); err++; end
    assert(dut.b2v_inst18.regG == 7)  else begin $error("mov r6,   #7"); err++; end
    assert(dut.b2v_inst18.regH == 8)  else begin $error("mov r7,   #8"); err++; end
    assert(dut.b2v_inst18.regI == 9)  else begin $error("mov r8,   #9"); err++; end
    assert(dut.b2v_inst18.regJ == 10) else begin $error("mov r9,   #10"); err++; end
    assert(dut.b2v_inst18.regK == 11) else begin $error("mov r10,  #11"); err++; end
    assert(dut.b2v_inst18.regL == 12) else begin $error("mov r11,  #12"); err++; end
    //assert(dut.b2v_inst18.regM == 13) else begin $error("failed r12"); err++; end         this passes 1 cycle later; no problems
    

    ///////////////////////////////////////////    

    #30ns;  // fetch instruction

    // ALTmov (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == ALTmov2) else begin $error("failed ALTmov"); err++; end    
    assert(dut.PC == 'd15) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTmov (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == ALTmov2) else begin $error("failed ALTmov"); err++; end    
    assert(dut.PC == 'd16) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTmov (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == ALTmov2) else begin $error("failed ALTmov"); err++; end    
    assert(dut.PC == 'd17) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTmov (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == ALTmov2) else begin $error("failed ALTmov"); err++; end    
    assert(dut.PC == 'd18) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTmov (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == ALTmov2) else begin $error("failed ALTmov"); err++; end    
    assert(dut.PC == 'd19) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTmov (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == ALTmov2) else begin $error("failed ALTmov"); err++; end    
    assert(dut.PC == 'd20) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTmov (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == ALTmov2) else begin $error("failed ALTmov"); err++; end    
    assert(dut.PC == 'd21) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTmov (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == ALTmov2) else begin $error("failed ALTmov"); err++; end    
    assert(dut.PC == 'd22) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTmov (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == ALTmov2) else begin $error("failed ALTmov"); err++; end    
    assert(dut.PC == 'd23) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTmov (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == ALTmov2) else begin $error("failed ALTmov"); err++; end    
    assert(dut.PC == 'd24) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTmov (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == ALTmov2) else begin $error("failed ALTmov"); err++; end    
    assert(dut.PC == 'd25) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTmov (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == ALTmov2) else begin $error("failed ALTmov"); err++; end    
    assert(dut.PC == 'd26) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTmov (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == ALTmov2) else begin $error("failed ALTmov"); err++; end    
    assert(dut.PC == 'd27) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;


    // checking that GPRs have been loaded correctly //
    assert(dut.b2v_inst18.regA == 2)  else begin $error("mov r0,  r1"); err++; end
    assert(dut.b2v_inst18.regB == 3)  else begin $error("mov r1,  r2"); err++; end
    assert(dut.b2v_inst18.regC == 4)  else begin $error("mov r2,  r3"); err++; end
    assert(dut.b2v_inst18.regD == 5)  else begin $error("mov r3,  r4"); err++; end
    assert(dut.b2v_inst18.regE == 6)  else begin $error("mov r4,  r5"); err++; end
    assert(dut.b2v_inst18.regF == 7)  else begin $error("mov r5,  r6"); err++; end
    assert(dut.b2v_inst18.regG == 8)  else begin $error("mov r6,  r7"); err++; end
    assert(dut.b2v_inst18.regH == 9)  else begin $error("mov r7,  r8"); err++; end
    assert(dut.b2v_inst18.regI == 10) else begin $error("mov r8,  r9"); err++; end
    assert(dut.b2v_inst18.regJ == 11) else begin $error("mov r9,  r10"); err++; end
    assert(dut.b2v_inst18.regK == 12) else begin $error("mov r10,  r11"); err++; end
    assert(dut.b2v_inst18.regL == 13)  else begin $error("mov r11,  r12"); err++; end
    //assert(dut.b2v_inst18.regM == 2)  else begin $error("mov r12,  r0"); err++; end       true 1 cycle later

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // str (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == str4) else begin $error("failed str"); err++; end    
    assert(dut.PC == 'd28) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.AR == 12'h44C) else begin $error("failed address 0x44C"); err++; end
    assert(dut.MEM == dut.b2v_inst18.regA) else begin $error("failed str r0,  0x44C"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // str (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == str4) else begin $error("failed str"); err++; end    
    assert(dut.PC == 'd29) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.AR == 12'h44D) else begin $error("failed address 0x44D"); err++; end
    assert(dut.MEM == dut.b2v_inst18.regB) else begin $error("failed str r1,  0x44D"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // str (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == str4) else begin $error("failed str"); err++; end    
    assert(dut.PC == 'd30) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.AR == 12'h44E) else begin $error("failed address 0x44E"); err++; end
    assert(dut.MEM == dut.b2v_inst18.regC) else begin $error("failed str r2,  0x44E"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // str (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == str4) else begin $error("failed str"); err++; end    
    assert(dut.PC == 'd31) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.AR == 12'h44F) else begin $error("failed address 0x44F"); err++; end
    assert(dut.MEM == dut.b2v_inst18.regD) else begin $error("failed str r3,  0x44F"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // str (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == str4) else begin $error("failed str"); err++; end    
    assert(dut.PC == 'd32) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.AR == 12'h450) else begin $error("failed address 0x450"); err++; end
    assert(dut.MEM == dut.b2v_inst18.regE) else begin $error("failed str r4,  0x450"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // str (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == str4) else begin $error("failed str"); err++; end    
    assert(dut.PC == 'd33) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.AR == 12'h451) else begin $error("failed address 0x451"); err++; end
    assert(dut.MEM == dut.b2v_inst18.regF) else begin $error("failed str r5,  0x451"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // str (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == str4) else begin $error("failed str"); err++; end    
    assert(dut.PC == 'd34) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.AR == 12'h452) else begin $error("failed address 0x452"); err++; end
    assert(dut.MEM == dut.b2v_inst18.regG) else begin $error("failed str r6,  0x452"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // str (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == str4) else begin $error("failed str"); err++; end    
    assert(dut.PC == 'd35) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.AR == 12'h453) else begin $error("failed address 0x453"); err++; end
    assert(dut.MEM == dut.b2v_inst18.regH) else begin $error("failed str r7,  0x453"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // str (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == str4) else begin $error("failed str"); err++; end    
    assert(dut.PC == 'd36) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.AR == 12'h454) else begin $error("failed address 0x454"); err++; end
    assert(dut.MEM == dut.b2v_inst18.regI) else begin $error("failed str r8,  0x454"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // str (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == str4) else begin $error("failed str"); err++; end    
    assert(dut.PC == 'd37) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.AR == 12'h455) else begin $error("failed address 0x455"); err++; end
    assert(dut.MEM == dut.b2v_inst18.regJ) else begin $error("failed str r9,  0x455"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // str (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == str4) else begin $error("failed str"); err++; end    
    assert(dut.PC == 'd38) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.AR == 12'h456) else begin $error("failed address 0x456"); err++; end
    assert(dut.MEM == dut.b2v_inst18.regK) else begin $error("failed str r10,  0x456"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // str (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == str4) else begin $error("failed str"); err++; end    
    assert(dut.PC == 'd39) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.AR == 12'h457) else begin $error("failed address 0x457"); err++; end
    assert(dut.MEM == dut.b2v_inst18.regL) else begin $error("failed str r11,  0x457"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // str (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == str4) else begin $error("failed str"); err++; end    
    assert(dut.PC == 'd40) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.AR == 12'h458) else begin $error("failed address 0x458"); err++; end
    assert(dut.MEM == dut.b2v_inst18.regM) else begin $error("failed str r12,  0x458"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTstr (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == ALTstr4) else begin $error("failed str"); err++; end    
    assert(dut.PC == 'd41) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.AR == 12'h459) else begin $error("failed address 0x459"); err++; end
    assert(dut.MEM == 'd1) else begin $error("failed str #1,  0x459"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTstr (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == ALTstr4) else begin $error("failed str"); err++; end    
    assert(dut.PC == 'd42) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.AR == 12'h45A) else begin $error("failed address 0x45A"); err++; end
    assert(dut.MEM == 'd2) else begin $error("failed str #2,  0x45A"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTstr (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == ALTstr4) else begin $error("failed str"); err++; end    
    assert(dut.PC == 'd43) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.AR == 12'h45B) else begin $error("failed address 0x45B"); err++; end
    assert(dut.MEM == 'd3) else begin $error("failed str #3,  0x45B"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTstr (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == ALTstr4) else begin $error("failed str"); err++; end    
    assert(dut.PC == 'd44) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.AR == 12'h45C) else begin $error("failed address 0x45C"); err++; end
    assert(dut.MEM == 'd4) else begin $error("failed str #4,  0x45C"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTstr (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == ALTstr4) else begin $error("failed str"); err++; end    
    assert(dut.PC == 'd45) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.AR == 12'h45D) else begin $error("failed address 0x45D"); err++; end
    assert(dut.MEM == 'd5) else begin $error("failed str #5,  0x45D"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTstr (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == ALTstr4) else begin $error("failed str"); err++; end    
    assert(dut.PC == 'd46) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.AR == 12'h45E) else begin $error("failed address 0x45E"); err++; end
    assert(dut.MEM == 'd6) else begin $error("failed str #6,  0x45E"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTstr (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == ALTstr4) else begin $error("failed str"); err++; end    
    assert(dut.PC == 'd47) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.AR == 12'h45F) else begin $error("failed address 0x45F"); err++; end
    assert(dut.MEM == 'd7) else begin $error("failed str #7,  0x45F"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTstr (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == ALTstr4) else begin $error("failed str"); err++; end    
    assert(dut.PC == 'd48) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.AR == 12'h460) else begin $error("failed address 0x460"); err++; end
    assert(dut.MEM == 'd8) else begin $error("failed str #8,  0x460"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTstr (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == ALTstr4) else begin $error("failed str"); err++; end    
    assert(dut.PC == 'd49) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.AR == 12'h461) else begin $error("failed address 0x461"); err++; end
    assert(dut.MEM == 'd9) else begin $error("failed str #9,  0x461"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTstr (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == ALTstr4) else begin $error("failed str"); err++; end    
    assert(dut.PC == 'd50) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.AR == 12'h462) else begin $error("failed address 0x462"); err++; end
    assert(dut.MEM == 'd10) else begin $error("failed str #10,  0x462"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTstr (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == ALTstr4) else begin $error("failed str"); err++; end    
    assert(dut.PC == 'd51) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.AR == 12'h463) else begin $error("failed address 0x463"); err++; end
    assert(dut.MEM == 'd11) else begin $error("failed str #11,  0x463"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTstr (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == ALTstr4) else begin $error("failed str"); err++; end    
    assert(dut.PC == 'd52) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.AR == 12'h464) else begin $error("failed address 0x464"); err++; end
    assert(dut.MEM == 'd12) else begin $error("failed str #12,  0x464"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTstr (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == ALTstr4) else begin $error("failed str"); err++; end    
    assert(dut.PC == 'd53) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.AR == 12'h465) else begin $error("failed address 0x465"); err++; end
    assert(dut.MEM == 'd13) else begin $error("failed str #13,  0x465"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction


    // ldr (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == ldr2) else begin $error("failed ldr"); err++; end    
    assert(dut.PC == 'd54) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ldr (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == ldr2) else begin $error("failed ldr"); err++; end    
    assert(dut.PC == 'd55) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ldr (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == ldr2) else begin $error("failed ldr"); err++; end    
    assert(dut.PC == 'd56) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ldr (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == ldr2) else begin $error("failed ldr"); err++; end    
    assert(dut.PC == 'd57) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ldr (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == ldr2) else begin $error("failed ldr"); err++; end    
    assert(dut.PC == 'd58) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ldr (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == ldr2) else begin $error("failed ldr"); err++; end    
    assert(dut.PC == 'd59) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ldr (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == ldr2) else begin $error("failed ldr"); err++; end    
    assert(dut.PC == 'd60) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ldr (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == ldr2) else begin $error("failed ldr"); err++; end    
    assert(dut.PC == 'd61) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ldr (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == ldr2) else begin $error("failed ldr"); err++; end    
    assert(dut.PC == 'd62) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ldr (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == ldr2) else begin $error("failed ldr"); err++; end    
    assert(dut.PC == 'd63) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ldr (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == ldr2) else begin $error("failed ldr"); err++; end    
    assert(dut.PC == 'd64) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ldr (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == ldr2) else begin $error("failed ldr"); err++; end    
    assert(dut.PC == 'd65) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ldr (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == ldr2) else begin $error("failed ldr"); err++; end    
    assert(dut.PC == 'd66) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    // checking that GPRs have been loaded correctly //
    assert(dut.b2v_inst18.regA == 'h459)  else begin $error("ldr r0,   0x459"); err++; end
    assert(dut.b2v_inst18.regB == 'h45A)  else begin $error("ldr r1,   0x45A"); err++; end
    assert(dut.b2v_inst18.regC == 'h45B)  else begin $error("ldr r2,   0x45B"); err++; end
    assert(dut.b2v_inst18.regD == 'h45C)  else begin $error("ldr r3,   0x45C"); err++; end
    assert(dut.b2v_inst18.regE == 'h45D)  else begin $error("ldr r4,   0x45D"); err++; end
    assert(dut.b2v_inst18.regF == 'h45E)  else begin $error("ldr r5,   0x45E"); err++; end
    assert(dut.b2v_inst18.regG == 'h45F)  else begin $error("ldr r6,   0x45F"); err++; end
    assert(dut.b2v_inst18.regH == 'h460)  else begin $error("ldr r7,   0x460"); err++; end
    assert(dut.b2v_inst18.regI == 'h461)  else begin $error("ldr r8,   0x461"); err++; end
    assert(dut.b2v_inst18.regJ == 'h462)  else begin $error("ldr r9,   0x462"); err++; end
    assert(dut.b2v_inst18.regK == 'h463)  else begin $error("ldr r10,  0x463"); err++; end
    assert(dut.b2v_inst18.regL == 'h464)  else begin $error("ldr r11,  0x464"); err++; end
    //assert(dut.b2v_inst18.regM == h465) else begin $error("ldr r12,  0x465"); err++; end       true 1 cycle later

    ///////////////////////////////////////////

    #30ns;  // fetch instruction


    // ALTldr (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == ALTldr4) else begin $error("failed ALTldr"); err++; end    
    assert(dut.PC == 'd67) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTldr (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == ALTldr4) else begin $error("failed ALTldr"); err++; end     
    assert(dut.PC == 'd68) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTldr (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == ALTldr4) else begin $error("failed ALTldr"); err++; end 
    assert(dut.PC == 'd69) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTldr (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == ALTldr4) else begin $error("failed ALTldr"); err++; end 
    assert(dut.PC == 'd70) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTldr (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == ALTldr4) else begin $error("failed ALTldr"); err++; end 
    assert(dut.PC == 'd71) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTldr (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == ALTldr4) else begin $error("failed ALTldr"); err++; end 
    assert(dut.PC == 'd72) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTldr (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == ALTldr4) else begin $error("failed ALTldr"); err++; end 
    assert(dut.PC == 'd73) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTldr (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == ALTldr4) else begin $error("failed ALTldr"); err++; end 
    assert(dut.PC == 'd74) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTldr (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == ALTldr4) else begin $error("failed ALTldr"); err++; end 
    assert(dut.PC == 'd75) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTldr (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == ALTldr4) else begin $error("failed ALTldr"); err++; end 
    assert(dut.PC == 'd76) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTldr (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == ALTldr4) else begin $error("failed ALTldr"); err++; end 
    assert(dut.PC == 'd77) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTldr (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == ALTldr4) else begin $error("failed ALTldr"); err++; end 
    assert(dut.PC == 'd78) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns;  // fetch instruction

    // ALTldr (4 cycles)
    #37ns;
    assert(dut.b2v_inst27.CPUstate == ALTldr4) else begin $error("failed ALTldr"); err++; end 
    assert(dut.PC == 'd79) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    // checking that GPRs have been loaded correctly //
    assert(dut.b2v_inst18.regA == 'd1)  else begin $error("ldr r0,   [0x459]"); err++; end
    assert(dut.b2v_inst18.regB == 'd2)  else begin $error("ldr r1,   [0x45A]"); err++; end
    assert(dut.b2v_inst18.regC == 'd3)  else begin $error("ldr r2,   [0x45B]"); err++; end
    assert(dut.b2v_inst18.regD == 'd4)  else begin $error("ldr r3,   [0x45C]"); err++; end
    assert(dut.b2v_inst18.regE == 'd5)  else begin $error("ldr r4,   [0x45D]"); err++; end
    assert(dut.b2v_inst18.regF == 'd6)  else begin $error("ldr r5,   [0x45E]"); err++; end
    assert(dut.b2v_inst18.regG == 'd7)  else begin $error("ldr r6,   [0x45F]"); err++; end
    assert(dut.b2v_inst18.regH == 'd8)  else begin $error("ldr r7,   [0x460]"); err++; end
    assert(dut.b2v_inst18.regI == 'd9)  else begin $error("ldr r8,   [0x461]"); err++; end
    assert(dut.b2v_inst18.regJ == 'd10) else begin $error("ldr r9,   [0x462]"); err++; end
    assert(dut.b2v_inst18.regK == 'd11) else begin $error("ldr r10,  [0x463]"); err++; end
    assert(dut.b2v_inst18.regL == 'd12) else begin $error("ldr r11,  [0x464]"); err++; end
    //assert(dut.b2v_inst18.regM == 'd13) else begin $error("ldr r12,  [0x465]"); err++; end       true 1 cycle later

    ///////////////////////////////////////////

    #30ns; // fetch instruction

    // cmp IMMEDIATE (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd80) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regA - 1)) else begin $error("failed AC cmp IMM"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b0110}) else begin $error("failed NZCV"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns; // fetch instruction

    // cmp IMMEDIATE (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd81) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regB - 1)) else begin $error("failed AC cmp IMM"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b0010}) else begin $error("failed NZCV"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns; // fetch instruction

    // cmp IMMEDIATE (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd82) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regC - 1)) else begin $error("failed AC cmp IMM"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b0010}) else begin $error("failed NZCV"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns; // fetch instruction

    // cmp IMMEDIATE (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd83) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regD - 1)) else begin $error("failed AC cmp IMM"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b0010}) else begin $error("failed NZCV"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns; // fetch instruction

    // cmp IMMEDIATE (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd84) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regE - 1)) else begin $error("failed AC cmp IMM"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b0010}) else begin $error("failed NZCV"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns; // fetch instruction

    // cmp IMMEDIATE (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd85) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regF - 1)) else begin $error("failed AC cmp IMM"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b0010}) else begin $error("failed NZCV"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns; // fetch instruction

    // cmp IMMEDIATE (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd86) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regG - 1)) else begin $error("failed AC cmp IMM"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b0010}) else begin $error("failed NZCV"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns; // fetch instruction

    // cmp IMMEDIATE (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd87) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regH - 1)) else begin $error("failed AC cmp IMM"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b0010}) else begin $error("failed NZCV"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns; // fetch instruction

    // cmp IMMEDIATE (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd88) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regI - 1)) else begin $error("failed AC cmp IMM"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b0010}) else begin $error("failed NZCV"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns; // fetch instruction

    // cmp IMMEDIATE (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd89) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regJ - 1)) else begin $error("failed AC cmp IMM"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b0010}) else begin $error("failed NZCV"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns; // fetch instruction

    // cmp IMMEDIATE (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd90) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regK - 1)) else begin $error("failed AC cmp IMM"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b0010}) else begin $error("failed NZCV"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns; // fetch instruction

    // cmp IMMEDIATE (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd91) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regL - 1)) else begin $error("failed AC cmp IMM"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b0010}) else begin $error("failed NZCV"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns; // fetch instruction

    // cmp IMMEDIATE (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd92) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regM - 1)) else begin $error("failed AC cmp IMM"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b0010}) else begin $error("failed NZCV"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns; // fetch instruction

    // cmp REGISTER (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd93) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regA - dut.b2v_inst18.regB)) else begin $error("failed AC cmp REG"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b1000}) else begin $error("failed NZCV"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns; // fetch instruction

    // cmp REGISTER (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd94) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regB - dut.b2v_inst18.regC)) else begin $error("failed AC cmp REG"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b1000}) else begin $error("failed NZCV"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns; // fetch instruction

    // cmp REGISTER (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd95) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regC - dut.b2v_inst18.regD)) else begin $error("failed AC cmp REG"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b1000}) else begin $error("failed NZCV"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns; // fetch instruction

    // cmp REGISTER (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd96) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regD - dut.b2v_inst18.regE)) else begin $error("failed AC cmp REG"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b1000}) else begin $error("failed NZCV"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns; // fetch instruction

    // cmp REGISTER (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd97) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regE - dut.b2v_inst18.regF)) else begin $error("failed AC cmp REG"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b1000}) else begin $error("failed NZCV"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns; // fetch instruction

    // cmp REGISTER (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd98) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regF - dut.b2v_inst18.regG)) else begin $error("failed AC cmp REG"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b1000}) else begin $error("failed NZCV"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns; // fetch instruction

    // cmp REGISTER (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd99) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regG - dut.b2v_inst18.regH)) else begin $error("failed AC cmp REG"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b1000}) else begin $error("failed NZCV"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns; // fetch instruction

    // cmp REGISTER (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd100) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regH - dut.b2v_inst18.regI)) else begin $error("failed AC cmp REG"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b1000}) else begin $error("failed NZCV"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns; // fetch instruction

    // cmp REGISTER (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd101) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regI - dut.b2v_inst18.regJ)) else begin $error("failed AC cmp REG"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b1000}) else begin $error("failed NZCV"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns; // fetch instruction

    // cmp REGISTER (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd102) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regJ - dut.b2v_inst18.regK)) else begin $error("failed AC cmp REG"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b1000}) else begin $error("failed NZCV"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns; // fetch instruction

    // cmp REGISTER (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd103) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regK - dut.b2v_inst18.regL)) else begin $error("failed AC cmp REG"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b1000}) else begin $error("failed NZCV"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns; // fetch instruction

    // cmp REGISTER (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd104) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regL - dut.b2v_inst18.regM)) else begin $error("failed AC cmp REG"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b1000}) else begin $error("failed NZCV"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns; // fetch instruction

    // cmp REGISTER (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd105) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regM - dut.b2v_inst18.regA)) else begin $error("failed AC cmp REG"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b0010}) else begin $error("failed NZCV"); err++; end
    #3ns;

    ///////////////////////////////////////////

    #30ns; // fetch instruction

    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd106) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    #30ns; // fetch instruction

    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd107) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    #30ns; // fetch instruction

    // cmp REGISTER (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd108) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regB - dut.b2v_inst18.regA)) else begin $error("failed AC cmp REG"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b0010}) else begin $error("failed NZCV"); err++; end
    #3ns;

    #30ns; // fetch instruction

    // bgt (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == bgt1) else begin $error("failed bgt"); err++; end 
    assert(dut.PC == 'd109) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.PCLOAD) else begin $error("failed PCLOAD"); err++; end   // will branch
    #3ns;

    #30ns; // fetch instruction
    assert(dut.AR == 'd110) else begin $error("failed bgt to address 116"); err++; end



    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd111) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    #30ns; // fetch instruction

    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd112) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    #30ns; // fetch instruction

    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd113) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    #30ns; // fetch instruction

    // cmp REGISTER (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd114) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regA - dut.b2v_inst18.regB)) else begin $error("failed AC cmp REG"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b1000}) else begin $error("failed NZCV"); err++; end
    #3ns;

    #30ns; // fetch instruction

    // bgt (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == bgt1) else begin $error("failed bgt"); err++; end 
    assert(dut.PC == 'd115) else begin $error("failed PC %d",dut.PC); err++; end
    assert(!dut.PCLOAD) else begin $error("failed PCLOAD"); err++; end  // will not branch
    #3ns;

    #30ns; // fetch instruction

    // b (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == b1) else begin $error("failed b"); err++; end 
    assert(dut.PC == 'd116) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.PCLOAD) else begin $error("failed PCLOAD"); err++; end   // will branch
    #3ns;

    #30ns; // fetch instruction
    assert(dut.AR == 'd117) else begin $error("failed bgt to address 116"); err++; end

    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd118) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    #30ns; // fetch instruction


    ///////////////////////////////////////////


    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd119) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    #30ns; // fetch instruction

    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd120) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    #30ns; // fetch instruction

    // cmp REGISTER (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd121) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regA - dut.b2v_inst18.regB)) else begin $error("failed AC cmp REG"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b1000}) else begin $error("failed NZCV"); err++; end
    #3ns;

    #30ns; // fetch instruction

    // blt (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == blt1) else begin $error("failed blt"); err++; end 
    assert(dut.PC == 'd122) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.PCLOAD) else begin $error("failed PCLOAD"); err++; end   // will branch
    #3ns;

    #30ns; // fetch instruction
    assert(dut.AR == 'd123) else begin $error("failed bgt to address 123"); err++; end



    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd124) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    #30ns; // fetch instruction

    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd125) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    #30ns; // fetch instruction

    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd126) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    #30ns; // fetch instruction

    // cmp REGISTER (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd127) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regB - dut.b2v_inst18.regA)) else begin $error("failed AC cmp REG"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b0010}) else begin $error("failed NZCV"); err++; end
    #3ns;

    #30ns; // fetch instruction

    // blt (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == blt1) else begin $error("failed blt"); err++; end 
    assert(dut.PC == 'd128) else begin $error("failed PC %d",dut.PC); err++; end
    assert(!dut.PCLOAD) else begin $error("failed PCLOAD"); err++; end  // will not branch
    #3ns;

    #30ns; // fetch instruction

    // b (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == b1) else begin $error("failed b"); err++; end 
    assert(dut.PC == 'd129) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.PCLOAD) else begin $error("failed PCLOAD"); err++; end   // will branch
    #3ns;

    #30ns; // fetch instruction
    assert(dut.AR == 'd130) else begin $error("failed bgt to address 130"); err++; end

    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd131) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    #30ns; // fetch instruction


    ///////////////////////////////////////////   


    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd132) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    #30ns; // fetch instruction

    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd133) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    #30ns; // fetch instruction

    // cmp REGISTER (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd134) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regA - dut.b2v_inst18.regB)) else begin $error("failed AC cmp REG"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b0110}) else begin $error("failed NZCV"); err++; end
    #3ns;

    #30ns; // fetch instruction

    // beq (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == beq1) else begin $error("failed beq"); err++; end 
    assert(dut.PC == 'd135) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.PCLOAD) else begin $error("failed PCLOAD"); err++; end   // will branch
    #3ns;

    #30ns; // fetch instruction
    assert(dut.AR == 'd136) else begin $error("failed bgt to address 136"); err++; end



    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd137) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    #30ns; // fetch instruction

    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd138) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    #30ns; // fetch instruction

    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd139) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    #30ns; // fetch instruction

    // cmp REGISTER (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == cmp1) else begin $error("failed cmp"); err++; end 
    assert(dut.PC == 'd140) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.ALU_out == (dut.b2v_inst18.regB - dut.b2v_inst18.regA)) else begin $error("failed AC cmp REG"); err++; end
    assert({dut.N,dut.Z,dut.C,dut.V} == {4'b0010}) else begin $error("failed NZCV"); err++; end
    #3ns;

    #30ns; // fetch instruction

    // beq (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == beq1) else begin $error("failed beq"); err++; end 
    assert(dut.PC == 'd141) else begin $error("failed PC %d",dut.PC); err++; end
    assert(!dut.PCLOAD) else begin $error("failed PCLOAD"); err++; end  // will not branch
    #3ns;

    #30ns; // fetch instruction

    // b (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == b1) else begin $error("failed b"); err++; end 
    assert(dut.PC == 'd142) else begin $error("failed PC %d",dut.PC); err++; end
    assert(dut.PCLOAD) else begin $error("failed PCLOAD"); err++; end   // will branch
    #3ns;

    #30ns; // fetch instruction
    assert(dut.AR == 'd143) else begin $error("failed bgt to address 143"); err++; end

    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd144) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    #30ns; // fetch instruction


    ///////////////////////////////////////////

    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd145) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    #30ns; // fetch instruction

    // mov (1 cycle)
    #7ns;
    assert(dut.b2v_inst27.CPUstate == mov1) else begin $error("failed mov"); err++; end    
    assert(dut.PC == 'd146) else begin $error("failed PC %d",dut.PC); err++; end
    #3ns;

    #30ns; // fetch instruction


    // add (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == add2) else begin $error("failed add"); err++; end    
    assert(dut.PC == 'd147) else begin $error("failed PC %d",dut.PC); err++; end    
    assert(dut.AC == ('d11 + 'd10)) else begin $error("failed add r2, #11,#10"); err++; end
    #3ns;

    #30ns; // fetch instruction

    // add (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == add2) else begin $error("failed add"); err++; end    
    assert(dut.PC == 'd148) else begin $error("failed PC %d",dut.PC); err++; end    
    assert(dut.AC == ('d11 + dut.b2v_inst18.regA)) else begin $error("failed add r2, #11,r0"); err++; end
    #3ns;

    #30ns; // fetch instruction

    // add (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == add2) else begin $error("failed add"); err++; end    
    assert(dut.PC == 'd149) else begin $error("failed PC %d",dut.PC); err++; end    
    assert(dut.AC == (dut.b2v_inst18.regB + 'd10)) else begin $error("failed add r2, r1,#10"); err++; end
    #3ns;

    #30ns; // fetch instruction

    // add (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == add2) else begin $error("failed add"); err++; end    
    assert(dut.PC == 'd150) else begin $error("failed PC %d",dut.PC); err++; end    
    assert(dut.AC == (dut.b2v_inst18.regA + dut.b2v_inst18.regB)) else begin $error("failed r2, r0,r1"); err++; end
    #3ns;

    #30ns; // fetch instruction 

    ///////////////////////////////////////////

   
    // sub (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == sub2) else begin $error("failed sub"); err++; end    
    assert(dut.PC == 'd151) else begin $error("failed PC %d",dut.PC); err++; end    
    assert(dut.AC == ('d11 - 'd10)) else begin $error("failed sub r2, #11,#10"); err++; end
    #3ns;

    #30ns; // fetch instruction

    // sub (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == sub2) else begin $error("failed sub"); err++; end    
    assert(dut.PC == 'd152) else begin $error("failed PC %d",dut.PC); err++; end    
    assert(dut.AC == ('d11 - dut.b2v_inst18.regA)) else begin $error("failed sub r2, #11,r0"); err++; end
    #3ns;

    #30ns; // fetch instruction

    // sub (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == sub2) else begin $error("failed sub"); err++; end    
    assert(dut.PC == 'd153) else begin $error("failed PC %d",dut.PC); err++; end    
    assert(dut.AC == (dut.b2v_inst18.regB - 'd10)) else begin $error("failed sub r2, r1,#10"); err++; end
    #3ns;

    #30ns; // fetch instruction

    // sub (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == sub2) else begin $error("failed sub"); err++; end    
    assert(dut.PC == 'd154) else begin $error("failed PC %d",dut.PC); err++; end    
    assert(dut.AC == (dut.b2v_inst18.regA - dut.b2v_inst18.regB)) else begin $error("failed sub, r0,r1"); err++; end
    #3ns;

    #30ns; // fetch instruction

    ///////////////////////////////////////////

   
    // mul (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == mul2) else begin $error("failed mul"); err++; end    
    assert(dut.PC == 'd155) else begin $error("failed PC %d",dut.PC); err++; end    
    assert(dut.AC == ('d11 * 'd10)) else begin $error("failed mul r2, #11,#10"); err++; end
    #3ns;

    #30ns; // fetch instruction

    // mul (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == mul2) else begin $error("failed mul"); err++; end    
    assert(dut.PC == 'd156) else begin $error("failed PC %d",dut.PC); err++; end    
    assert(dut.AC == ('d11 * dut.b2v_inst18.regA)) else begin $error("failed mul r2, #11,r0"); err++; end
    #3ns;

    #30ns; // fetch instruction

    // mul (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == mul2) else begin $error("failed mul"); err++; end    
    assert(dut.PC == 'd157) else begin $error("failed PC %d",dut.PC); err++; end    
    assert(dut.AC == (dut.b2v_inst18.regB * 'd10)) else begin $error("failed mul r2, r1,#10"); err++; end
    #3ns;

    #30ns; // fetch instruction

    // mul (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == mul2) else begin $error("failed mul"); err++; end    
    assert(dut.PC == 'd158) else begin $error("failed PC %d",dut.PC); err++; end    
    assert(dut.AC == (dut.b2v_inst18.regA * dut.b2v_inst18.regB)) else begin $error("failed mul, r0,r1"); err++; end
    #3ns;

    #30ns; // fetch instruction

    ///////////////////////////////////////////

   
    // lsr (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == lsr2) else begin $error("failed lsr"); err++; end    
    assert(dut.PC == 'd159) else begin $error("failed PC %d",dut.PC); err++; end    
    assert(dut.AC == (dut.b2v_inst18.regA >> 1)) else begin $error("failed lsr r2, r1,#1"); err++; end
    #3ns;

    #30ns; // fetch instruction

    ///////////////////////////////////////////

   
    // and (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == and2) else begin $error("failed and"); err++; end    
    assert(dut.PC == 'd160) else begin $error("failed PC %d",dut.PC); err++; end    
    assert(dut.AC == ('d11 & 'd10)) else begin $error("failed and r2, #11,#10"); err++; end
    #3ns;

    #30ns; // fetch instruction

    // and (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == and2) else begin $error("failed and"); err++; end    
    assert(dut.PC == 'd161) else begin $error("failed PC %d",dut.PC); err++; end    
    assert(dut.AC == ('d11 & dut.b2v_inst18.regA)) else begin $error("failed and r2, #11,r0"); err++; end
    #3ns;

    #30ns; // fetch instruction

    // and (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == and2) else begin $error("failed and"); err++; end    
    assert(dut.PC == 'd162) else begin $error("failed PC %d",dut.PC); err++; end    
    assert(dut.AC == (dut.b2v_inst18.regB & 'd10)) else begin $error("and mul r2, r1,#10"); err++; end
    #3ns;

    #30ns; // fetch instruction

    // and (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == and2) else begin $error("failed and"); err++; end    
    assert(dut.PC == 'd163) else begin $error("failed PC %d",dut.PC); err++; end    
    assert(dut.AC == (dut.b2v_inst18.regA & dut.b2v_inst18.regB)) else begin $error("failed and, r0,r1"); err++; end
    #3ns;

    #30ns; // fetch instruction

    ///////////////////////////////////////////

   
    // or (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == or2) else begin $error("failed or"); err++; end    
    assert(dut.PC == 'd164) else begin $error("failed PC %d",dut.PC); err++; end    
    assert(dut.AC == ('d11 | 'd10)) else begin $error("failed or r2, #11,#10"); err++; end
    #3ns;

    #30ns; // fetch instruction

    // or (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == or2) else begin $error("failed or"); err++; end    
    assert(dut.PC == 'd165) else begin $error("failed PC %d",dut.PC); err++; end    
    assert(dut.AC == ('d11 | dut.b2v_inst18.regA)) else begin $error("failed or r2, #11,r0"); err++; end
    #3ns;

    #30ns; // fetch instruction

    // or (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == or2) else begin $error("failed or"); err++; end    
    assert(dut.PC == 'd166) else begin $error("failed PC %d",dut.PC); err++; end    
    assert(dut.AC == (dut.b2v_inst18.regB | 'd10)) else begin $error("or mul r2, r1,#10"); err++; end
    #3ns;

    #30ns; // fetch instruction

    // or (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == or2) else begin $error("failed or"); err++; end    
    assert(dut.PC == 'd167) else begin $error("failed PC %d",dut.PC); err++; end    
    assert(dut.AC == (dut.b2v_inst18.regA | dut.b2v_inst18.regB)) else begin $error("failed or, r0,r1"); err++; end
    #3ns;

    #30ns; // fetch instruction

    ///////////////////////////////////////////

   
    // mvn (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == mvn2) else begin $error("failed mvn"); err++; end    
    assert(dut.PC == 'd168) else begin $error("failed PC %d",dut.PC); err++; end    
    assert(dut.AC == ('hfffffffe)) else begin $error("failed mvn r2, #0"); err++; end
    #3ns;

    #30ns; // fetch instruction

    // mvn (2 cycles)
    #17ns;
    assert(dut.b2v_inst27.CPUstate == mvn2) else begin $error("failed mvn"); err++; end    
    assert(dut.PC == 'd169) else begin $error("failed PC %d",dut.PC); err++; end    
    assert(dut.AC == ('hfffffff5)) else begin $error("failed mvn r2, r1"); err++; end
    #3ns;

    #30ns; // fetch instruction

    if(!err) $display("\n///////// ALL TESTS PASSED /////////\n");
    else $display("\n///////// WARNING: ERRORS FOUND %d /////////\n", err);

    $stop;

end



endmodule