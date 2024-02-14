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
// CREATED		"Wed Feb 14 02:44:59 2024"

module UART(
	clk_50MHz,
	SW0,
	UART2_RX,
	data_out
);


input wire	clk_50MHz;
input wire	SW0;
input wire	UART2_RX;
output wire	[7:0] data_out;

wire	bsy;
wire	clk_50;
wire	clk_uart;
wire	data;
wire	sw_rst;





uart_clk_divN	b2v_inst(
	.clk_in(clk_50),
	.rst(sw_rst),
	.sense(data),
	.bsy(bsy),
	.clk_out(clk_uart));
	defparam	b2v_inst.baud = 9600;


uart_controller	b2v_inst1(
	.clk(clk_uart),
	.rst(sw_rst),
	.data_in(data),
	.bsy(bsy),
	.data_out(data_out));

assign	clk_50 = clk_50MHz;
assign	sw_rst = SW0;
assign	data = UART2_RX;

endmodule
