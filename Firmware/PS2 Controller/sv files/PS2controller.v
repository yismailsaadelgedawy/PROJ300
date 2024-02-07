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
// CREATED		"Wed Feb 07 10:37:49 2024"

module PS2controller(
	rst,
	PS2_DAT,
	PS2_CLK,
	data_out
);


input wire	rst;
input wire	PS2_DAT;
input wire	PS2_CLK;
output wire	[7:0] data_out;

wire	bsy;
wire	clk;
wire	data;
wire	[7:0] data_intermediate;
wire	sw_rst;





ps2_controller	b2v_inst1(
	.data_in(data),
	.clk(clk),
	.rst(sw_rst),
	.bsy(bsy),
	.data_out(data_intermediate));


bsy_reader	b2v_inst2(
	.bsy(bsy),
	.rst(sw_rst),
	.data_in(data_intermediate),
	.data_out(data_out));

assign	clk = PS2_CLK;
assign	data = PS2_DAT;
assign	sw_rst = rst;

endmodule
