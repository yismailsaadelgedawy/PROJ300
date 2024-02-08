module key_detector_tb;

// internal wires

// in
logic [7:0] keyboard_data;

// out
logic [3:0] q;


// wiring
key_detector dut(

    // in
    .keyboard_data(keyboard_data),

    // out
    .q(q)

);


// testing
initial begin


    $display("/////////// testing normal notes ///////////");

    // nothing pressed
    keyboard_data = 7'h00;
    #10ns;
    assert(q == 'd0) $display("passed 1"); else $error("failed 1");


    // B
    keyboard_data = 7'h32;
    #10ns;
    assert(q == 'd1) $display("passed B"); else $error("failed B");


    // A
    keyboard_data = 7'h1C;
    #10ns;
    assert(q == 'd3) $display("passed A"); else $error("failed A");

    // G
    keyboard_data = 7'h34;
    #10ns;
    assert(q == 'd5) $display("passed G"); else $error("failed G");


    // F
    keyboard_data = 7'h2B;
    #10ns;
    assert(q == 'd7) $display("passed F"); else $error("failed F");


    // E
    keyboard_data = 7'h24;
    #10ns;
    assert(q == 'd8) $display("passed E"); else $error("failed E");


    // D
    keyboard_data = 7'h23;
    #10ns;
    assert(q == 'd10) $display("passed D"); else $error("failed D");


    // C
    keyboard_data = 7'h21;
    #10ns;
    assert(q == 'd12) $display("passed C"); else $error("failed C");



    $display(" ");
    $display("/////////// testing sharp notes ///////////");

    // pressing the shift key
    keyboard_data = 7'h13;
    #5ns; // simulating a delay between shift and pressing the next key
    keyboard_data = 7'h1C; // A#
    #10ns;
    assert(q == 'd2) $display("passed A#"); else $error("failed A#");
    keyboard_data = 7'h00; // nothing is pressed

    // pressing the shift key
    keyboard_data = 7'h13;
    #5ns; // simulating a delay between shift and pressing the next key
    keyboard_data = 7'h34; // G#
    #10ns;
    assert(q == 'd4) $display("passed G#"); else $error("failed G#");
    keyboard_data = 7'h00; // nothing is pressed

    // pressing the shift key
    keyboard_data = 7'h13;
    #5ns; // simulating a delay between shift and pressing the next key
    keyboard_data = 7'h34; // F#
    #10ns;
    assert(q == 'd6) $display("passed G#"); else $error("failed G#");
    keyboard_data = 7'h00; // nothing is pressed

    // pressing the shift key
    keyboard_data = 7'h13;
    #5ns; // simulating a delay between shift and pressing the next key
    keyboard_data = 7'h34; // D#
    #10ns;
    assert(q == 'd9) $display("passed G#"); else $error("failed G#");
    keyboard_data = 7'h00; // nothing is pressed

    // pressing the shift key
    keyboard_data = 7'h13;
    #5ns; // simulating a delay between shift and pressing the next key
    keyboard_data = 7'h34; // C#
    #10ns;
    assert(q == 'd11) $display("passed G#"); else $error("failed G#");
    keyboard_data = 7'h00; // nothing is pressed


    



end




endmodule
