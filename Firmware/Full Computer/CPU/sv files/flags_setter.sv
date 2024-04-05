module flags_setter (

    output logic N,Z,C,V,

    input logic [3:0] opcode,
    input logic [11:0] op1,op2,
    input logic [11:0] AC_result,   // concerned with the bottom 12 bits only
    input logic rst, ACLOAD

);

// helps with debugging
typedef enum logic [1:0] {reset,cmp,add,sub} instruction_t;

instruction_t instruction;


// instructions that set the flags are:
// cmp : 0100
// add : 1001
// sub : 1010


// always_ff caused bugs in testing
always_latch begin

    if(rst) begin
        instruction <= reset;        
        {N,Z,C,V} <= 'd0;
    end

    else begin

        if(ACLOAD) begin

            case(opcode)

            // cmp (same as sub)
            4'b0100 : begin

                instruction <= cmp;

                // N
                if(AC_result[11] == 1) begin
                    N <= 1;
                end
                else begin
                    N <= 0;
                end

                // Z
                if(AC_result == 'd0) begin
                    Z <= 1;
                end
                else begin
                    Z <= 0;
                end

                // C - set when borrow did NOT occur (op1 > op2)                
                // so when result is smaller than either operand
                if(AC_result < op1 || AC_result < op2) begin
                    C <= 1;
                end
                else begin
                    C <= 0;
                end

                // V - sign bit changes to 0 when subtracting a positive number from a negative number
                if(AC_result[11] == 0 && op1[11] == 1 && op2[11] == 0) begin
                    V <= 1;
                end
                else begin
                    V <= 0;
                end



            end

            // add
            4'b1001 : begin

                instruction <= add;

                // N
                if(AC_result[11] == 1) begin
                    N <= 1;
                end
                else begin
                    N <= 0;
                end

                // Z
                if(AC_result == 'd0) begin
                    Z <= 1;
                end
                else begin
                    Z <= 0;
                end

                // C - set due to overflow
                // when result is smaller than either operand
                if(AC_result < op1 || AC_result < op2) begin
                    C <= 1;
                end
                else begin
                    C <= 0;
                end

                // V - sign bit changes to 1 when adding two positive numbers
                if(AC_result[11] == 1 && op1[11] == 0 && op2[11] == 0) begin
                    V <= 1;
                end
                else begin
                    V <= 0;
                end

            end


            // sub
            4'b1010 : begin

                instruction <= sub;

                // N
                if(AC_result[11] == 1) begin
                    N <= 1;
                end
                else begin
                    N <= 0;
                end

                // Z
                if(AC_result == 'd0) begin
                    Z <= 1;
                end
                else begin
                    Z <= 0;
                end

                // C - set when borrow did NOT occur (op1 > op2)                
                // so when result is smaller than either operand
                if(AC_result < op1 || AC_result < op2) begin
                    C <= 1;
                end
                else begin
                    C <= 0;
                end

                // V - sign bit changes to 0 when subtracting a positive number from a negative number
                if(AC_result[11] == 0 && op1[11] == 1 && op2[11] == 0) begin
                    V <= 1;
                end
                else begin
                    V <= 0;
                end



            end

        
        endcase

        // otherwise, flags latch
        // NOT RESET!

        end
             
        


    end

    



end




endmodule