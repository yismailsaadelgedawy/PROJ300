module CU_logic_tb;

// parameters
parameter states=9;


// internal wires

// in
logic [states-1:0] CPU_state;

// out
logic ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,PCINC,ACINC,ALUSEL,COUNTER_LD,COUNTER_INC,COUNTER_CLR;
logic [1:0] SYSTEMBUSSEL;

// wiring
CU_logic dut (

    // in
    .CPU_state(CPU_state),

    // out
    .ARLOAD(ARLOAD),
    .PCLOAD(PCLOAD),
    .DRLOAD(DRLOAD),
    .ACLOAD(ACLOAD),
    .IRLOAD(IRLOAD),
    .PCINC(PCINC),
    .ACINC(ACINC),
    .ALUSEL(ALUSEL),
    .COUNTER_LD(COUNTER_LD),
    .COUNTER_INC(COUNTER_INC),
    .COUNTER_CLR(COUNTER_CLR),
    .SYSTEMBUSSEL(SYSTEMBUSSEL)


);


// testing
initial begin

    $display("FETCH1");
    $display("");
    CPU_state = 9'b000000001;
    #10ns;
    assert (COUNTER_INC && ARLOAD && SYSTEMBUSSEL == 'd0) $display("passed FETCH1"); else $error("failed FETCH1");
    assert ({PCLOAD,DRLOAD,ACLOAD,IRLOAD,PCINC,ACINC,ALUSEL,COUNTER_LD,COUNTER_CLR} == 'd0) $display("passed other signals LOW"); else $error("failed other signals LOW");

    $display("");
    $display("FETCH2");
    $display("");
    CPU_state = 9'b000000010;
    #10ns;
    assert (COUNTER_INC && DRLOAD && PCINC && SYSTEMBUSSEL == 'd2) $display ("passed FETCH2"); else $error("failed FETCH2");
    assert ({ARLOAD,PCLOAD,ACLOAD,IRLOAD,ACINC,ALUSEL,COUNTER_LD,COUNTER_CLR} == 'd0) $display("passed other signals LOW"); else $error("failed other signals LOW");

    $display("");
    $display("FETCH3");
    $display("");
    CPU_state = 9'b000000100;
    #10ns;
    assert (COUNTER_LD && ARLOAD && IRLOAD && SYSTEMBUSSEL == 'd1) $display ("passed FETCH3"); else $error("failed FETCH3");
    assert ({PCLOAD,DRLOAD,ACLOAD,PCINC,ACINC,ALUSEL,COUNTER_INC,COUNTER_CLR} == 'd0) $display("passed other signals LOW"); else $error("failed other signals LOW");

    $display("");
    $display("ADD1");
    $display("");
    CPU_state = 9'b000001000;
    #10ns;
    assert (COUNTER_INC && DRLOAD && SYSTEMBUSSEL == 'd2) $display ("passed ADD1"); else $error("failed ADD1");
    assert ({ARLOAD,PCLOAD,ACLOAD,IRLOAD,PCINC,ACINC,ALUSEL,COUNTER_LD,COUNTER_CLR} == 'd0) $display("passed other signals LOW"); else $error("failed other signals LOW");

    $display("");
    $display("ADD2");
    $display("");
    CPU_state = 9'b000010000;
    #10ns;
    assert (COUNTER_CLR && ACLOAD && SYSTEMBUSSEL == 'd1) $display ("passed ADD2"); else $error("failed ADD2");
    assert ({ARLOAD,PCLOAD,DRLOAD,IRLOAD,PCINC,ACINC,ALUSEL,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed other signals LOW"); else $error("failed other signals LOW");

    $display("");
    $display("AND1");
    $display("");
    CPU_state = 9'b000100000;
    #10ns;
    assert (COUNTER_INC && DRLOAD && SYSTEMBUSSEL == 'd2) $display ("passed AND1"); else $error("failed AND1");
    assert ({ARLOAD,PCLOAD,ACLOAD,IRLOAD,PCINC,ACINC,ALUSEL,COUNTER_LD,COUNTER_CLR} == 'd0) $display("passed other signals LOW"); else $error("failed other signals LOW");

    $display("");
    $display("AND2");
    $display("");
    CPU_state = 9'b001000000;
    #10ns;
    assert (COUNTER_CLR && ACLOAD && ALUSEL && SYSTEMBUSSEL == 'd1) $display ("passed AND2"); else $error("failed AND2");
    assert ({ARLOAD,PCLOAD,DRLOAD,IRLOAD,PCINC,ACINC,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed other signals LOW"); else $error("failed other signals LOW");

    $display("");
    $display("JMP1");
    $display("");
    CPU_state = 9'b010000000;
    #10ns;
    assert (COUNTER_CLR && PCLOAD && SYSTEMBUSSEL == 'd1) $display ("passed JMP1"); else $error("failed JMP1");
    assert ({ARLOAD,DRLOAD,ACLOAD,IRLOAD,PCINC,ACINC,ALUSEL,COUNTER_LD,COUNTER_INC} == 'd0) $display("passed other signals LOW"); else $error("failed other signals LOW");

    $display("");
    $display("INC1");
    $display("");
    CPU_state = 9'b100000000;
    #10ns;
    assert (COUNTER_CLR && ACINC && SYSTEMBUSSEL == 'd0) $display ("passed INC1"); else $error("failed INC1");
    assert ({ARLOAD,PCLOAD,DRLOAD,ACLOAD,IRLOAD,PCINC,ALUSEL,COUNTER_LD,COUNTER_INC} == 'd0 && SYSTEMBUSSEL == 'd0) $display("passed other signals LOW"); else $error("failed other signals LOW");


end


endmodule