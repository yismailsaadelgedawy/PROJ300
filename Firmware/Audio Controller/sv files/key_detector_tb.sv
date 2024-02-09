module key_detector_tb;


// outdated, but I know it works //
// may update later //

// internal wires

// in
logic clk;
logic rst;
logic [7:0] keyboard_data;

// out
logic [3:0] q;


// wiring
key_detector dut(

    // in
    .clk(clk),
    .rst(rst),
    .keyboard_data(keyboard_data),

    // out
    .q(q)

);


// 50MHz clock
// time period is 20ns
always begin

    clk = 1;
    #10ns;
    clk = 0;
    #10ns;

end

// testing
initial begin

    rst = 1;
    #15ns;
    assert(q == 'd0) $display("passed reset"); else $error("failed reset");
    #5ns;
    


    $display("/////////// testing normal notes ///////////");

    // nothing pressed
    rst = 0;
    keyboard_data = 8'h00;
    #15ns;
    assert(q == 'd0) $display("passed 1"); else $error("failed 1");
    #5ns;


    // B
    keyboard_data = 8'h32;
    #15ns;
    assert(q == 'd1) $display("passed B"); else $error("failed B");
    #5ns;


    // A
    keyboard_data = 8'h1C;
    #15ns;
    assert(q == 'd3) $display("passed A"); else $error("failed A");
    #5ns;

    // G
    keyboard_data = 8'h34;
    #15ns;
    assert(q == 'd5) $display("passed G"); else $error("failed G");
    #5ns;

    // F
    keyboard_data = 8'h2B;
    #15ns;
    assert(q == 'd7) $display("passed F"); else $error("failed F");
    #5ns;

    // E
    keyboard_data = 8'h24;
    #15ns;
    assert(q == 'd8) $display("passed E"); else $error("failed E");
    #5ns;

    // D
    keyboard_data = 8'h23;
    #15ns;
    assert(q == 'd10) $display("passed D"); else $error("failed D");
    #5ns;

    // C
    keyboard_data = 8'h21;
    #15ns;
    assert(q == 'd12) $display("passed C"); else $error("failed C");
    #5ns;


    $display(" ");
    $display("/////////// testing sharp notes ///////////");

    // pressing the shift key
    keyboard_data = 8'h12;
    #20ns; // simulating a delay between shift and pressing the next key
    keyboard_data = 8'h1C; // A#
    #15ns;
    assert(q == 'd2) $display("passed A#"); else $error("failed A#");
    #5ns;

    // pressing the shift key
    keyboard_data = 8'h12;
    #20ns; // simulating a delay between shift and pressing the next key
    keyboard_data = 8'h34; // G#
    #15ns;
    assert(q == 'd4) $display("passed G#"); else $error("failed G#");
    #5ns;
    

    // pressing the shift key
    keyboard_data = 8'h12;
    #20ns; // simulating a delay between shift and pressing the next key
    keyboard_data = 8'h2B; // F#
    #15ns;
    assert(q == 'd6) $display("passed F#"); else $error("failed G#");
    #5ns;
    

    // pressing the shift key
    keyboard_data = 8'h12;
    #20ns; // simulating a delay between shift and pressing the next key
    keyboard_data = 8'h23; // D#
    #15ns;
    assert(q == 'd9) $display("passed D#"); else $error("failed G#");
    #5ns;
    

    // pressing the shift key
    keyboard_data = 8'h12;
    #20ns; // simulating a delay between shift and pressing the next key
    keyboard_data = 8'h21; // C#
    #15ns;
    assert(q == 'd11) $display("passed C#"); else $error("failed G#");
    #5ns;



    rst = 1;
    #15ns;
    assert(q == 'd0) $display("passed reset"); else $error("failed reset");
    #5ns;
    


    
    $stop;


end




endmodule
