module FPGA_LED_PSSR (

    output logic data_out,

    input logic [31:0] rA,rB,
    input logic sel, clk, rst, load
    
);

// add reset later!

logic [31:0] reg_a;
logic [31:0] reg_b;

// loop var
int unsigned i;

// data sent LSB first!!!

always_ff @(posedge clk) begin

    if(rst) begin

        reg_a <= 'd0;
        reg_b <= 'd0;
        data_out = 0;

    end

    else begin

        // load data in registers
        // without this, it won't work - assigning to the same thing multiple times
        // in the same block; last statement wins!
        // same reason why you cannot do data_out = reg_a[i]
        if(load) begin

            reg_a <= rA;
            reg_b <= rB;

        end

        else begin

            // internal MUX
            case(sel)

            0 : begin               
                data_out <= reg_a[0];
                for(i=0;i<31;i++) begin
                    reg_a[i] <= reg_a[i+1];
                end
                
            end

            1 : begin
                data_out <= reg_b[0];
                for(i=0;i<31;i++) begin
                    reg_b[i] <= reg_b[i+1];
                end   
            end    
            

            endcase

        end

        

        

    end

    

end



endmodule