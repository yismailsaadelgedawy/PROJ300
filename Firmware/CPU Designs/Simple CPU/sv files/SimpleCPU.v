// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
// CREATED		"Thu Feb 22 23:52:32 2024"

module SimpleCPU(
	CLK,
	RST,
	CLK_HALF
);


input wire	CLK;
input wire	RST;
input wire	CLK_HALF;

// control signals
wire	ARLOAD;
wire	PCLOAD;
wire	DRLOAD;
wire	ACLOAD;
wire	IRLOAD;
wire	PCINC;
wire	ACINC;
wire	[1:0] SYSBUSSEL;
wire	COUNTER_LD;
wire	COUNTER_INC;
wire	COUNTER_CLR;
wire	ALUSEL;
//

wire	[8:0] cu_decoder;
wire	[7:0] SYSTEM_BUS;
wire	[1:0] OPCODE;
wire	[3:0] cu_cnt;


wire	[7:0] AC;
wire	[7:0] AR;
wire	[7:0] ALU;


wire	clk_btn;
wire	[7:0] DRBUS;
wire	[7:0] MEMBUS;
wire	[7:0] PCBUS;
wire	sw_rst;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;

assign	SYNTHESIZED_WIRE_0 = 0;
assign	SYNTHESIZED_WIRE_1 = 0;
assign	SYNTHESIZED_WIRE_2 = 0;




CPU_regN	b2v_inst(
	.inc(SYNTHESIZED_WIRE_0),
	.load(ARLOAD),
	.rst(sw_rst),
	.clk(CLK_HALF),
	.d(SYSTEM_BUS[5:0]),
	.q(AR[5:0]));
	defparam	b2v_inst.N = 6;


CPU_regN	b2v_inst1(
	.inc(PCINC),
	.load(PCLOAD),
	.rst(sw_rst),
	.clk(CLK_HALF),
	.d(SYSTEM_BUS[5:0]),
	.q(PCBUS[5:0]));
	defparam	b2v_inst1.N = 6;


ALU	b2v_inst10(
	.ALUSEL(ALUSEL),
	.AC(AC),
	.AR(AR),
	.q(ALU));
	defparam	b2v_inst10.N = 8;


CU_decoder	b2v_inst11(
	.counter_value(cu_cnt),
	.CPU_state(cu_decoder));
	defparam	b2v_inst11.N = 4;
	defparam	b2v_inst11.states = 9;


CU_counter	b2v_inst12(
	.load(COUNTER_LD),
	.inc(COUNTER_INC),
	.clr(COUNTER_CLR),
	.clk(CLK_HALF),
	.rst(sw_rst),
	.opcode(OPCODE),
	.q(cu_cnt));
	defparam	b2v_inst12.N = 4;
	defparam	b2v_inst12.opcode_bits = 2;


CU_logic	b2v_inst13(
	.CPU_state(cu_decoder),
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
	.SYSTEMBUSSEL(SYSBUSSEL));
	defparam	b2v_inst13.states = 9;




CPU_regN	b2v_inst2(
	.inc(SYNTHESIZED_WIRE_1),
	.load(DRLOAD),
	.rst(sw_rst),
	.clk(CLK_HALF),
	.d(SYSTEM_BUS),
	.q(DRBUS));
	defparam	b2v_inst2.N = 8;


CPU_regN	b2v_inst3(
	.inc(ACINC),
	.load(ACLOAD),
	.rst(sw_rst),
	.clk(CLK_HALF),
	.d(ALU),
	.q(AC));
	defparam	b2v_inst3.N = 8;


CPU_regN	b2v_inst4(
	.inc(SYNTHESIZED_WIRE_2),
	.load(IRLOAD),
	.rst(sw_rst),
	.clk(clk_btn),
	.d(SYSTEM_BUS[7:6]),
	.q(OPCODE));
	defparam	b2v_inst4.N = 2;





systemBus_muxN	b2v_inst8(
	.a(PCBUS),
	.b(DRBUS),
	.c(MEMBUS),
	.sel(SYSBUSSEL),
	.q(SYSTEM_BUS));
	defparam	b2v_inst8.N = 8;


testROM	b2v_inst9(
	.address(AR[5:0]),
	.instruction(MEMBUS));
	defparam	b2v_inst9.ADDR_WIDTH = 6;
	defparam	b2v_inst9.DATA_WIDTH = 8;

assign	sw_rst = RST;
assign	clk_btn = CLK;
assign	AR[7:6] = 2'b00;
assign	PCBUS[7:6] = 2'b00;

endmodule
