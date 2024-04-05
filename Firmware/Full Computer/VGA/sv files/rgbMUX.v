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
// CREATED		"Wed Jan 31 12:31:32 2024"

module rgbMUX(
	A,
	B,
	colour_data
);


input wire	[11:0] A;
input wire	[11:0] B;
output wire	[11:0] colour_data;

wire	select_line;





selector	b2v_inst(
	.a(A),
	.b(B),
	.s(select_line));


sprite_MUX	b2v_inst1(
	.s(select_line),
	.a(A),
	.b(B),
	.colour_data(colour_data));


endmodule
