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
// CREATED		"Fri Mar 29 01:25:17 2024"

module TopLevel(
	SHCP,
	STCP,
	OE,
	rst,
	sw_load,
	rA,
	rB,
	rC,
	rD,
	out_A,
	out_B,
	out_C,
	out_D,
	out_E,
	out_F,
	out_G,
	out_H,
	out_I,
	out_J,
	out_K,
	out_L,
	out_M,
	out_N,
	out_O,
	out_P
);


input wire	SHCP;
input wire	STCP;
input wire	OE;
input wire	rst;
input wire	sw_load;
input wire	[31:0] rA;
input wire	[31:0] rB;
input wire	[31:0] rC;
input wire	[31:0] rD;
output wire	[7:0] out_A;
output wire	[7:0] out_B;
output wire	[7:0] out_C;
output wire	[7:0] out_D;
output wire	[7:0] out_E;
output wire	[7:0] out_F;
output wire	[7:0] out_G;
output wire	[7:0] out_H;
output wire	[7:0] out_I;
output wire	[7:0] out_J;
output wire	[7:0] out_K;
output wire	[7:0] out_L;
output wire	[7:0] out_M;
output wire	[7:0] out_N;
output wire	[7:0] out_O;
output wire	[7:0] out_P;

wire	[7:0] A;
wire	[4:0] addr;
wire	[7:0] B;
wire	[7:0] C;
wire	[7:0] D;
wire	data_A;
wire	data_B;
wire	data_C;
wire	data_D;
wire	data_E;
wire	data_F;
wire	data_G;
wire	data_H;
wire	DS;
wire	LE_A;
wire	LE_B;
wire	LE_C;
wire	LE_D;
wire	[3:0] out;
wire	Y0;
wire	Y1;
wire	Y2;
wire	Y3;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;

assign	SYNTHESIZED_WIRE_27 = 0;
assign	SYNTHESIZED_WIRE_28 = 0;
assign	SYNTHESIZED_WIRE_29 = 0;
assign	SYNTHESIZED_WIRE_30 = 0;
assign	SYNTHESIZED_WIRE_31 = 0;
assign	SYNTHESIZED_WIRE_32 = 1;
assign	SYNTHESIZED_WIRE_33 = 1;
assign	SYNTHESIZED_WIRE_34 = 0;
assign	SYNTHESIZED_WIRE_35 = 0;




led_controller_32	b2v_inst(
	.DS(data_A),
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
	.E1(SYNTHESIZED_WIRE_27),
	.E2(SYNTHESIZED_WIRE_27),
	.E3(Y0),
	.A(addr[2:0]),
	.Y(A));


SN74LS04	b2v_inst11(
	.A1(A[7]),
	.A2(A[6]),
	.A3(A[5]),
	.A4(A[4]),
	.A5(A[3]),
	.A6(A[2]),
	
	
	
	
	.Y5(data_D),
	.Y6(data_C));


SN74LS04	b2v_inst12(
	.A1(A[1]),
	.A2(A[0]),
	.A3(SYNTHESIZED_WIRE_28),
	.A4(SYNTHESIZED_WIRE_28),
	.A5(SYNTHESIZED_WIRE_28),
	.A6(SYNTHESIZED_WIRE_28),
	.Y1(data_B),
	.Y2(data_A)
	
	
	
	);




SN74LS04	b2v_inst15(
	.A1(DS),
	.A2(SYNTHESIZED_WIRE_29),
	.A3(SYNTHESIZED_WIRE_29),
	.A4(SYNTHESIZED_WIRE_29),
	.A5(SYNTHESIZED_WIRE_29),
	.A6(SYNTHESIZED_WIRE_29),
	.Y1(SYNTHESIZED_WIRE_15)
	
	
	
	
	);



SN74LS04	b2v_inst17(
	.A1(out[3]),
	.A2(out[2]),
	.A3(out[1]),
	.A4(out[0]),
	.A5(SYNTHESIZED_WIRE_30),
	.A6(SYNTHESIZED_WIRE_30),
	.Y1(Y3),
	.Y2(Y2),
	.Y3(Y1),
	.Y4(Y0)
	
	);



CN74HC138	b2v_inst19(
	.E1(SYNTHESIZED_WIRE_31),
	.E2(SYNTHESIZED_WIRE_31),
	.E3(Y3),
	.A(addr[2:0])
	);


assign	SYNTHESIZED_WIRE_16 = LE_A | LE_C | LE_D | LE_B;


SN74HC139	b2v_inst28(
	.E(SYNTHESIZED_WIRE_15),
	.A(addr[4:3]),
	.Y(out));


FPGA_counter	b2v_inst29(
	.LE(SYNTHESIZED_WIRE_16),
	.rst(rst),
	.q(addr));
	defparam	b2v_inst29.NUMBER_OF_DEVICES = 4;


led_controller_32	b2v_inst30(
	.DS(data_B),
	.rst(rst),
	.SHCP(SHCP),
	.STCP(STCP),
	.OE(OE),
	.LE(LE_B),
	.out_A(out_E),
	.out_B(out_F),
	.out_C(out_G),
	.out_D(out_H));


SN74LS74	b2v_inst36(
	.d(SYNTHESIZED_WIRE_17),
	.PRE(SYNTHESIZED_WIRE_32),
	.CLR(SYNTHESIZED_WIRE_32),
	.clk(SHCP),
	.q(SYNTHESIZED_WIRE_20)
	);



SN74LS74	b2v_inst38(
	.d(SYNTHESIZED_WIRE_20),
	.PRE(SYNTHESIZED_WIRE_33),
	.CLR(SYNTHESIZED_WIRE_33),
	.clk(SHCP),
	.q(DS)
	);



FPGA_LED_PSSR	b2v_inst4(
	.clk(SHCP),
	.rst(rst),
	.load(sw_load),
	.rA(rA),
	.rB(rB),
	.rC(rC),
	.rD(rD),
	.sel(addr[1:0]),
	.data_out(SYNTHESIZED_WIRE_17));


led_controller_32	b2v_inst40(
	.DS(data_C),
	.rst(rst),
	.SHCP(SHCP),
	.STCP(STCP),
	.OE(OE),
	.LE(LE_C),
	.out_A(out_I),
	.out_B(out_J),
	.out_C(out_K),
	.out_D(out_L));


led_controller_32	b2v_inst41(
	.DS(data_D),
	.rst(rst),
	.SHCP(SHCP),
	.STCP(STCP),
	.OE(OE),
	.LE(LE_D),
	.out_A(out_M),
	.out_B(out_N),
	.out_C(out_O),
	.out_D(out_P));



CN74HC138	b2v_inst6(
	.E1(SYNTHESIZED_WIRE_34),
	.E2(SYNTHESIZED_WIRE_34),
	.E3(Y1),
	.A(addr[2:0])
	);



CN74HC138	b2v_inst8(
	.E1(SYNTHESIZED_WIRE_35),
	.E2(SYNTHESIZED_WIRE_35),
	.E3(Y2),
	.A(addr[2:0])
	);


endmodule
