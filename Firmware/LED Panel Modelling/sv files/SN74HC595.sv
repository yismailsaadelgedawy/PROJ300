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
// CREATED		"Wed Mar 27 13:34:37 2024"

module SN74HC595(
	DS,
	MR,
	SHCP,
	STCP,
	OE,
	data_out
);


input wire	DS;
input wire	MR;
input wire	SHCP;
input wire	STCP;
input wire	OE;
output wire	[7:0] data_out;

wire	[7:0] reg_out;
wire	[7:0] shift_out;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_1;

assign	SYNTHESIZED_WIRE_3 = 0;
assign	SYNTHESIZED_WIRE_1 = 1;




SPSR	b2v_inst(
	.DS(DS),
	.nrst(MR),
	.SHCP(SHCP),
	.q(shift_out));
	defparam	b2v_inst.N = 8;


regN	b2v_inst1(
	.inc(SYNTHESIZED_WIRE_3),
	.load(SYNTHESIZED_WIRE_1),
	.rst(SYNTHESIZED_WIRE_3),
	.STCP(STCP),
	.d(shift_out),
	.q(reg_out));
	defparam	b2v_inst1.N = 8;


trisateN	b2v_inst2(
	.OE(OE),
	.d(reg_out),
	.q(data_out));
	defparam	b2v_inst2.N = 8;




endmodule
