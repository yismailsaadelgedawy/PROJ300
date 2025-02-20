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
// CREATED		"Thu Mar 28 11:43:40 2024"

module CD4001(
	A,
	B,
	C,
	D,
	E,
	F,
	G,
	H,
	J,
	K,
	L,
	M
);


input wire	A;
input wire	B;
input wire	C;
input wire	D;
input wire	E;
input wire	F;
input wire	G;
input wire	H;
output wire	J;
output wire	K;
output wire	L;
output wire	M;





assign	J = ~(B | A);

assign	K = ~(D | C);

assign	L = ~(F | E);

assign	M = ~(H | G);


endmodule
