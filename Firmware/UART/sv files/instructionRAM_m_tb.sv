module instructionRAM_m_tb;

// internal wires

// in
logic clk;
logic [1:0] MODE;
logic [9:0] address;
logic [7:0] data_in;
logic load, btn;

// out
logic [37:0] data_out;

// inst and wiring
instructionRAM_m dut (

    // in
    .clk(clk),
    .MODE(MODE),
    .address(address),
    .data_in(data_in),
    .load(load),
    .btn(btn),

    // out
    .data_out(data_out)

);

int unsigned i;     // loop vari
int unsigned err;   // error flag


always begin

    clk = 1;
    #5ns;
    clk = 0;
    #5ns;

end


// testing the following:
// {4'b0001,2'b01,16'h0000,16'h1000}      mov r0,  r1
initial begin

    // write mode - idle
    btn = 0;
    MODE = 'd0;
    address = 'd0;
    data_in = 'd0;
    load = 0; #10ns;    
    #50ns;

    /////////// write mode - BEGIN ///////////
    MODE = 'd0;
    address = 'd0;  // dc in this mode
    data_in = 8'b0001;
    load = 1;

    #7ns;
    assert(dut.opcode_reg == 8'b0001) else begin $error("failed opcode"); err++; end
    #3ns;

    load = 0; #10ns;

    data_in = 8'b0001;
    load = 1;

    #7ns;
    assert(dut.sel_reg == 8'b0001) else begin $error("failed sel"); err++; end
    #3ns;

    load = 0; #10ns;

    data_in = 8'b00000000;
    load = 1;

    #7ns;
    assert(dut.op1h_reg == 8'b00000000) else begin $error("failed op1h"); err++; end
    #3ns;

    load = 0; #10ns;

    data_in = 8'b00000000;
    load = 1;

    #7ns;
    assert(dut.op1l_reg == 8'b00000000) else begin $error("failed op1l"); err++; end
    #3ns;

    load = 0; #10ns;

    data_in = 8'b10000000;
    load = 1;

    #7ns;
    assert(dut.op2h_reg == 8'b10000000) else begin $error("failed op2h"); err++; end
    #3ns;

    load = 0; #10ns;

    data_in = 8'b00000000;
    load = 1;

    #7ns;
    assert(dut.op2l_reg == 8'b00000000) else begin $error("failed op2l"); err++; end
    assert(dut.ram[0] == {4'b0001,2'b01,16'h0000,16'h1000}) else begin $error("failed loading: mov r0,  r1"); err++; end
    #3ns;

    load = 0; #10ns;

    /////////// write mode - END ///////////



    /////////// debug mode - BEGIN ///////////
    MODE = 'd1;

    #7ns;
    assert(data_out == {4'b0001,2'b01,16'h0000,16'h1000}) else begin $error("failed output"); err++; end
    #3ns;

    btn = 1;
    #7ns;
    btn = 0;

    #7ns;
    assert(data_out == 'd0) else begin $error("failed debug output"); err++; end
    #3ns;

    /////////// debug mode - end ///////////



    /////////// random acces fetch mode - BEGIN ///////////
    MODE = 'd2;
    address = 'd0;

    #7ns;
    assert(data_out == {4'b0001,2'b01,16'h0000,16'h1000}) else begin $error("failed random access output 1"); err++; end
    #3ns;

    address = 'd1;

    #7ns;
    assert(data_out == 'd0) else begin $error("failed random access output 2"); err++; end
    #3ns;



    /////////// random acces fetch mode - BEGIN ///////////

    #50ns;  // run for a bit...


    if(!err) $display("\n///////////// ALL TESTS PASSED /////////////\n");
    else $display("\n///////////// NUMBER OF TESTS FAILED: %d /////////////\n", err);

    $stop;



end




endmodule