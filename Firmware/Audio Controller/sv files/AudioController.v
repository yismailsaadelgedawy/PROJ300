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
// CREATED		"Fri Feb 09 00:37:39 2024"

module AudioController(
	rst,
	clk,
	ps2_data,
	ps2_clk,
	buzzer_out
);


input wire	rst;
input wire	clk;
input wire	ps2_data;
input wire	ps2_clk;
output wire	buzzer_out;

wire	clk_50;
wire	[12:0] data_to_mux;
wire	[7:0] keyboard_data;
wire	[3:0] sel;
wire	sw_rst;





music_frequencies	b2v_inst(
	.clk(clk_50),
	.rst(sw_rst),
	.data(data_to_mux));


key_detector	b2v_inst1(
	.keyboard_data(keyboard_data),
	.q(sel));


PS2controller	b2v_inst2(
	.clk_50(clk_50),
	.PS2_DAT(ps2_data),
	.PS2_CLK(ps2_clk),
	.sw0(sw_rst),
	.data_out(keyboard_data));


muxN	b2v_inst4(
	.data(data_to_mux),
	.sel(sel),
	.q(buzzer_out));
	defparam	b2v_inst4.M = 4;
	defparam	b2v_inst4.N = 13;

assign	clk_50 = clk;
assign	sw_rst = rst;

endmodule
