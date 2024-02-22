module CU_decoder #(parameter N=4, states=9) (

    output logic [states-1:0] CPU_state,
    input logic [N-1:0] counter_value

);

// loop var
int unsigned i=0;

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

always_comb begin

    case(counter_value)

    'd0 : begin

        CPU_state = 1<<0;

    end

    'd1 : begin

        CPU_state = 1<<1;

    end

    'd2 : begin

        CPU_state = 1<<2;

    end

    'd3 : begin

        CPU_state = 1<<3;

    end

    'd4 : begin

        CPU_state = 1<<4;

    end

    'd5 : begin

        CPU_state = 1<<5;

    end

    'd6 : begin

        CPU_state = 1<<6;

    end

    'd7 : begin

        CPU_state = 1<<7;

    end

    'd8 : begin

        CPU_state = 1<<8;

    end


    // makes it synthesisable using comb logic
    // needed as we are not using all values up to (2**N) - 1
    default : begin

        CPU_state = 'd0;

    end
    


    endcase


end




endmodule