module instructionRAM_tb;

// internal wires

// in
logic clk;
logic [7:0] opcode, sel, op1h, op1l, op2h, op2l;
logic [11:0] addr;
logic rst, btnA, btnB, load;

// out
logic [37:0] instruction;
logic [7:0] debugA, debugB, debugC;

// inst and wiring
instructionRAM dut (

    // in
    .rst(rst),
    .clk(clk),
    .opcode(opcode),
    .sel(sel),
    .op1h(op1h),
    .op1l(op1l),
    .op2h(op2h),
    .op2l(op2l),
    .addr(addr),
    .btnA(btnA),
    .btnB(btnB),
    .load(load),

    // out
    .instruction(instruction),
    .debugA(debugA),
    .debugB(debugB),
    .debugC(debugC)


);


// clk
always begin

    clk = 1;
    #5ns;
    clk = 0;
    #5ns;

end


// testing
initial begin

    // rst
    rst = 1;
    addr = 'd0;
    btnA = 0;
    btnB = 0;
    load = 0;
    opcode = 8'h01;
    sel = 8'h01;
    op1h = 8'h00;
    op1l = 8'h02;
    op2h = 8'h00;
    op2l = 8'h03;
    
    #7ns;
    assert(instruction == 'd0 && {debugA,debugB,debugC} == 'd0) $display("passed rst"); else $error("failed rst");
    #3ns;

    rst = 0;
    
    #7ns;
    assert(instruction == 'd0 && {debugA,debugB,debugC} == 'd0) $display("passed 1"); else $error("failed 1");
    #3ns;

    load = 1;
    #10ns;
    load = 0;
    
    #7ns;
    assert(instruction == {4'b0001,2'b01,16'b10,16'b11} && {debugA,debugB,debugC} == {8'd1,8'd1,8'd0}) $display("passed 2"); else $error("failed 2");
    #3ns;


    btnB = 1;
    
    #7ns;
    assert({debugA,debugB,debugC} == {8'd2,8'd0,8'd3}) $display("passed 3"); else $error("failed 3");
    #3ns;

    // loading more instructions

    opcode = 8'h02;
    sel = 8'h01;
    op1h = 8'h00;
    op1l = 8'h02;
    op2h = 8'h00;
    op2l = 8'h03;

    load = 1;
    #10ns;
    load = 0;
    #10ns;

    opcode = 8'h03;
    sel = 8'h01;
    op1h = 8'h00;
    op1l = 8'h02;
    op2h = 8'h00;
    op2l = 8'h03;

    load = 1;
    #10ns;
    load = 0;
    #10ns;

    opcode = 8'h04;
    sel = 8'h01;
    op1h = 8'h00;
    op1l = 8'h02;
    op2h = 8'h00;
    op2l = 8'h03;

    load = 1;
    #10ns;
    load = 0;
    #10ns;


    // testing random access fetch
    for(int unsigned i=0; i<4; i++) begin

        addr = i[11:0];
        #10ns;

    end


    $stop;


end



endmodule