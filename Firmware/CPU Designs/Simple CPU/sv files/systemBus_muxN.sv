module systemBus_muxN #(parameter N=8) (

    output logic [N-1:0] q,

    input logic [N-1:0] a,b,c,
    input logic [1:0] sel


);

// bus connections
// a : PCBUS
// b : DRBUS
// c : MEMBUS

always_comb begin

    case(sel)

    // PCBUS
    2'd0 : begin

        q = a;

    end

    // DRBUS
    2'd1 : begin

        q = b;

    end

    // MEMBUS
    2'd2 : begin

        q = c;

    end

    default : begin

        q = a;

    end


    endcase


end



endmodule