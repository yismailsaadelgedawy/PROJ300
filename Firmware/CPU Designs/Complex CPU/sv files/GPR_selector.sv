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
// VERSION		"Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"
// CREATED		"Sat Mar 23 13:46:46 2024"

module GPR_selector(
	rst,
	clk_50,
	GPRLOAD,
	GPR_in,
	rop1,
	rop2,
	GPR_out1,
	GPR_out2
);


input wire	rst;
input wire	clk_50;
input wire	GPRLOAD;
input wire	[31:0] GPR_in;
input wire	[3:0] rop1;
input wire	[3:0] rop2;
output wire	[31:0] GPR_out1;
output wire	[31:0] GPR_out2;

wire	clk;
wire	[32:0] conc_data;
wire	[32:0] rA;
wire	[32:0] rB;
wire	[32:0] rC;
wire	[32:0] rD;
wire	[32:0] rE;
wire	[31:0] regA;
wire	[31:0] regB;
wire	[31:0] regC;
wire	[31:0] regD;
wire	[31:0] regE;
wire	[31:0] regF;
wire	[31:0] regG;
wire	[31:0] regH;
wire	[31:0] regI;
wire	[31:0] regJ;
wire	[31:0] regK;
wire	[31:0] regL;
wire	[31:0] regM;
wire	[32:0] rF;
wire	[32:0] rG;
wire	[32:0] rH;
wire	[32:0] rI;
wire	[32:0] rJ;
wire	[32:0] rK;
wire	[32:0] rL;
wire	[32:0] rM;
wire	sel0;
wire	sel1;
wire	sel2;
wire	sel20;
wire	sel21;
wire	sel22;
wire	sel23;
wire	sel3;
wire	sw_rst;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;

assign	SYNTHESIZED_WIRE_0 = 0;
assign	SYNTHESIZED_WIRE_1 = 0;
assign	SYNTHESIZED_WIRE_2 = 0;
assign	SYNTHESIZED_WIRE_3 = 0;
assign	SYNTHESIZED_WIRE_4 = 0;
assign	SYNTHESIZED_WIRE_5 = 0;
assign	SYNTHESIZED_WIRE_6 = 0;
assign	SYNTHESIZED_WIRE_7 = 0;
assign	SYNTHESIZED_WIRE_8 = 0;
assign	SYNTHESIZED_WIRE_9 = 0;
assign	SYNTHESIZED_WIRE_10 = 0;
assign	SYNTHESIZED_WIRE_11 = 0;
assign	SYNTHESIZED_WIRE_12 = 0;
wire	[3:0] GDFX_TEMP_SIGNAL_0;


assign	GDFX_TEMP_SIGNAL_0 = {sel3,sel2,sel1,sel0};


GPR_DEMUX	b2v_inst(
	.data_in(conc_data),
	.sel(GDFX_TEMP_SIGNAL_0),
	.rA(rA),
	.rB(rB),
	.rC(rC),
	.rD(rD),
	.rE(rE),
	.rF(rF),
	.rG(rG),
	.rH(rH),
	.rI(rI),
	.rJ(rJ),
	.rK(rK),
	.rL(rL),
	.rM(rM));


conc32	b2v_inst1(
	.LOAD(GPRLOAD),
	.data_in(GPR_in),
	.data_out(conc_data));



CPU_regN	b2v_inst11(
	.inc(SYNTHESIZED_WIRE_0),
	.load(rD[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(rD[32:1]),
	.q(regD));
	defparam	b2v_inst11.N = 32;



CPU_regN	b2v_inst13(
	.inc(SYNTHESIZED_WIRE_1),
	.load(rE[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(rE[32:1]),
	.q(regE));
	defparam	b2v_inst13.N = 32;



CPU_regN	b2v_inst15(
	.inc(SYNTHESIZED_WIRE_2),
	.load(rF[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(rF[32:1]),
	.q(regF));
	defparam	b2v_inst15.N = 32;



CPU_regN	b2v_inst17(
	.inc(SYNTHESIZED_WIRE_3),
	.load(rG[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(rG[32:1]),
	.q(regG));
	defparam	b2v_inst17.N = 32;



CPU_regN	b2v_inst19(
	.inc(SYNTHESIZED_WIRE_4),
	.load(rH[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(rH[32:1]),
	.q(regH));
	defparam	b2v_inst19.N = 32;


GPR_MUX	b2v_inst2(
	.rA(regA),
	.rB(regB),
	.rC(regC),
	.rD(regD),
	.rE(regE),
	.rF(regF),
	.rG(regG),
	.rH(regH),
	.rI(regI),
	.rJ(regJ),
	.rK(regK),
	.rL(regL),
	.rM(regM),
	.sel(rop1),
	.data_out(GPR_out1));



CPU_regN	b2v_inst21(
	.inc(SYNTHESIZED_WIRE_5),
	.load(rI[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(rI[32:1]),
	.q(regI));
	defparam	b2v_inst21.N = 32;



CPU_regN	b2v_inst23(
	.inc(SYNTHESIZED_WIRE_6),
	.load(rJ[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(rJ[32:1]),
	.q(regJ));
	defparam	b2v_inst23.N = 32;



CPU_regN	b2v_inst25(
	.inc(SYNTHESIZED_WIRE_7),
	.load(rK[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(rK[32:1]),
	.q(regK));
	defparam	b2v_inst25.N = 32;



CPU_regN	b2v_inst27(
	.inc(SYNTHESIZED_WIRE_8),
	.load(rL[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(rL[32:1]),
	.q(regL));
	defparam	b2v_inst27.N = 32;



CPU_regN	b2v_inst29(
	.inc(SYNTHESIZED_WIRE_9),
	.load(rM[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(rM[32:1]),
	.q(regM));
	defparam	b2v_inst29.N = 32;


GPR_MUX	b2v_inst3(
	.rA(regA),
	.rB(regB),
	.rC(regC),
	.rD(regD),
	.rE(regE),
	.rF(regF),
	.rG(regG),
	.rH(regH),
	.rI(regI),
	.rJ(regJ),
	.rK(regK),
	.rL(regL),
	.rM(regM),
	.sel(rop2),
	.data_out(GPR_out2));



CPU_regN	b2v_inst5(
	.inc(SYNTHESIZED_WIRE_10),
	.load(rA[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(rA[32:1]),
	.q(regA));
	defparam	b2v_inst5.N = 32;


CPU_regN	b2v_inst7(
	.inc(SYNTHESIZED_WIRE_11),
	.load(rB[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(rB[32:1]),
	.q(regB));
	defparam	b2v_inst7.N = 32;



CPU_regN	b2v_inst9(
	.inc(SYNTHESIZED_WIRE_12),
	.load(rC[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(rC[32:1]),
	.q(regC));
	defparam	b2v_inst9.N = 32;


assign	sw_rst = rst;
assign	clk = clk_50;
assign	sel0 = rop1[0];
assign	sel1 = rop1[1];
assign	sel2 = rop1[2];
assign	sel3 = rop1[3];

endmodule
