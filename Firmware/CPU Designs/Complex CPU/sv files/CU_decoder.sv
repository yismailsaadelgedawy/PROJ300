module CU_decoder #(parameter N=6, states=40) (

    output logic [states-1:0] CPU_state,
    input logic [N-1:0] counter_value

);

// loop var
int unsigned i=0;

// always_comb:  does not infer purely combinational logic for some reason...
// so a nice trick: use always_latch :winky-face:
always_latch begin

    // 2**N of counter_value to not need a "default" statement
    // and hence be synthesisable by comb logic and a for loop
    // as we cover all input combinations for "counter_value"
    for(i=0;i<2**N;i++) begin

        case (counter_value)

        i : begin
            CPU_state = 1<<i;
        end

        endcase

    end


end




endmodule