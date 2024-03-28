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
// CREATED		"Thu Mar 28 17:37:10 2024"

module TopLevel(
	SHCP,
	STCP,
	OE,
	rst,
	sw_load,
	rA,
	rB,
	out_A,
	out_A31,
	out_B,
	out_B32,
	out_C,
	out_C33,
	out_D,
	out_D34
);


input wire	SHCP;
input wire	STCP;
input wire	OE;
input wire	rst;
input wire	sw_load;
input wire	[31:0] rA;
input wire	[31:0] rB;
output wire	[7:0] out_A;
output wire	[7:0] out_A31;
output wire	[7:0] out_B;
output wire	[7:0] out_B32;
output wire	[7:0] out_C;
output wire	[7:0] out_C33;
output wire	[7:0] out_D;
output wire	[7:0] out_D34;

wire	[4:0] A;
wire	[7:0] bankA;
wire	[7:0] bankB;
wire	[7:0] bankC;
wire	[7:0] bankD;
wire	clk;
wire	DS;
wire	LE_2;
wire	LE_A;
wire	LE_B;
wire	[3:0] Y;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	[3:0] SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	[7:0] SYNTHESIZED_WIRE_7;
wire	[7:0] SYNTHESIZED_WIRE_8;
wire	[7:0] SYNTHESIZED_WIRE_9;
wire	[7:0] SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;

assign	SYNTHESIZED_WIRE_15 = 0;
assign	SYNTHESIZED_WIRE_16 = 0;
assign	SYNTHESIZED_WIRE_17 = 0;
assign	SYNTHESIZED_WIRE_18 = 0;




led_controller_32	b2v_inst(
	.DS(bankA[0]),
	.rst(rst),
	.SHCP(SHCP),
	.STCP(STCP),
	.OE(OE),
	.LE(LE_A),
	.out_A(out_A),
	.out_B(out_B),
	.out_C(out_C),
	.out_D(out_D));


CN74HC138	b2v_inst1(
	.E1(SYNTHESIZED_WIRE_15),
	.E2(SYNTHESIZED_WIRE_15),
	.E3(Y[0]),
	.A(A[2:0]),
	.Y(SYNTHESIZED_WIRE_7));



CN74HC138	b2v_inst19(
	.E1(SYNTHESIZED_WIRE_16),
	.E2(SYNTHESIZED_WIRE_16),
	.E3(Y[3]),
	.A(A[2:0]),
	.Y(SYNTHESIZED_WIRE_10));


assign	SYNTHESIZED_WIRE_5 =  ~DS;

assign	Y =  ~SYNTHESIZED_WIRE_4;


SN74HC139	b2v_inst28(
	.E(SYNTHESIZED_WIRE_5),
	.A(A[4:3]),
	.Y(SYNTHESIZED_WIRE_4));


FPGA_counter	b2v_inst29(
	.LE(SYNTHESIZED_WIRE_6),
	.rst(rst),
	.q(A));


led_controller_32	b2v_inst30(
	.DS(bankA[1]),
	.rst(rst),
	.SHCP(SHCP),
	.STCP(STCP),
	.OE(OE),
	
	.out_A(out_A31),
	.out_B(out_B32),
	.out_C(out_C33),
	.out_D(out_D34));

assign	bankA =  ~SYNTHESIZED_WIRE_7;




assign	SYNTHESIZED_WIRE_6 = LE_2 | LE_A;


FPGA_LED_PSSR	b2v_inst4(
	.sel(A[0]),
	.clk(SHCP),
	.rst(rst),
	.load(sw_load),
	.rA(rA),
	.rB(rB),
	.data_out(DS));



CN74HC138	b2v_inst6(
	.E1(SYNTHESIZED_WIRE_17),
	.E2(SYNTHESIZED_WIRE_17),
	.E3(Y[1]),
	.A(A[2:0]),
	.Y(SYNTHESIZED_WIRE_8));



CN74HC138	b2v_inst8(
	.E1(SYNTHESIZED_WIRE_18),
	.E2(SYNTHESIZED_WIRE_18),
	.E3(Y[2]),
	.A(A[2:0]),
	.Y(SYNTHESIZED_WIRE_9));


endmodule
