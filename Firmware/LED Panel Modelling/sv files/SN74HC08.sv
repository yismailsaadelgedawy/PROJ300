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
// CREATED		"Thu Mar 28 11:43:30 2024"

module SN74HC08(
	A1,
	B1,
	A2,
	B2,
	A3,
	B3,
	A4,
	B4,
	Y1,
	Y2,
	Y3,
	Y4
);


input wire	A1;
input wire	B1;
input wire	A2;
input wire	B2;
input wire	A3;
input wire	B3;
input wire	A4;
input wire	B4;
output wire	Y1;
output wire	Y2;
output wire	Y3;
output wire	Y4;





assign	Y1 = A1 & B1;

assign	Y2 = A2 & B2;

assign	Y3 = A3 & B3;

assign	Y4 = A4 & B4;


endmodule
