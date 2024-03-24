module CU_logic #(parameter states=40) (


    output logic RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,
    PCINC,
    COUNTER_LD,COUNTER_INC,COUNTER_CLR,

    output logic [2:0] ALUSEL,

    output logic [3:0] SYSTEMBUSSEL,

    input logic [states-1:0] CPU_state,

    input logic N,Z,C,V

);


// makes debugging easier when testbenching
// fetch1=6'd0 not fetch1=0, since that is implied as fetch1=32'd0!!
typedef enum logic [5:0] {

    fetch1=6'd0,fetch2,fetch3,nop1,mov1,ALTmov1,ALTmov2,ldr1,ldr2,ALTldr1,ALTldr2,ALTldr3,ALTldr4,str1,str2,str3,str4,
    ALTstr1,ALTstr2,ALTstr3,ALTstr4,cmp1,b1,bgt1,blt1,beq1,add1,add2,sub1,sub2,mul1,mul2,lsr1,lsr2,and1,and2,or1,or2,mvn1,mvn2

} CPUstate_t;

CPUstate_t CPUstate;

// must also input NZCV flags
// needed to choose whether to execute the conditional branch instructions or not!


// logic derived in "instructions.txt"

// counter mapping is as follows (40 states - * indicates start state of routine)
// fetch1   : 0
// fetch2   : 1
// fetch3   : 2
// nop1     : 3*
// mov1     : 4*
// ALTmov1  : 5*
// ALTmov2  : 6
// ldr1     : 7*
// ldr2     : 8
// ALTldr1  : 9*
// ALTldr2  : 10
// ALTldr3  : 11
// ALTldr4  : 12
// str1     : 13*
// str2     : 14
// str3     : 15
// str4     : 16
// ALTstr1  : 17*
// ALTstr2  : 18
// ALTstr3  : 19
// ALTstr4  : 20
// cmp1     : 21*
// b1       : 22*
// bgt1     : 23*
// blt1     : 24*
// beq1     : 25*
// add1     : 26*
// add2     : 27
// sub1     : 28*
// sub2     : 29
// mul1     : 30*
// mul2     : 31
// lsr1     : 32*
// lsr2     : 33
// and1     : 34*
// and2     : 35
// or1      : 36*
// or2      : 37
// mvn1     : 38*
// mvn2     : 39


// SYSTEMBUSSEL = 0 : PC
// SYSTEMBUSSEL = 1 : DR
// SYSTEMBUSSEL = 2 : AR
// SYSTEMBUSSEL = 3 : AC
// SYSTEMBUSSEL = 4 : MEM
// SYSTEMBUSSEL = 5 : TR
// SYSTEMBUSSEL = 6 : rop1
// SYSTEMBUSSEL = 7 : rop2
// SYSTEMBUSSEL = 8 : GPR1



