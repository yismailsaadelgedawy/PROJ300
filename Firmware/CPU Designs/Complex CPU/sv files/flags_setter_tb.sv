module flags_setter_tb;

// internal wires

// in
logic rst,ACLOAD;
logic [3:0] opcode;
logic [11:0] op1,op2;
logic [11:0] AC_result;

// out
logic N,Z,C,V;

// instantiation and wiring
flags_setter dut (

    // in
    .rst(rst),
    .ACLOAD(ACLOAD),
    .opcode(opcode),
    .op1(op1),
    .op2(op2),
    .AC_result(AC_result),

    // out
    .N(N),
    .Z(Z),
    .C(C),
    .V(V)

);


// testing
initial begin

    

    // reset condition
    rst = 1;
    ACLOAD = 0;
    {opcode, AC_result,op1,op2} = {4'b0000, 12'h000,12'h000,12'h000};
    #10ns;

    assert({N,Z,C,V} == 4'b0000) $display("passed reset"); else $error("failed reset");
    rst = 0;

    // 0x003 = 0x05 - 0x002 (cmp)
    ACLOAD = 1;
    {opcode, AC_result,op1,op2} = {4'b0100, 12'h003,12'h005,12'h002};    
    #10ns;
    
    assert({N,Z,C,V} == 4'b0010) $display("passed 5"); else $error("failed 5");
    ACLOAD = 0; #10ns;

    // 0x000 = 0xfff + 0x001 
    ACLOAD = 1;
    {opcode, AC_result,op1,op2} = {4'b1001, 12'h000,12'hfff,12'h001};    
    #10ns;    

    assert({N,Z,C,V} == 4'b0110) $display("passed 1"); else $error("failed 1");
    ACLOAD = 0; #10ns;

    // 0x003 = 0x05 - 0x002
    ACLOAD = 1;
    {opcode, AC_result,op1,op2} = {4'b1010, 12'h003,12'h005,12'h002};    
    #10ns;
    

    assert({N,Z,C,V} == 4'b0010) $display("passed 2"); else $error("failed 2");
    ACLOAD = 0; #10ns;

    // 0x800 = 0x7ff + 0x001
    ACLOAD = 1;
    {opcode, AC_result,op1,op2} = {4'b1001, 12'h800,12'h7ff,12'h001};    
    #10ns;    

    assert({N,Z,C,V} == 4'b1001) $display("passed 3"); else $error("failed 3");
    ACLOAD = 0; #10ns;

    // 0x7ff = 0x800 - 0x001
    ACLOAD = 1;
    {opcode, AC_result,op1,op2} = {4'b1010, 12'h7ff,12'h800,12'h001};    
    #10ns;    

    assert({N,Z,C,V} == 4'b0011) $display("passed 4"); else $error("failed 4");
    ACLOAD = 0; #10ns;

    


end


endmodule