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
// CREATED		"Thu Mar 28 04:28:38 2024"

module LEDPANEL(
	DS,
	SHCP,
	STCP,
	OE,
	rst,
	out_A,
	out_B,
	out_C,
	out_D
);


input wire	DS;
input wire	SHCP;
input wire	STCP;
input wire	OE;
input wire	rst;
output wire	[7:0] out_A;
output wire	[7:0] out_B;
output wire	[7:0] out_C;
output wire	[7:0] out_D;

wire	[6:0] count;
wire	LE;
wire	MR;
wire	rst_reg;
wire	[7:0] shiftA;
wire	[7:0] shiftB;
wire	[7:0] shiftC;
wire	[7:0] shiftD;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_7;

assign	SYNTHESIZED_WIRE_7 = 1;




SN74HC595	b2v_inst(
	.DS(DS),
	.MR(MR),
	.SHCP(SHCP),
	.STCP(STCP),
	.OE(OE),
	.data_out(shiftA));


andsix	b2v_inst1(
	.a(SYNTHESIZED_WIRE_0),
	.b(SYNTHESIZED_WIRE_1),
	.c(count[2]),
	.d(SYNTHESIZED_WIRE_2),
	.e(SYNTHESIZED_WIRE_3),
	.f(count[5]),
	.q(LE));

assign	MR = ~(rst_reg | rst);


CD4024	b2v_inst15(
	.clk(SHCP),
	.rst(SYNTHESIZED_WIRE_4),
	.q(count));


SN74HC595	b2v_inst2(
	.DS(shiftA[7]),
	.MR(MR),
	.SHCP(SHCP),
	.STCP(STCP),
	.OE(OE),
	.data_out(shiftB));


SN74HC573	b2v_inst21(
	.OE(OE),
	.LE(LE),
	.d(shiftA),
	.q(out_A));


SN74HC573	b2v_inst22(
	.OE(OE),
	.LE(LE),
	.d(shiftB),
	.q(out_B));


SN74HC573	b2v_inst23(
	.OE(OE),
	.LE(LE),
	.d(shiftC),
	.q(out_C));


SN74HC573	b2v_inst24(
	.OE(OE),
	.LE(LE),
	.d(shiftD),
	.q(out_D));


SN74LS74	b2v_inst29(
	.d(LE),
	.PRE(SYNTHESIZED_WIRE_7),
	.CLR(SYNTHESIZED_WIRE_7),
	.clk(SHCP),
	.q(rst_reg)
	);


SN74HC595	b2v_inst3(
	.DS(shiftB[7]),
	.MR(MR),
	.SHCP(SHCP),
	.STCP(STCP),
	.OE(OE),
	.data_out(shiftC));



SN74HC595	b2v_inst4(
	.DS(shiftC[7]),
	.MR(MR),
	.SHCP(SHCP),
	.STCP(STCP),
	.OE(OE),
	.data_out(shiftD));

assign	SYNTHESIZED_WIRE_4 = rst_reg | rst;

assign	SYNTHESIZED_WIRE_3 =  ~count[4];

assign	SYNTHESIZED_WIRE_2 =  ~count[3];

assign	SYNTHESIZED_WIRE_1 =  ~count[1];

assign	SYNTHESIZED_WIRE_0 =  ~count[0];


endmodule
