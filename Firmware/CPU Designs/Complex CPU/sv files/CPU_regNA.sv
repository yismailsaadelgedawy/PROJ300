module CPU_regNA #(parameter N=8) (

    output logic [N-1:0] q,

    input logic [N-1:0] d,
    input logic inc, load, rst, clk


);

// asynchronous version

logic [N-1:0] internal_reg = 'd0;

always_comb begin

    q = internal_reg;

end


always_ff @(posedge clk or posedge load) begin

    case(rst)

    // takes precedence
    1 : begin

        internal_reg <= 'd0;


    end


    0 : begin
        
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



    endcase



end



endmodule