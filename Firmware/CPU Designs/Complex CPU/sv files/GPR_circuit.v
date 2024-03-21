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
// CREATED		"Thu Mar 21 09:59:28 2024"

module GPR_circuit(
	rst,
	clk_50,
	GPRLOAD,
	GPR_data,
	rop1,
	rop2,
	GPR_out1,
	GPR_out2
);


input wire	rst;
input wire	clk_50;
input wire	GPRLOAD;
input wire	[31:0] GPR_data;
input wire	[3:0] rop1;
input wire	[3:0] rop2;
output wire	[31:0] GPR_out1;
output wire	[31:0] GPR_out2;

wire	[32:0] GPR_in;





GPR_selector	b2v_inst(
	.rst(rst),
	.clk_50(clk_50),
	.GPR_in(GPR_in),
	.rop1(rop1),
	.rop2(rop2),
	.GPR_out1(GPR_out1),
	.GPR_out2(GPR_out2));


GPR_conc	b2v_inst1(
	.GPRLOAD(GPRLOAD),
	.data_in(GPR_data),
	.data_out(GPR_in));


endmodule
