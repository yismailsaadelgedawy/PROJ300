module CU_logic_tb;

// parameters
parameter states=40;


// internal wires

// in
logic N,Z,C,V;
logic [states-1:0] CPU_state;

// out
logic RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC,COUNTER_CLR;
logic [2:0] ALUSEL;
logic [3:0] SYSTEMBUSSEL;

// wiring
CU_logic dut (

    // in
    .N(N),
    .Z(Z),
    .C(C),
    .V(V),
    .CPU_state(CPU_state),

    // out

    .RSELLOAD(RSELLOAD),
    .ROP1LOAD(ROP1LOAD),
    .ROP2LOAD(ROP2LOAD),
    .TRLOAD(TRLOAD),
    .ARLOAD(ARLOAD),
    .PCLOAD(PCLOAD),
    .DRLOAD(DRLOAD),
    .ACLOAD(ACLOAD),
    .IRLOAD(IRLOAD),
    .GPRLOAD(GPRLOAD),
    .MEMLOAD(MEMLOAD),
    .PCINC(PCINC),
    .COUNTER_LD(COUNTER_LD),
    .COUNTER_INC(COUNTER_INC),
    .COUNTER_CLR(COUNTER_CLR),
    .ALUSEL(ALUSEL),
    .SYSTEMBUSSEL(SYSTEMBUSSEL)  


);


int unsigned i;




