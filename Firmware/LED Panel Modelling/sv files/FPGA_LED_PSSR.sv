module FPGA_LED_PSSR (

    output logic data_out,

    input logic [31:0] rA,rB,rC,rD,
    input logic [1:0] sel,
    input logic clk, rst
    
);

// add reset later!

logic [31:0] reg_a;
logic [31:0] reg_b;
logic [31:0] reg_c;
logic [31:0] reg_d;

// loop var
int unsigned i;

// data sent MSB first!!!

always_ff @(posedge clk) begin

    if(rst) begin

        reg_a <= 'd0;
        reg_b <= 'd0;
        reg_c <= 'd0;
        reg_d <= 'd0;
        data_out <= 0;

    end

    else begin

        // load data in registers
        // take care of assigning to the same thing multiple times
        // in the same block; last statement wins!
        // same reason why you cannot do data_out = reg_a[i]       

        // internal MUX
        case(sel)

        2'd0 : begin
            
            // load and restart...
            reg_d <= rD;

            data_out <= reg_a[31];
            for(i=31;i>0;i--) begin
                reg_a[i] <= reg_a[i-1];
            end
            reg_a[0] <= 0; // so zeros can follow!
            
        end

        2'd1 : begin
            data_out <= reg_b[31];
            for(i=31;i>0;i--) begin
                reg_b[i] <= reg_b[i-1];
            end
            reg_b[0] <= 0; // so zeros can follow!   
        end

        2'd2 : begin               
            data_out <= reg_c[31];
            for(i=31;i>0;i--) begin
                reg_c[i] <= reg_c[i-1];
            end
            reg_c[0] <= 0; // so zeros can follow!
            
        end

        2'd3 : begin
            
            // load and restart...
            reg_a <= rA;
            reg_b <= rB;
            reg_c <= rC;

            data_out <= reg_d[31];
            for(i=31;i>0;i--) begin
                reg_d[i] <= reg_d[i-1];
            end
            reg_d[0] <= 0; // so zeros can follow!   
        end    
        

        endcase

        

        

        

    end

    

end



endmodule