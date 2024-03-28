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
// CREATED		"Thu Mar 28 14:55:43 2024"

module demux1x32(
	in,
	A,
	bankA,
	bankB,
	bankC,
	bankD
);


input wire	in;
input wire	[4:0] A;
output wire	[7:0] bankA;
output wire	[7:0] bankB;
output wire	[7:0] bankC;
output wire	[7:0] bankD;

wire	[3:0] Y;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_14;
wire	[3:0] SYNTHESIZED_WIRE_3;
wire	[7:0] SYNTHESIZED_WIRE_4;
wire	[7:0] SYNTHESIZED_WIRE_5;
wire	[7:0] SYNTHESIZED_WIRE_6;
wire	[7:0] SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;

assign	SYNTHESIZED_WIRE_14 = 0;
assign	SYNTHESIZED_WIRE_15 = 0;
assign	SYNTHESIZED_WIRE_16 = 0;
assign	SYNTHESIZED_WIRE_17 = 0;




SN74HC139	b2v_inst(
	.E(SYNTHESIZED_WIRE_0),
	.A(A[4:3]),
	.Y(SYNTHESIZED_WIRE_3));


CN74HC138	b2v_inst1(
	.E1(SYNTHESIZED_WIRE_14),
	.E2(SYNTHESIZED_WIRE_14),
	.E3(Y[0]),
	.A(A[2:0]),
	.Y(SYNTHESIZED_WIRE_4));

assign	Y =  ~SYNTHESIZED_WIRE_3;

assign	bankA =  ~SYNTHESIZED_WIRE_4;

assign	bankB =  ~SYNTHESIZED_WIRE_5;

assign	bankC =  ~SYNTHESIZED_WIRE_6;

assign	bankD =  ~SYNTHESIZED_WIRE_7;


CN74HC138	b2v_inst2(
	.E1(SYNTHESIZED_WIRE_15),
	.E2(SYNTHESIZED_WIRE_15),
	.E3(Y[1]),
	.A(A[2:0]),
	.Y(SYNTHESIZED_WIRE_5));


CN74HC138	b2v_inst3(
	.E1(SYNTHESIZED_WIRE_16),
	.E2(SYNTHESIZED_WIRE_16),
	.E3(Y[2]),
	.A(A[2:0]),
	.Y(SYNTHESIZED_WIRE_6));


CN74HC138	b2v_inst4(
	.E1(SYNTHESIZED_WIRE_17),
	.E2(SYNTHESIZED_WIRE_17),
	.E3(Y[3]),
	.A(A[2:0]),
	.Y(SYNTHESIZED_WIRE_7));





assign	SYNTHESIZED_WIRE_0 =  ~in;


endmodule