always_comb begin

    case(CPU_state)

    // fetch1
    40'd2**0 : begin

        {COUNTER_INC,ARLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd0;

        CPUstate = fetch1;
    end

    // fetch2
    40'd2**1 : begin

        {COUNTER_INC,DRLOAD,PCINC} = 3'b111;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,COUNTER_LD,COUNTER_CLR} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd4;

        CPUstate = fetch2;
    end

    // fetch3
    40'd2**2 : begin

        {COUNTER_LD,RSELLOAD,ROP1LOAD,ROP2LOAD,IRLOAD} = 5'b11111;
        {TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_INC,COUNTER_CLR} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd1;

        CPUstate = fetch3;
    end

    // nop1
    40'd2**3 : begin
        // do nothing
        CPUstate = nop1;
        
    end

    // mov1
    40'd2**4 : begin

        {COUNTER_CLR,GPRLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd7;

        CPUstate = mov1;
    end

    // ALTmov1
    40'd2**5 : begin

        {COUNTER_INC,TRLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd8;

        CPUstate = ALTmov1;
    end

    // ALTmov2
    40'd2**6 : begin

        {COUNTER_CLR,GPRLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd5;

        CPUstate = ALTmov2;
    end

    // ldr1
    40'd2**7 : begin

        {COUNTER_INC,ARLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd7;

        CPUstate = ldr1;
    end

    // ldr2
    40'd2**8 : begin

        {COUNTER_CLR,GPRLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd2;

        CPUstate = ldr2;
    end

    // ALTldr1
    40'd2**9 : begin

        {COUNTER_INC,ARLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd7;

        CPUstate = ALTldr1;
    end

    // ALTldr2
    40'd2**10 : begin

        {COUNTER_INC,GPRLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd2;

        CPUstate = ALTldr2;
    end

    // ALTldr3
    40'd2**11 : begin

        {COUNTER_INC,DRLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd4;

        CPUstate = ALTldr3;
    end

    // ALTldr4
    40'd2**12 : begin

        {COUNTER_CLR,GPRLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd1;

        CPUstate = ALTldr4;
    end

    // str1
    40'd2**13 : begin

        {COUNTER_INC,ARLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd7;

        CPUstate = str1;
    end

    // str2
    40'd2**14 : begin

        {COUNTER_INC,TRLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd8;

        CPUstate = str2;
    end

    // str3
    40'd2**15 : begin

        {COUNTER_INC,DRLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd5;

        CPUstate = str3;
    end

    // str4
    40'd2**16 : begin

        {COUNTER_CLR,MEMLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,PCINC,COUNTER_LD,COUNTER_INC} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd1;

        CPUstate = str4;
    end

    // ALTstr1
    40'd2**17 : begin

        {COUNTER_INC,ARLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd7;

        CPUstate = ALTstr1;
    end

    // ALTstr2
    40'd2**18 : begin

        {COUNTER_INC,TRLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd6;

        CPUstate = ALTstr2;
    end

    // ALTstr3
    40'd2**19 : begin

        {COUNTER_INC,DRLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd5;

        CPUstate = ALTstr3;
    end

    // ALTstr4
    40'd2**20 : begin

        {COUNTER_CLR,MEMLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,PCINC,COUNTER_LD,COUNTER_INC} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd1;

        CPUstate = ALTstr4;
    end

    // cmp1
    40'd2**21 : begin

        ACLOAD = 1; COUNTER_CLR = 1;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} = 'd0;
        ALUSEL = 'd1;   // chooses sub operation
        SYSTEMBUSSEL = 'd0;

        CPUstate = cmp1;
    end

    // b1
    40'd2**22 : begin

        {COUNTER_CLR,PCLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd7;

        CPUstate = b1;
    end

    // bgt1
    40'd2**23 : begin

        if(!Z && (N == V)) begin
            PCLOAD = 1;
        end

        else begin
            PCLOAD = 0;
        end

        COUNTER_CLR = 1;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd7;

        CPUstate = bgt1;
    end

    // blt1
    40'd2**24 : begin

        if(N != V) begin
            PCLOAD = 1;
        end

        else begin
            PCLOAD = 0;
        end

        COUNTER_CLR = 1;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd7;

        CPUstate = blt1;
    end

    // beq1
    40'd2**25 : begin

        if(Z) begin
            PCLOAD = 1;
        end

        else begin
            PCLOAD = 0;
        end

        COUNTER_CLR = 1;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,DRLOAD,ACLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd7;

        CPUstate = beq1;
    end

    // add1
    40'd2**26 : begin

        {COUNTER_INC,ACLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd0;

        CPUstate = add1;
    end

    // add2
    40'd2**27 : begin

        {COUNTER_CLR,GPRLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd3;

        CPUstate = add2;
    end

    // sub1
    40'd2**28 : begin

        {COUNTER_INC,ACLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} = 'd0;
        ALUSEL = 'd1;
        SYSTEMBUSSEL = 'd0;

        CPUstate = sub1;
    end

    // sub2
    40'd2**29 : begin

        {COUNTER_CLR,GPRLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd3;

        CPUstate = sub2;
    end

    // mul1
    40'd2**30 : begin

        {COUNTER_INC,ACLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} = 'd0;
        ALUSEL = 'd2;
        SYSTEMBUSSEL = 'd0;

        CPUstate = mul1;
    end

    // mul2
    40'd2**31 : begin

        {COUNTER_CLR,GPRLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd3;
        
        CPUstate = mul2;
    end

    // lsr1
    40'd2**32 : begin

        {COUNTER_INC,ACLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} = 'd0;
        ALUSEL = 'd3;
        SYSTEMBUSSEL = 'd0;

        CPUstate = lsr1;
    end

    // lsr2
    40'd2**33 : begin

        {COUNTER_CLR,GPRLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd3;

        CPUstate = lsr2;
        
    end

    // and1
    40'd2**34 : begin

        {COUNTER_INC,ACLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} = 'd0;
        ALUSEL = 'd4;
        SYSTEMBUSSEL = 'd0;

        CPUstate = and1;
        
    end

    // and2
    40'd2**35 : begin

        {COUNTER_CLR,GPRLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd3;

        CPUstate = and2;

    end

    // or1
    40'd2**36 : begin

        {COUNTER_INC,ACLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} = 'd0;
        ALUSEL = 'd5;
        SYSTEMBUSSEL = 'd0;

        CPUstate = or1;

    end

    // or2
    40'd2**37 : begin

        {COUNTER_CLR,GPRLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd3;

        CPUstate = or2;

    end

    // mvn1
    40'd2**38 : begin

        {COUNTER_INC,ACLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,IRLOAD,GPRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_CLR} = 'd0;
        ALUSEL = 'd6;
        SYSTEMBUSSEL = 'd0;

        CPUstate = mvn1;
    end

    // mvn2
    40'd2**39 : begin

        {COUNTER_CLR,GPRLOAD} = 2'b11;
        {RSELLOAD,ROP1LOAD,ROP2LOAD,TRLOAD,ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,MEMLOAD,PCINC,COUNTER_LD,COUNTER_INC} = 'd0;
        ALUSEL = 'd0;
        SYSTEMBUSSEL = 'd3;

        CPUstate = mvn2;
    end

    // default is nop
    default : begin
        // do nothing
        CPUstate = nop1;
    end

    endcase

end



endmodule