module instructionRAM #(parameter NUMBER_OF_INSTRUCTIONS = 4) (

    output logic [37:0] instruction,
    output logic [7:0] debugA, debugB, debugC,

    input logic [7:0] opcode, sel, op1h, op1l, op2h, op2l,
    input logic [11:0] addr,
    input logic rst, btnA, btnB, load, clk    // connected to rdy of instruction RAM
    
);


// 4 instructions for now
bit [37:0] ram [NUMBER_OF_INSTRUCTIONS-1:0];

// loop var
int unsigned i;

// addr counters
int unsigned address_cnt = 0;
int unsigned debug_address_cnt = 0;


logic current = 0;
logic prev = 0;


// always_comb and always_latch update when any input CHANGES
// which is why if load is held high, the count does not keep counting!
// equivalent to verilog's always @(*) where * is a wildcard meaning any input change!
always_ff @(posedge clk) begin

    if(rst) begin

        current = 0;
        prev = 0;

        address_cnt <= 'd0;
        debug_address_cnt <= 'd0;
        {debugA,debugB,debugC} <= 'd0;
        instruction <= 'd0;

        // clearing out all RAM contents
        for (i=0; i<NUMBER_OF_INSTRUCTIONS; i++) begin

            ram[i] <= 'd0;

        end

    end

    else begin

        instruction <= ram[addr];

        if(load) begin

            ram[address_cnt] <= {opcode[3:0], sel[1:0], op1h, op1l, op2h, op2l};
            address_cnt <= address_cnt + 1;

        end

        current <= btnA;    // cycle 1
        prev <= current;    // cycle 2


        // rising edge detector:
        // this acts as a "guard"
        // without it (i.e. level triggered), since the circuitry updates 9600 times/sec,
        // it will "see" many button inputs - bad!
        // e.g. NOT if(btnA)...
        if(current && !prev) begin
           
            if(debug_address_cnt != NUMBER_OF_INSTRUCTIONS-1) debug_address_cnt <= debug_address_cnt + 1;                     
                    

        end

        if(!btnB) begin

            debugA <= ram[debug_address_cnt][37:34];
            debugB <= ram[debug_address_cnt][33:32];
            debugC <= ram[debug_address_cnt][31:24];

        end

        else begin

            debugA <= ram[debug_address_cnt][23:16];
            debugB <= ram[debug_address_cnt][15:8];
            debugC <= ram[debug_address_cnt][7:0];

        end

    end

    


end



endmodule