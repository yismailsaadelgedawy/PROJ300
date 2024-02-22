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

    for (i=0; i<states; i++) begin

        if (counter_value == i[N-1:0]) begin
            CPU_state = 1 << i;
        end
        
    end

end




endmodule