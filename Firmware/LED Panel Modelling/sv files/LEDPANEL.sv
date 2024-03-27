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
// CREATED		"Thu Mar 28 01:39:16 2024"

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
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;

assign	SYNTHESIZED_WIRE_18 = 1;
assign	SYNTHESIZED_WIRE_19 = 1;
assign	SYNTHESIZED_WIRE_20 = 1;
assign	SYNTHESIZED_WIRE_21 = 1;
assign	SYNTHESIZED_WIRE_22 = 1;
assign	SYNTHESIZED_WIRE_23 = 1;




SN74HC595	b2v_inst(
	.DS(DS),
	.MR(MR),
	.SHCP(SHCP),
	.STCP(STCP),
	.OE(OE),
	.data_out(shiftA));

assign	MR = ~(rst_reg | rst);


CD4024	b2v_inst15(
	.clk(SHCP),
	.rst(SYNTHESIZED_WIRE_0),
	.q(count));


SN74HC595	b2v_inst2(
	.DS(shiftA[7]),
	.MR(MR),
	.SHCP(SHCP),
	.STCP(STCP),
	.OE(OE),
	.data_out(shiftB));


andfive	b2v_inst20(
	.a(count[0]),
	.b(count[1]),
	.c(count[2]),
	.d(count[3]),
	.e(count[4]),
	.q(SYNTHESIZED_WIRE_1));


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
	.d(SYNTHESIZED_WIRE_1),
	.PRE(SYNTHESIZED_WIRE_18),
	.CLR(SYNTHESIZED_WIRE_18),
	.clk(SHCP),
	.q(SYNTHESIZED_WIRE_4)
	);


SN74HC595	b2v_inst3(
	.DS(shiftB[7]),
	.MR(MR),
	.SHCP(SHCP),
	.STCP(STCP),
	.OE(OE),
	.data_out(shiftC));



SN74LS74	b2v_inst31(
	.d(SYNTHESIZED_WIRE_4),
	.PRE(SYNTHESIZED_WIRE_19),
	.CLR(SYNTHESIZED_WIRE_19),
	.clk(SHCP),
	.q(SYNTHESIZED_WIRE_7)
	);



SN74LS74	b2v_inst33(
	.d(SYNTHESIZED_WIRE_7),
	.PRE(SYNTHESIZED_WIRE_20),
	.CLR(SYNTHESIZED_WIRE_20),
	.clk(SHCP),
	.q(SYNTHESIZED_WIRE_10)
	);



SN74LS74	b2v_inst35(
	.d(SYNTHESIZED_WIRE_10),
	.PRE(SYNTHESIZED_WIRE_21),
	.CLR(SYNTHESIZED_WIRE_21),
	.clk(SHCP),
	.q(SYNTHESIZED_WIRE_13)
	);



SN74LS74	b2v_inst37(
	.d(SYNTHESIZED_WIRE_13),
	.PRE(SYNTHESIZED_WIRE_22),
	.CLR(SYNTHESIZED_WIRE_22),
	.clk(SHCP),
	.q(LE)
	);



SN74LS74	b2v_inst39(
	.d(LE),
	.PRE(SYNTHESIZED_WIRE_23),
	.CLR(SYNTHESIZED_WIRE_23),
	.clk(SHCP),
	.q(rst_reg)
	);


SN74HC595	b2v_inst4(
	.DS(shiftC[7]),
	.MR(MR),
	.SHCP(SHCP),
	.STCP(STCP),
	.OE(OE),
	.data_out(shiftD));


assign	SYNTHESIZED_WIRE_0 = rst_reg | rst;


endmodule
