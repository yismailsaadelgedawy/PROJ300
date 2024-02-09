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
// CREATED		"Fri Feb 09 00:44:02 2024"

module music_frequencies(
	rst,
	clk,
	data
);


input wire	rst;
input wire	clk;
output wire	[12:0] data;

wire	clk_50;
wire	[12:0] data_ALTERA_SYNTHESIZED;
wire	sw_rst;





fine_clk_divN	b2v_inst(
	.clk_in(clk_50),
	.rst(sw_rst),
	.clk_out(data_ALTERA_SYNTHESIZED[1]));
	defparam	b2v_inst.f = 493.88;


fine_clk_divN	b2v_inst1(
	.clk_in(clk_50),
	.rst(sw_rst),
	.clk_out(data_ALTERA_SYNTHESIZED[2]));
	defparam	b2v_inst1.f = 466.16;


fine_clk_divN	b2v_inst10(
	.clk_in(clk_50),
	.rst(sw_rst),
	.clk_out(data_ALTERA_SYNTHESIZED[12]));
	defparam	b2v_inst10.f = 261.63;


fine_clk_divN	b2v_inst15(
	.clk_in(clk_50),
	.rst(sw_rst),
	.clk_out(data_ALTERA_SYNTHESIZED[5]));
	defparam	b2v_inst15.f = 392.0;


fine_clk_divN	b2v_inst16(
	.clk_in(clk_50),
	.rst(sw_rst),
	.clk_out(data_ALTERA_SYNTHESIZED[9]));
	defparam	b2v_inst16.f = 311.13;


fine_clk_divN	b2v_inst2(
	.clk_in(clk_50),
	.rst(sw_rst),
	.clk_out(data_ALTERA_SYNTHESIZED[3]));
	defparam	b2v_inst2.f = 440.0;


fine_clk_divN	b2v_inst3(
	.clk_in(clk_50),
	.rst(sw_rst),
	.clk_out(data_ALTERA_SYNTHESIZED[4]));
	defparam	b2v_inst3.f = 415.3;


fine_clk_divN	b2v_inst4(
	.clk_in(clk_50),
	.rst(sw_rst),
	.clk_out(data_ALTERA_SYNTHESIZED[6]));
	defparam	b2v_inst4.f = 369.99;


fine_clk_divN	b2v_inst5(
	.clk_in(clk_50),
	.rst(sw_rst),
	.clk_out(data_ALTERA_SYNTHESIZED[7]));
	defparam	b2v_inst5.f = 349.23;



fine_clk_divN	b2v_inst7(
	.clk_in(clk_50),
	.rst(sw_rst),
	.clk_out(data_ALTERA_SYNTHESIZED[8]));
	defparam	b2v_inst7.f = 329.63;


fine_clk_divN	b2v_inst8(
	.clk_in(clk_50),
	.rst(sw_rst),
	.clk_out(data_ALTERA_SYNTHESIZED[10]));
	defparam	b2v_inst8.f = 293.66;


fine_clk_divN	b2v_inst9(
	.clk_in(clk_50),
	.rst(sw_rst),
	.clk_out(data_ALTERA_SYNTHESIZED[11]));
	defparam	b2v_inst9.f = 277.18;

assign	data = data_ALTERA_SYNTHESIZED;
assign	clk_50 = clk;
assign	sw_rst = rst;
assign	data_ALTERA_SYNTHESIZED[0] = 0;

endmodule