// testing
initial begin

    $display("\n/////////////// Testing general instructions ///////////////\n");

    // flags cleared initially
    {N,Z,C,V} = 'd0;

    // fetch1
    CPU_state = 1<<0;
    #10ns;
    assert(COUNTER_INC && ARLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd0) $display("passed fetch1"); else $error("failed fetch1");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} == 'd0) $display("passed rest zero"); else $error("failed rest zero");
    

    // fetch2
    CPU_state = 1<<1;
    #10ns;
    assert(COUNTER_INC && DRLOAD && PCINC && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd4) $display("passed fetch2"); else $error("failed fetch2");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,COUNTER_LD,COUNTER_CLR} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // fetch3
    CPU_state = 1<<2;
    #10ns;
    assert(COUNTER_LD && RSELLOAD && ROP1LOAD && ROP2LOAD && IRLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd1) $display("passed fetch3"); else $error("failed fetch3");
    assert({TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_INC,COUNTER_CLR} == 'd0) $display("passed rest zero"); else $error("failed rest zero");
    
        
    // nop1
    CPU_state = 1<<3;
    #10ns;
    assert(COUNTER_CLR && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd0) $display("passed nop1"); else $error("failed nop1");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed rest zero"); else $error("failed rest zero");
    

    // mov1
    CPU_state = 1<<4;
    #10ns;
    assert(COUNTER_CLR && GPRLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd7) $display("passed mov1"); else $error("failed mov1");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // ALTmov1
    CPU_state = 1<<5;
    #10ns;
    assert(COUNTER_INC && TRLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd8) $display("passed ALTmov1"); else $error("failed ALTmov1");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // ALTmov2
    CPU_state = 1<<6;
    #10ns;
    assert(COUNTER_CLR && GPRLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd5) $display("passed ALTmov2"); else $error("failed ALTmov2");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // ldr1
    CPU_state = 1<<7;
    #10ns;
    assert(COUNTER_INC && ARLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd7) $display("passed ldr1"); else $error("failed ldr1");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // ldr2
    CPU_state = 1<<8;
    #10ns;
    assert(COUNTER_CLR && GPRLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd2) $display("passed ldr2"); else $error("failed ldr2");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // ALTldr1
    CPU_state = 1<<9;
    #10ns;
    assert(COUNTER_INC && ARLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd7) $display("passed ALTldr1"); else $error("failed ALTldr1");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // ALTldr2
    CPU_state = 1<<10;
    #10ns;
    assert(COUNTER_INC && GPRLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd2) $display("passed ALTldr2"); else $error("failed ALTldr2");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // ALTldr3
    CPU_state = 1<<11;
    #10ns;
    assert(COUNTER_INC && DRLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd4) $display("passed ALTldr3"); else $error("failed ALTldr3");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // ALTldr4
    CPU_state = 1<<12;
    #10ns;
    assert(COUNTER_CLR && GPRLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd1) $display("passed ALTldr4"); else $error("failed ALTldr4");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // str1
    CPU_state = 1<<13;
    #10ns;
    assert(COUNTER_INC && ARLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd7) $display("passed str1"); else $error("failed str1");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // str2
    CPU_state = 1<<14;
    #10ns;
    assert(COUNTER_INC && TRLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd8) $display("passed str2"); else $error("failed str2");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // str3
    CPU_state = 1<<15;
    #10ns;
    assert(COUNTER_INC && DRLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd5) $display("passed str3"); else $error("failed str3");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // str4
    CPU_state = 1<<16;
    #10ns;
    assert(COUNTER_CLR && MEMLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd1) $display("passed str4"); else $error("failed str4");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,PCINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // ALTstr1
    CPU_state = 1<<17;
    #10ns;
    assert(COUNTER_INC && ARLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd7) $display("passed ALTstr1"); else $error("failed ALTstr1");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // ALTstr2
    CPU_state = 1<<18;
    #10ns;
    assert(COUNTER_INC && TRLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd6) $display("passed ALTstr2"); else $error("failed ALTstr2");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // ALTstr3
    CPU_state = 1<<19;
    #10ns;
    assert(COUNTER_INC && DRLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd5) $display("passed ALTstr3"); else $error("failed ALTstr3");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // ALTstr4
    CPU_state = 1<<20;
    #10ns;
    assert(COUNTER_CLR && MEMLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd1) $display("passed ALTstr4"); else $error("failed ALTstr4");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,PCINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // cmp1
    CPU_state = 1<<21;
    #10ns;
    assert(ACLOAD && COUNTER_CLR && ALUSEL == 'd1 && SYSTEMBUSSEL == 'd0) $display("passed cmp1"); else $error("failed cmp1");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed rest zero"); else $error("failed rest zero");





    $display("\n/////////////// Testing branching instructions ///////////////\n");

    
    // b1
    CPU_state = 1<<22;
    #10ns;
    assert(COUNTER_CLR && PCLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd7) $display("passed b1"); else $error("failed b1");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed rest zero"); else $error("failed rest zero");



    ///////// testing bgt /////////

    {N,Z,C,V} = 4'b0000;    // Z clear; N and V are the same

    // bgt1
    CPU_state = 1<<23;
    #10ns;
    assert(COUNTER_CLR && PCLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd7) $display("passed bgt: branch"); else $error("failed bgt: branch");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    {N,Z,C,V} = 4'b1001; // Z clear; N and V are the same
    #10ns;
    assert(COUNTER_CLR && PCLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd7) $display("passed bgt: branch"); else $error("failed bgt: branch");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    {N,Z,C,V} = 4'b0100; // Z not clear; N and V are the same
    #10ns;
    assert(COUNTER_CLR && !PCLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd7) $display("passed bgt: no branch"); else $error("failed bgt: no branch");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    {N,Z,C,V} = 4'b1101; // Z not clear; N and V are the same
    #10ns;
    assert(COUNTER_CLR && !PCLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd7) $display("passed bgt: no branch"); else $error("failed bgt: no branch");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    {N,Z,C,V} = 4'b0101; // Z not clear; N and V are different
    #10ns;
    assert(COUNTER_CLR && !PCLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd7) $display("passed bgt: no branch"); else $error("failed bgt: no branch");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    {N,Z,C,V} = 4'b1100; // Z not clear; N and V are different
    #10ns;
    assert(COUNTER_CLR && !PCLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd7) $display("passed bgt: no branch"); else $error("failed bgt: no branch");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed rest zero"); else $error("failed rest zero");




    ///////// testing blt /////////

    {N,Z,C,V} = 4'b1000;    // N and V are different

    // blt1
    CPU_state = 1<<24;
    #10ns;
    assert(COUNTER_CLR && PCLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd7) $display("passed blt: branch"); else $error("failed blt: branch");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    {N,Z,C,V} = 4'b0001;    // N and V are different
    #10ns;
    assert(COUNTER_CLR && PCLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd7) $display("passed blt: branch"); else $error("failed blt: branch");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    {N,Z,C,V} = 4'b1001;    // N and V are the same
    #10ns;
    assert(COUNTER_CLR && !PCLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd7) $display("passed blt: no branch"); else $error("failed blt: no branch");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    {N,Z,C,V} = 4'b0000;    // N and V are the same
    #10ns;
    assert(COUNTER_CLR && !PCLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd7) $display("passed blt: no branch"); else $error("failed blt: no branch");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed rest zero"); else $error("failed rest zero");





    ///////// testing beq /////////

    {N,Z,C,V} = 4'b0100;    // Z is set

    // beq1
    CPU_state = 1<<25;
    #10ns;
    assert(COUNTER_CLR && PCLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd7) $display("passed beq: branch"); else $error("failed beq: branch");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    {N,Z,C,V} = 4'b0000;    // Z is clear
    #10ns;
    assert(COUNTER_CLR && !PCLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd7) $display("passed beq: no branch"); else $error("failed beq: no branch");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed rest zero"); else $error("failed rest zero");



    $display("\n/////////////// Testing arithemetic instructions ///////////////\n");


    // add1
    CPU_state = 1<<26;
    #10ns;
    assert(COUNTER_INC && ACLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd0) $display("passed add1"); else $error("failed add1");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // add2
    CPU_state = 1<<27;
    #10ns;
    assert(COUNTER_CLR && GPRLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd3) $display("passed add2"); else $error("failed add2");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // sub1
    CPU_state = 1<<28;
    #10ns;
    assert(COUNTER_INC && ACLOAD && ALUSEL == 'd1 && SYSTEMBUSSEL == 'd0) $display("passed sub1"); else $error("failed sub1");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // sub2
    CPU_state = 1<<29;
    #10ns;
    assert(COUNTER_CLR && GPRLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd3) $display("passed sub2"); else $error("failed sub2");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // mul1
    CPU_state = 1<<30;
    #10ns;
    assert(COUNTER_INC && ACLOAD && ALUSEL == 'd2 && SYSTEMBUSSEL == 'd0) $display("passed mul1"); else $error("failed mul1");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // mul2
    CPU_state = 1<<31;
    #10ns;
    assert(COUNTER_CLR && GPRLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd3) $display("passed mul2"); else $error("failed mul2");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // lsr1
    CPU_state = 1<<32;
    #10ns;
    assert(COUNTER_INC && ACLOAD && ALUSEL == 'd3 && SYSTEMBUSSEL == 'd0) $display("passed lsr1"); else $error("failed lsr1");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // lsr2
    CPU_state = 1<<33;
    #10ns;
    assert(COUNTER_CLR && GPRLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd3) $display("passed lsr2"); else $error("failed lsr2");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed rest zero"); else $error("failed rest zero");



    $display("\n/////////////// Testing logic instructions ///////////////\n");

    // and1
    CPU_state = 1<<34;
    #10ns;
    assert(COUNTER_INC && ACLOAD && ALUSEL == 'd4 && SYSTEMBUSSEL == 'd0) $display("passed and1"); else $error("failed and1");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // and2
    CPU_state = 1<<35;
    #10ns;
    assert(COUNTER_CLR && GPRLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd3) $display("passed and2"); else $error("failed and2");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // or1
    CPU_state = 1<<36;
    #10ns;
    assert(COUNTER_INC && ACLOAD && ALUSEL == 'd5 && SYSTEMBUSSEL == 'd0) $display("passed or1"); else $error("failed or1");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // or2
    CPU_state = 1<<37;
    #10ns;
    assert(COUNTER_CLR && GPRLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd3) $display("passed or2"); else $error("failed or2");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // mvn1
    CPU_state = 1<<38;
    #10ns;
    assert(COUNTER_INC && ACLOAD && ALUSEL == 'd6 && SYSTEMBUSSEL == 'd0) $display("passed mvn1"); else $error("failed mvn1");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} == 'd0) $display("passed rest zero"); else $error("failed rest zero");


    // mvn2
    CPU_state = 1<<39;
    #10ns;
    assert(COUNTER_CLR && GPRLOAD && ALUSEL == 'd0 && SYSTEMBUSSEL == 'd3) $display("passed mvn2"); else $error("failed mvn2");
    assert({RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed rest zero"); else $error("failed rest zero");



end


endmodule