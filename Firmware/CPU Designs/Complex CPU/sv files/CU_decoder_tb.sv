module CU_decoder_tb;

// params
parameter N=6, states=40;

// internal wires

// in
logic [N-1:0] counter_value;

// out
logic [states-1:0] CPU_state;

// wiring
CU_decoder dut (

    // in
    .counter_value(counter_value),

    // out
    .CPU_state(CPU_state)

);



int unsigned i=0;   // this cannot be in a block


// testing
initial begin

    for (i=0; i<states; i++) begin

        counter_value = i[N-1:0]; // relevant bit extraction
        #10ns;
        assert(CPU_state == (1<<i)) $display("passed CPU state %d", i); else $error("failed CPU state %d", i);

    end


    $stop;


end






endmodule