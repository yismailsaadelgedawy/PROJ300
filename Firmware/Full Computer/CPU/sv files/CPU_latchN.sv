module CPU_latchN #(parameter N=8) (

    output logic [N-1:0] q,

    input logic [N-1:0] d,
    input logic inc, load, rst


);

// latch to be used rather than an asynchronous register 
// to avoid synthesis errors with asynchronous logic

logic [N-1:0] internal_reg = 'd0;

always_comb begin

    q = internal_reg;

end


always_latch begin

    case(rst)

    // takes precedence
    1 : begin

        internal_reg <= 'd0;


    end


    0 : begin

        if(load) begin

            case({load, inc})

            2'b10 : begin

                internal_reg <= d;

            end

            2'b01 : begin

                internal_reg <= internal_reg + 1;

            end

            // else, (two) memory conditions -- valid!


        endcase

        end    
        



    end



    endcase



end



endmodule