module CU_counter #(parameter opcode_bits=2, N=4) (

    output logic [N-1:0] q,

    input logic [opcode_bits-1:0] opcode,
    input logic load, inc, clr, clk


);

// registers
logic [N-1:0] counter_reg;
logic [opcode_bits-1:0] opcode_reg;

always_comb begin

    q = counter_reg;

end


// counter is incremented by CU via inc input! //

// 4 possible opcodes may be input
// indicating START state of execution routine
// 00 : ADD
// 01 : AND
// 10 : JMP
// 11 : INC

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


always_ff @(posedge clk) begin

    case(clr)

    1 : begin

        counter_reg <= 'd0;
        opcode_reg <= 'd0;

    end

    // load : loading opcode into reg
    // inc  : incrementing the counter
    0 : begin

        case({load, inc})

        2'b10 : begin

            opcode_reg <= opcode;

            // opcode mapping
            case(opcode)

            // ADD1
            2'b00 : begin
                counter_reg <= 'd3;
            end
            
            // AND1
            2'b01 : begin
                counter_reg <= 'd5;
            end

            // JMP1
            2'b10 : begin
                counter_reg <= 'd7;
            end

            // INC1
            2'b11 : begin
                counter_reg <= 'd8;
            end


            endcase

        end

        2'b01 : begin

            counter_reg <= counter_reg + 1;

        end

        // else, (two) memory conditions -- valid!


        endcase

    end


    endcase


end



endmodule