module bsy_reader_tb;

// internal wires

// in
logic bsy;
logic [7:0] data_in;


// out
logic [7:0] data_out;

// wiring
bsy_reader dut(

    // in
    .bsy(bsy),
    .data_in(data_in),

    // out
    .data_out(data_out)
);


// testing
initial begin
    
    data_in = 7'haa; // garbage data, do not read yet
    bsy = 1;
    #10ns;

    assert (data_out == 'd0) $display("passed busy; do not read"); else $error("failed busy; do not read");

    data_in = 7'h15; // the letter Q
    bsy = 0;
    #10ns;
    assert (data_out == data_in) $display("passed not busy; may read"); else $error("failed not busy; may read");


end




endmodule