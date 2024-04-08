module CPUTimer_tb;

// internal wires

// in
logic rst, clk;
logic [12:0] Tms;


// out
logic rdy;

// inst and wiring
CPUTimer dut(
    
    // in
    .rst(rst),
    .clk(clk),
    .Tms(Tms),

    .rdy(rdy)


);


// 50MHz clk (T=20ns)
always begin

    clk = 1;
    #10ns;
    clk = 0;
    #10ns;

end

// testing
initial begin

    // rst condition
    rst = 1;
    Tms = 'd100; // 100ms

    #17ns;
    assert(rdy == 0 && dut.N == 'd5000000 && dut.count_reg == 'd0) $display("passed rst"); else $error("failed rst");
    #3ns;

    $display("\n//////////// timer start (100ms) ////////////\n");

    // start timer
    rst = 0;

    #100ms; // run...

    #17ns;
    assert(rdy == 1) $display("passed rdy flag"); else $error("failed rdy flag");
    #3ns

    #40ns;

    #50ms;

    $display("\n//////////// timer stop ////////////\n");

    // CPU will now stop timer by sending a 0 on the Tms bus
    Tms = 'd0;

    #17ns;
    assert(rdy == 0 && dut.N == 'd0 && dut.count_reg == 'd0) $display("passed timer stop"); else $error("failed timer stop");
    #3ns


    $stop;



end



endmodule