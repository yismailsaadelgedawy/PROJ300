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
// CREATED		"Thu Mar 28 17:35:31 2024"

module led_controller_32(
	DS,
	SHCP,
	STCP,
	OE,
	rst,
	LE,
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
output wire	LE;
output wire	[7:0] out_A;
output wire	[7:0] out_B;
output wire	[7:0] out_C;
output wire	[7:0] out_D;

wire	[6:0] count;
wire	LE_ALTERA_SYNTHESIZED;
wire	MR;
wire	rst_reg;
wire	[7:0] shiftA;
wire	[7:0] shiftB;
wire	[7:0] shiftC;
wire	[7:0] shiftD;
wire	Y1;
wire	Y2;
wire	Y3;
wire	Y4;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;

assign	SYNTHESIZED_WIRE_22 = 0;
assign	SYNTHESIZED_WIRE_23 = 0;
assign	SYNTHESIZED_WIRE_24 = 1;
assign	SYNTHESIZED_WIRE_25 = 0;




SN74HC595	b2v_inst(
	.DS(DS),
	.MR(MR),
	.SHCP(SHCP),
	.STCP(STCP),
	.OE(OE),
	.data_out(shiftA));



SN74HC08	b2v_inst11(
	.A1(SYNTHESIZED_WIRE_0),
	.B1(SYNTHESIZED_WIRE_1),
	.A2(Y1),
	.B2(count[2]),
	.A3(Y2),
	.B3(SYNTHESIZED_WIRE_2),
	.A4(Y3),
	.B4(SYNTHESIZED_WIRE_3),
	.Y1(Y1),
	.Y2(Y2),
	.Y3(Y3),
	.Y4(Y4));


SN74HC08	b2v_inst12(
	.A1(Y4),
	.B1(count[5]),
	
	
	
	
	
	
	.Y1(LE_ALTERA_SYNTHESIZED)
	
	
	);


CD4075	b2v_inst13(
	.C(rst),
	.B(rst_reg),
	.A(SYNTHESIZED_WIRE_22),
	.F(SYNTHESIZED_WIRE_22),
	.E(SYNTHESIZED_WIRE_22),
	.D(SYNTHESIZED_WIRE_22),
	.I(SYNTHESIZED_WIRE_22),
	.H(SYNTHESIZED_WIRE_22),
	.G(SYNTHESIZED_WIRE_22),
	.J(SYNTHESIZED_WIRE_11)
	
	);


CD4024	b2v_inst15(
	.clk(SHCP),
	.rst(SYNTHESIZED_WIRE_11),
	.q(count));



CD4001	b2v_inst17(
	.A(rst),
	.B(rst_reg),
	.C(SYNTHESIZED_WIRE_23),
	.D(SYNTHESIZED_WIRE_23),
	.E(SYNTHESIZED_WIRE_23),
	.F(SYNTHESIZED_WIRE_23),
	.G(SYNTHESIZED_WIRE_23),
	.H(SYNTHESIZED_WIRE_23),
	.J(MR)
	
	
	);



SN74HC595	b2v_inst2(
	.DS(shiftA[7]),
	.MR(MR),
	.SHCP(SHCP),
	.STCP(STCP),
	.OE(OE),
	.data_out(shiftB));


SN74HC573	b2v_inst21(
	.OE(OE),
	.LE(LE_ALTERA_SYNTHESIZED),
	.d(shiftA),
	.q(out_A));


SN74HC573	b2v_inst22(
	.OE(OE),
	.LE(LE_ALTERA_SYNTHESIZED),
	.d(shiftB),
	.q(out_B));


SN74HC573	b2v_inst23(
	.OE(OE),
	.LE(LE_ALTERA_SYNTHESIZED),
	.d(shiftC),
	.q(out_C));


SN74HC573	b2v_inst24(
	.OE(OE),
	.LE(LE_ALTERA_SYNTHESIZED),
	.d(shiftD),
	.q(out_D));


SN74LS74	b2v_inst29(
	.d(LE_ALTERA_SYNTHESIZED),
	.PRE(SYNTHESIZED_WIRE_24),
	.CLR(SYNTHESIZED_WIRE_24),
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


SN74LS04	b2v_inst9(
	.A1(count[0]),
	.A2(count[1]),
	.A3(count[3]),
	.A4(count[4]),
	.A5(SYNTHESIZED_WIRE_25),
	.A6(SYNTHESIZED_WIRE_25),
	.Y1(SYNTHESIZED_WIRE_0),
	.Y2(SYNTHESIZED_WIRE_1),
	.Y3(SYNTHESIZED_WIRE_2),
	.Y4(SYNTHESIZED_WIRE_3)
	
	);

assign	LE = LE_ALTERA_SYNTHESIZED;

endmodule
