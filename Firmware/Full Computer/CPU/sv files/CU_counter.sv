module CU_counter #(parameter opcode_bits=4, N=6) (

    output logic [N-1:0] q,

    input logic [opcode_bits-1:0] opcode,   // connected to IR
    input logic [1:0] sel_bits,             // connected to rsel
    input logic load, inc, clr, clk, rst


);

// registers
logic [N-1:0] counter_reg;
logic [opcode_bits-1:0] opcode_reg;
logic [1:0] select_bits = 2'b00;

always_comb begin

    q = counter_reg;
    select_bits = sel_bits;

end


// counter is incremented by CU via inc input! //

// 16 possible opcodes may be input
// indicating START state of execution routine
// 0  : nop
// 1  : mov
// 2  : ldr
// 3  : str
// 4  : cmp
// 5  : b
// 6  : bgt
// 7  : blt
// 8  : beq
// 9  : add
// 10 : sub
// 11 : mul
// 12 : lsr
// 13 : and
// 14 : or
// 15 : mvn

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



always_ff @(posedge clk) begin

    if(rst) begin

        counter_reg <= 'd0;
        opcode_reg <= 'd0;
        
    end


    else begin

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

                // opcode mapping to START state of routines
                case(opcode)

                // nop
                4'd0 : begin
                    counter_reg <= 'd3;
                end

                // mov
                4'd1 : begin
                    if(!select_bits[0]) begin
                        counter_reg <= 'd4;
                    end
                    
                    // ALTmov
                    else begin
                        counter_reg <= 'd5;
                    end
                    
                end

                // ldr
                4'd2 : begin
                    if(!select_bits[0]) begin
                        counter_reg <= 'd7;
                    end

                    // ALTload
                    else begin
                        counter_reg <= 'd9;
                    end
                end

                // str
                4'd3 : begin

                    if(!select_bits[0]) begin
                        counter_reg <= 'd13;
                    end

                    // ALTstr
                    else begin
                        counter_reg <= 'd17;
                    end
                end

                // cmp
                4'd4 : begin
                    counter_reg <= 'd21;
                end

                // b
                4'd5 : begin
                    counter_reg <= 'd22;
                end

                // bgt
                4'd6 : begin
                    counter_reg <= 'd23;
                end

                // blt
                4'd7 : begin
                    counter_reg <= 'd24;
                end

                // beq
                4'd8 : begin
                    counter_reg <= 'd25;
                end

                // add
                4'd9 : begin
                    counter_reg <= 'd26;
                end

                // sub
                4'd10 : begin
                    counter_reg <= 'd28;

                end

                // mul
                4'd11 : begin
                    counter_reg <= 'd30;

                end

                // lsr
                4'd12 : begin
                    counter_reg <= 'd32;

                end

                // and
                4'd13 : begin
                    counter_reg <= 'd34;

                end

                // or
                4'd14 : begin
                    counter_reg <= 'd36;
                end

                // mvn
                4'd15 : begin
                    counter_reg <= 'd38;
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

    

end



endmodule