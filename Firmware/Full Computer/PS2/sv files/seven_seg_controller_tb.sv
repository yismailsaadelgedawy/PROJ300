module seven_seg_controller_tb;

// internal wires

// in
logic [7:0] data;

// out
logic [0:6] disp0, disp1;

// wiring
seven_seg_controller dut(

    // in
    .data(data),
    
    // out
    .disp0(disp0),
    .disp1(disp1)

);


// testing
initial begin

    data[3:0] = 'd0;
    data[7:4] = 'd0;
    #10ns;

    data[3:0] = 'd1;
    #10ns;

    data[3:0] = 'd2;
    #10ns;

    data[3:0] = 'd3;
    #10ns;

    data[3:0] = 'd4;
    #10ns;

    data[3:0] = 'd5;
    #10ns;

    data[3:0] = 'd6;
    #10ns;

    data[3:0] = 'd7;
    #10ns;

    data[3:0] = 'd8;
    #10ns;

    data[3:0] = 'd9;
    #10ns;

    data[3:0] = 'd10;
    #10ns;

    data[3:0] = 'd11;
    #10ns;

    data[3:0] = 'd12;
    #10ns;

    data[3:0] = 'd13;
    #10ns;

    data[3:0] = 'd14;
    #10ns;

    data[3:0] = 'd15;
    #10ns;
    


end



endmodule