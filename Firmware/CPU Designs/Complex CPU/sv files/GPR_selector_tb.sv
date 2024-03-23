module GPR_selector_tb;

// internal wires

// in
logic rst;
logic clk_50;
logic GPRLOAD;
logic [31:0] GPR_in;
logic [3:0] rop1;
logic [3:0] rop2;   // this only controls the second output to the ALU

// out
logic [31:0] GPR_out1;
logic [31:0] GPR_out2;

// inst and wiring
GPR_selector dut (

    // in

    .rst(rst),
    .clk_50(clk_50),
    .GPRLOAD(GPRLOAD),
    .GPR_in(GPR_in),
    .rop1(rop1),
    .rop2(rop2),

    // out
    .GPR_out1(GPR_out1),
    .GPR_out2(GPR_out2)

);


// clock
always begin

    clk_50 <= 1;
    #5ns;
    clk_50 <= 0;
    #5ns;

end

// loop var
int unsigned i;

// testing
initial begin

    // rst
    rst = 1;
    GPRLOAD = 0;
    GPR_in = 32'd250;
    rop1 = 'd0;
    rop2 = 'd0;
    
    #7ns;
    assert(GPR_out1 == 'd0 && GPR_out2 == 'd0) $display("passed reset"); else $error("failed reset");
    #3ns;

    rst = 0;

    $display("\n///////// loading data into registers /////////\n");

    for(i=0;i<13;i++) begin

        rop1 = i;
        GPRLOAD = 1;
        #10ns;
        GPRLOAD = 0;
        #10ns;

        GPR_in++;

    end

    $display("\n///////// displaying data from registers /////////\n");

    for(i=0;i<13;i++) begin

        rop1 = i; rop2 = i;
        #10ns;

        assert(GPR_out1 == (250+i) && GPR_out2 == (250+i)) $display("passed mmr %d",i); else $error("failed mmr %d",i);
       
    end

    GPR_in = 32'd100;

    $display("\n///////// loading data into registers /////////\n");

    for(i=0;i<13;i++) begin

        rop1 = i;
        GPRLOAD = 1;
        #10ns;
        GPRLOAD = 0;
        #10ns;

        GPR_in++;

    end

    $display("\n///////// displaying data from registers /////////\n");

    for(i=0;i<13;i++) begin

        rop1 = i; rop2 = i;
        #10ns;

        assert(GPR_out1 == (100+i) && GPR_out2 == (100+i)) $display("passed mmr %d",i); else $error("failed mmr %d",i);
       
    end

    rop1 = 0;

    $display("\n///////// displaying data on GPR_out2 only /////////\n");

    for(i=0;i<13;i++) begin

        rop2 = i;
        #10ns;

        assert(GPR_out1 == 100 && GPR_out2 == (100+i)) $display("passed mmr %d",i); else $error("failed mmr %d",i);
       
    end

    $stop;

end







endmodule