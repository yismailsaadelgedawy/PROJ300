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
// CREATED		"Thu Feb 08 13:15:20 2024"

module AudioController(
	rst,
	clk,
	key,
	buzzer_out
);


input wire	rst;
input wire	clk;
input wire	[2:0] key;
output wire	buzzer_out;

wire	clk_50;
wire	[3:0] data;
wire	[1:0] sel;
wire	sw_rst;





fine_clk_divN	b2v_inst(
	.clk_in(clk_50),
	.rst(sw_rst),
	.clk_out(data[1]));
	defparam	b2v_inst.f = 493.88;


fine_clk_divN	b2v_inst1(
	.clk_in(clk_50),
	.rst(sw_rst),
	.clk_out(data[2]));
	defparam	b2v_inst1.f = 440.0;


fine_clk_divN	b2v_inst2(
	.clk_in(clk_50),
	.rst(sw_rst),
	.clk_out(data[3]));
	defparam	b2v_inst2.f = 392.0;


muxN	b2v_inst4(
	.data(data),
	.sel(sel),
	.q(buzzer_out));
	defparam	b2v_inst4.M = 2;
	defparam	b2v_inst4.N = 4;



encoder	b2v_inst8(
	.data(key),
	.q(sel));

assign	clk_50 = clk;
assign	sw_rst = rst;
assign	data[0] = 0;

endmodule
