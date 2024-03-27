module SPSR #(parameter N=8) (

    output logic [N-1:0] q,

    input logic DS,
    input logic nrst, SHCP 

);

logic [N-1:0] shift_reg;

assign q = shift_reg;

// loop var
int unsigned i;

always_ff @(posedge SHCP or negedge nrst) begin

    if(!nrst) shift_reg <= 'd0;

    else begin

        shift_reg[0] <= DS;

        for(i=1;i<8;i++) begin
            shift_reg[i] <= shift_reg[i-1];
        end


    end


end



endmodule