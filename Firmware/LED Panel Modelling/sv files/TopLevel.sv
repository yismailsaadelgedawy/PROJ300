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
// CREATED		"Fri Mar 29 01:56:54 2024"

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
wire	data_AA;
wire	data_AB;
wire	data_AC;
wire	data_AD;
wire	data_AE;
wire	data_AF;
wire	data_B;
wire	data_C;
wire	data_D;
wire	data_E;
wire	data_F;
wire	data_G;
wire	data_H;
wire	data_I;
wire	data_J;
wire	data_K;
wire	data_L;
wire	data_M;
wire	data_N;
wire	data_O;
wire	data_P;
wire	data_Q;
wire	data_R;
wire	data_S;
wire	data_T;
wire	data_U;
wire	data_V;
wire	data_W;
wire	data_X;
wire	data_Y;
wire	data_Z;
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
wire	SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_41;
wire	SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_46;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_47;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_48;
wire	SYNTHESIZED_WIRE_49;
wire	SYNTHESIZED_WIRE_50;

assign	SYNTHESIZED_WIRE_39 = 0;
assign	SYNTHESIZED_WIRE_40 = 0;
assign	SYNTHESIZED_WIRE_41 = 0;
assign	SYNTHESIZED_WIRE_42 = 0;
assign	SYNTHESIZED_WIRE_43 = 0;
assign	SYNTHESIZED_WIRE_44 = 0;
assign	SYNTHESIZED_WIRE_45 = 0;
assign	SYNTHESIZED_WIRE_46 = 0;
assign	SYNTHESIZED_WIRE_47 = 1;
assign	SYNTHESIZED_WIRE_48 = 1;
assign	SYNTHESIZED_WIRE_49 = 0;
assign	SYNTHESIZED_WIRE_50 = 0;




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
	.E1(SYNTHESIZED_WIRE_39),
	.E2(SYNTHESIZED_WIRE_39),
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
	.A3(SYNTHESIZED_WIRE_40),
	.A4(SYNTHESIZED_WIRE_40),
	.A5(SYNTHESIZED_WIRE_40),
	.A6(SYNTHESIZED_WIRE_40),
	.Y1(data_B),
	.Y2(data_A)
	
	
	
	);




SN74LS04	b2v_inst15(
	.A1(DS),
	.A2(SYNTHESIZED_WIRE_41),
	.A3(SYNTHESIZED_WIRE_41),
	.A4(SYNTHESIZED_WIRE_41),
	.A5(SYNTHESIZED_WIRE_41),
	.A6(SYNTHESIZED_WIRE_41),
	.Y1(SYNTHESIZED_WIRE_23)
	
	
	
	
	);



SN74LS04	b2v_inst17(
	.A1(out[3]),
	.A2(out[2]),
	.A3(out[1]),
	.A4(out[0]),
	.A5(SYNTHESIZED_WIRE_42),
	.A6(SYNTHESIZED_WIRE_42),
	.Y1(Y3),
	.Y2(Y2),
	.Y3(Y1),
	.Y4(Y0)
	
	);



CN74HC138	b2v_inst19(
	.E1(SYNTHESIZED_WIRE_43),
	.E2(SYNTHESIZED_WIRE_43),
	.E3(Y3),
	.A(addr[2:0]),
	.Y(D));



SN74LS04	b2v_inst21(
	.A1(B[7]),
	.A2(B[6]),
	.A3(B[5]),
	.A4(B[4]),
	.A5(B[3]),
	.A6(B[2])
	
	
	
	
	
	);

assign	SYNTHESIZED_WIRE_24 = LE_A | LE_C | LE_D | LE_B;


SN74LS04	b2v_inst23(
	.A1(B[1]),
	.A2(B[0]),
	.A3(SYNTHESIZED_WIRE_44),
	.A4(SYNTHESIZED_WIRE_44),
	.A5(SYNTHESIZED_WIRE_44),
	.A6(SYNTHESIZED_WIRE_44)
	
	
	
	
	
	);



SN74LS04	b2v_inst25(
	.A1(C[7]),
	.A2(C[6]),
	.A3(C[5]),
	.A4(C[4]),
	.A5(C[3]),
	.A6(C[2])
	
	
	
	
	
	);


SN74LS04	b2v_inst26(
	.A1(C[1]),
	.A2(C[0]),
	.A3(SYNTHESIZED_WIRE_45),
	.A4(SYNTHESIZED_WIRE_45),
	.A5(SYNTHESIZED_WIRE_45),
	.A6(SYNTHESIZED_WIRE_45)
	
	
	
	
	
	);



SN74HC139	b2v_inst28(
	.E(SYNTHESIZED_WIRE_23),
	.A(addr[4:3]),
	.Y(out));


FPGA_counter	b2v_inst29(
	.LE(SYNTHESIZED_WIRE_24),
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


SN74LS04	b2v_inst31(
	.A1(D[7]),
	.A2(D[6]),
	.A3(D[5]),
	.A4(D[4]),
	.A5(D[3]),
	.A6(D[2])
	
	
	
	
	
	);


SN74LS04	b2v_inst32(
	.A1(D[1]),
	.A2(D[0]),
	.A3(SYNTHESIZED_WIRE_46),
	.A4(SYNTHESIZED_WIRE_46),
	.A5(SYNTHESIZED_WIRE_46),
	.A6(SYNTHESIZED_WIRE_46)
	
	
	
	
	
	);



SN74LS74	b2v_inst36(
	.d(SYNTHESIZED_WIRE_29),
	.PRE(SYNTHESIZED_WIRE_47),
	.CLR(SYNTHESIZED_WIRE_47),
	.clk(SHCP),
	.q(SYNTHESIZED_WIRE_32)
	);



SN74LS74	b2v_inst38(
	.d(SYNTHESIZED_WIRE_32),
	.PRE(SYNTHESIZED_WIRE_48),
	.CLR(SYNTHESIZED_WIRE_48),
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
	.data_out(SYNTHESIZED_WIRE_29));


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
	.E1(SYNTHESIZED_WIRE_49),
	.E2(SYNTHESIZED_WIRE_49),
	.E3(Y1),
	.A(addr[2:0]),
	.Y(B));



CN74HC138	b2v_inst8(
	.E1(SYNTHESIZED_WIRE_50),
	.E2(SYNTHESIZED_WIRE_50),
	.E3(Y2),
	.A(addr[2:0]),
	.Y(C));


endmodule
