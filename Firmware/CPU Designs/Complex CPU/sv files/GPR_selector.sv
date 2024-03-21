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
// CREATED		"Thu Mar 21 08:23:03 2024"

module GPR_selector(
	rst,
	clk_50,
	GPR_in,
	rop1,
	rop2,
	GPR_out1,
	GPR_out2
);


input wire	rst;
input wire	clk_50;
input wire	[32:0] GPR_in;
input wire	[3:0] rop1;
input wire	[3:0] rop2;
output wire	[31:0] GPR_out1;
output wire	[31:0] GPR_out2;

wire	clk;
wire	data;
wire	r;
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
wire	[3:0] GDFX_TEMP_SIGNAL_1;
wire	[3:0] GDFX_TEMP_SIGNAL_2;


assign	GDFX_TEMP_SIGNAL_0 = {sel23,sel22,sel21,sel20};
assign	GDFX_TEMP_SIGNAL_1 = {sel3,sel2,sel1,sel0};
assign	GDFX_TEMP_SIGNAL_2 = {sel3,sel2,sel1,sel0};


GPR_MUX	b2v_inst(
	.r(r),
	.sel(GDFX_TEMP_SIGNAL_0),
	.data_out(GPR_out2));



CPU_regN	b2v_inst11(
	.inc(SYNTHESIZED_WIRE_0),
	.load(data[3][0]),
	.rst(sw_rst),
	.clk(clk),
	.d(data[3][32:1]),
	.q(r[3][31:0]));
	defparam	b2v_inst11.N = 32;



CPU_regN	b2v_inst13(
	.inc(SYNTHESIZED_WIRE_1),
	.load(data[4][0:0]),
	.rst(sw_rst),
	.clk(clk),
	.d(data[4][32:1]),
	.q(r[4][31:0]));
	defparam	b2v_inst13.N = 32;



CPU_regN	b2v_inst15(
	.inc(SYNTHESIZED_WIRE_2),
	.load(data[5][0:0]),
	.rst(sw_rst),
	.clk(clk),
	.d(data[5][32:1]),
	.q(r[5][31:0]));
	defparam	b2v_inst15.N = 32;



CPU_regN	b2v_inst17(
	.inc(SYNTHESIZED_WIRE_3),
	.load(data[6][0:0]),
	.rst(sw_rst),
	.clk(clk),
	.d(data[6][32:1]),
	.q(r[6][31:0]));
	defparam	b2v_inst17.N = 32;



CPU_regN	b2v_inst19(
	.inc(SYNTHESIZED_WIRE_4),
	.load(data[7][0:0]),
	.rst(sw_rst),
	.clk(clk),
	.d(data[7][32:1]),
	.q(r[7][31:0]));
	defparam	b2v_inst19.N = 32;



CPU_regN	b2v_inst21(
	.inc(SYNTHESIZED_WIRE_5),
	.load(data[8][0:0]),
	.rst(sw_rst),
	.clk(clk),
	.d(data[8][32:1]),
	.q(r[8][31:0]));
	defparam	b2v_inst21.N = 32;



CPU_regN	b2v_inst23(
	.inc(SYNTHESIZED_WIRE_6),
	.load(data[9][0:0]),
	.rst(sw_rst),
	.clk(clk),
	.d(data[9][32:1]),
	.q(r[9][31:0]));
	defparam	b2v_inst23.N = 32;



CPU_regN	b2v_inst25(
	.inc(SYNTHESIZED_WIRE_7),
	.load(data[10][0:0]),
	.rst(sw_rst),
	.clk(clk),
	.d(data[10][32:1]),
	.q(r[10][31:0]));
	defparam	b2v_inst25.N = 32;



CPU_regN	b2v_inst27(
	.inc(SYNTHESIZED_WIRE_8),
	.load(data[11][0:0]),
	.rst(sw_rst),
	.clk(clk),
	.d(data[11][32:1]),
	.q(r[11][31:0]));
	defparam	b2v_inst27.N = 32;



CPU_regN	b2v_inst29(
	.inc(SYNTHESIZED_WIRE_9),
	.load(data[12][0:0]),
	.rst(sw_rst),
	.clk(clk),
	.d(data[12][32:1]),
	.q(r[12][31:0]));
	defparam	b2v_inst29.N = 32;



GPR_DEMUX	b2v_inst4(
	.data_in(GPR_in),
	.sel(GDFX_TEMP_SIGNAL_1),
	.r(data));


CPU_regN	b2v_inst5(
	.inc(SYNTHESIZED_WIRE_10),
	.load(data[0][0:0]),
	.rst(sw_rst),
	.clk(clk),
	.d(data[0][32:1]),
	.q(r[0][31:0]));
	defparam	b2v_inst5.N = 32;


GPR_MUX	b2v_inst6(
	.r(r),
	.sel(GDFX_TEMP_SIGNAL_2),
	.data_out(GPR_out1));


CPU_regN	b2v_inst7(
	.inc(SYNTHESIZED_WIRE_11),
	.load(data[1][0:0]),
	.rst(sw_rst),
	.clk(clk),
	.d(data[1][32:1]),
	.q(r[1][31:0]));
	defparam	b2v_inst7.N = 32;



CPU_regN	b2v_inst9(
	.inc(SYNTHESIZED_WIRE_12),
	.load(data[2][0:0]),
	.rst(sw_rst),
	.clk(clk),
	.d(data[2][32:1]),
	.q(r[2][31:0]));
	defparam	b2v_inst9.N = 32;


assign	sw_rst = rst;
assign	clk = clk_50;
assign	sel0 = rop1[0];
assign	sel1 = rop1[1];
assign	sel2 = rop1[2];
assign	sel20 = rop2[0];
assign	sel21 = rop2[1];
assign	sel22 = rop2[2];
assign	sel23 = rop2[3];
assign	sel3 = rop1[3];

endmodule
