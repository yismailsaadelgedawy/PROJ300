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
// CREATED		"Fri Feb 09 00:44:43 2024"

module PS2controller(
	sw0,
	PS2_DAT,
	PS2_CLK,
	clk_50,
	data_out
);


input wire	sw0;
input wire	PS2_DAT;
input wire	PS2_CLK;
input wire	clk_50;
output wire	[7:0] data_out;

wire	bsy;
wire	clk;
wire	data;
wire	[7:0] data_intermediate;
wire	q;
wire	sw_rst;
wire	[7:0] SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;

assign	data_out = SYNTHESIZED_WIRE_0;




break_code_detector	b2v_inst(
	.clk(clk_50),
	.data(SYNTHESIZED_WIRE_0),
	.q(q));


ps2_controller	b2v_inst1(
	.data_in(data),
	.clk(clk),
	.rst(sw_rst),
	.bsy(bsy),
	.data_out(data_intermediate));


bsy_reader	b2v_inst2(
	.bsy(bsy),
	.rst(SYNTHESIZED_WIRE_1),
	.data_in(data_intermediate),
	.data_out(SYNTHESIZED_WIRE_0));

assign	SYNTHESIZED_WIRE_1 = q | sw_rst;

assign	data = PS2_DAT;
assign	clk = PS2_CLK;
assign	sw_rst = sw0;

endmodule
