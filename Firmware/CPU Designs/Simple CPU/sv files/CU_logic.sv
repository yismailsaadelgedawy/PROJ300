module CU_logic #(parameter states=9) (


    output logic ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,
    PCINC,ACINC,
    ALUSEL,
    COUNTER_LD,COUNTER_INC,COUNTER_CLR,

    output logic [1:0] SYSTEMBUSSEL,

    input logic [states-1:0] CPU_state

);

// logic derived in "instructions.txt"

// counter mapping is as follows (9 states)
// FETCH1   : 0
// FETCH2   : 1
// FETCH3   : 2
// ADD1     : 3*
// ADD2     : 4
// AND1     : 5*
// AND2     : 6
// JMP1     : 7*
// INC1     : 8*


// SYSTEMBUSSEL = 0 : PCBUS
// SYSTEMBUSSEL = 1 : DRBUS
// SYSTEMBUSSEL = 2 : MEMBUS

always_comb begin

    case(CPU_state)

    // FETCH1
    9'b000000001 : begin

        ARLOAD = 1;
        SYSTEMBUSSEL = 2'd0;
        COUNTER_INC = 1;

        {PCLOAD,DRLOAD,ACLOAD,IRLOAD,PCINC,ACINC,ALUSEL,COUNTER_LD,COUNTER_CLR} = 'd0;

    end

    // FETCH2
    9'b000000010 : begin
        
        DRLOAD = 1;
        PCINC = 1;
        SYSTEMBUSSEL = 2'd2;
        COUNTER_INC = 1;

        {ARLOAD,PCLOAD,ACLOAD,IRLOAD,ACINC,ALUSEL,COUNTER_LD,COUNTER_CLR} = 'd0;

    end

    // FETCH3
    9'b000000100 : begin
        
        ARLOAD = 1;
        IRLOAD = 1;
        SYSTEMBUSSEL = 2'd1;
        COUNTER_LD = 1;

        {PCLOAD,DRLOAD,ACLOAD,PCINC,ACINC,ALUSEL,COUNTER_INC,COUNTER_CLR} = 'd0;

    end

    

    // ADD1
    9'b000001000 : begin
        
        DRLOAD = 1;
        SYSTEMBUSSEL = 2'd2;
        COUNTER_INC = 1;

        {ARLOAD,PCLOAD,ACLOAD,IRLOAD,PCINC,ACINC,ALUSEL,COUNTER_LD,COUNTER_CLR} = 'd0;

    end

    // ADD2
    9'b000010000 : begin
        
        ACLOAD = 1;
        SYSTEMBUSSEL = 2'd1;
        COUNTER_CLR = 1;

        {ARLOAD,PCLOAD,DRLOAD,IRLOAD,PCINC,ACINC,ALUSEL,COUNTER_LD,COUNTER_INC} = 'd0;

    end

    // AND1
    9'b000100000 : begin
        
        DRLOAD = 1;
        SYSTEMBUSSEL = 2'd2;
        COUNTER_INC = 1;

        {ARLOAD,PCLOAD,ACLOAD,IRLOAD,PCINC,ACINC,ALUSEL,COUNTER_LD,COUNTER_CLR} = 'd0;

    end

    // AND2
    9'b001000000 : begin
        
        ACLOAD = 1;
        SYSTEMBUSSEL = 2'd1;
        COUNTER_CLR = 1;
        ALUSEL = 1;

        {ARLOAD,PCLOAD,DRLOAD,IRLOAD,PCINC,ACINC,COUNTER_LD,COUNTER_INC} = 'd0;

    end

    // JMP1
    9'b010000000 : begin
        
        PCLOAD = 1;
        SYSTEMBUSSEL = 2'd1;
        COUNTER_CLR = 1;

        {ARLOAD,DRLOAD,ACLOAD,IRLOAD,PCINC,ACINC,ALUSEL,COUNTER_LD,COUNTER_INC} = 'd0;

    end

    // INC1
    9'b100000000 : begin

        ACINC = 1;
        COUNTER_CLR = 1;

        {ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,PCINC,ALUSEL,COUNTER_LD,COUNTER_INC} = 'd0;
        SYSTEMBUSSEL = 'd0;
        
    end

    default : begin

        {ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,PCINC,ACINC,ALUSEL,COUNTER_LD,COUNTER_INC,COUNTER_CLR} = 'd0;
        SYSTEMBUSSEL = 'd0;

    end


    endcase


end








endmodule