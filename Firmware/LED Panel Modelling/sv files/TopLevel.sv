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
// CREATED		"Fri Mar 29 12:50:00 2024"

module TopLevel(
	OE,
	rst,
	sw_load,
	clk,
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


input wire	OE;
input wire	rst;
input wire	sw_load;
input wire	clk;
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
wire	[6:0] count;
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
wire	MR;
wire	[3:0] out;
wire	rst_count;
wire	Y0;
wire	Y1;
wire	Y2;
wire	Y3;
wire	SYNTHESIZED_WIRE_53;
wire	SYNTHESIZED_WIRE_54;
wire	SYNTHESIZED_WIRE_55;
wire	SYNTHESIZED_WIRE_56;
wire	SYNTHESIZED_WIRE_57;
wire	SYNTHESIZED_WIRE_58;
wire	SYNTHESIZED_WIRE_59;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_60;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_61;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_62;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_63;
wire	SYNTHESIZED_WIRE_64;
wire	SYNTHESIZED_WIRE_65;
wire	SYNTHESIZED_WIRE_66;

assign	SYNTHESIZED_WIRE_53 = 0;
assign	SYNTHESIZED_WIRE_54 = 0;
assign	SYNTHESIZED_WIRE_55 = 0;
assign	SYNTHESIZED_WIRE_56 = 0;
assign	SYNTHESIZED_WIRE_57 = 0;
assign	SYNTHESIZED_WIRE_58 = 0;
assign	SYNTHESIZED_WIRE_59 = 0;
assign	SYNTHESIZED_WIRE_60 = 0;
assign	SYNTHESIZED_WIRE_61 = 0;
assign	SYNTHESIZED_WIRE_62 = 1;
assign	SYNTHESIZED_WIRE_63 = 1;
assign	SYNTHESIZED_WIRE_64 = 0;
assign	SYNTHESIZED_WIRE_65 = 0;
assign	SYNTHESIZED_WIRE_66 = 0;




led_controller_32	b2v_inst(
	.DS(data_A),
	.MR(MR),
	.SHCP(clk),
	.STCP(clk),
	.OE(OE),
	.count(count),
	.LE(LE_A),
	.rst_count(rst_count),
	.out_A(out_A),
	.out_B(out_B),
	.out_C(out_C),
	.out_D(out_D));


CN74HC138	b2v_inst1(
	.E1(SYNTHESIZED_WIRE_53),
	.E2(SYNTHESIZED_WIRE_53),
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
	.A3(SYNTHESIZED_WIRE_54),
	.A4(SYNTHESIZED_WIRE_54),
	.A5(SYNTHESIZED_WIRE_54),
	.A6(SYNTHESIZED_WIRE_54),
	.Y1(data_B),
	.Y2(data_A)
	
	
	
	);




SN74LS04	b2v_inst15(
	.A1(DS),
	.A2(SYNTHESIZED_WIRE_55),
	.A3(SYNTHESIZED_WIRE_55),
	.A4(SYNTHESIZED_WIRE_55),
	.A5(SYNTHESIZED_WIRE_55),
	.A6(SYNTHESIZED_WIRE_55),
	.Y1(SYNTHESIZED_WIRE_23)
	
	
	
	
	);



SN74LS04	b2v_inst17(
	.A1(out[3]),
	.A2(out[2]),
	.A3(out[1]),
	.A4(out[0]),
	.A5(SYNTHESIZED_WIRE_56),
	.A6(SYNTHESIZED_WIRE_56),
	.Y1(Y3),
	.Y2(Y2),
	.Y3(Y1),
	.Y4(Y0)
	
	);



CN74HC138	b2v_inst19(
	.E1(SYNTHESIZED_WIRE_57),
	.E2(SYNTHESIZED_WIRE_57),
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
	.A3(SYNTHESIZED_WIRE_58),
	.A4(SYNTHESIZED_WIRE_58),
	.A5(SYNTHESIZED_WIRE_58),
	.A6(SYNTHESIZED_WIRE_58)
	
	
	
	
	
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
	.A3(SYNTHESIZED_WIRE_59),
	.A4(SYNTHESIZED_WIRE_59),
	.A5(SYNTHESIZED_WIRE_59),
	.A6(SYNTHESIZED_WIRE_59)
	
	
	
	
	
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
	.MR(MR),
	.SHCP(clk),
	.STCP(clk),
	.OE(OE),
	.count(count),
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
	.A3(SYNTHESIZED_WIRE_60),
	.A4(SYNTHESIZED_WIRE_60),
	.A5(SYNTHESIZED_WIRE_60),
	.A6(SYNTHESIZED_WIRE_60)
	
	
	
	
	
	);



CD4024	b2v_inst34(
	.clk(clk),
	.rst(SYNTHESIZED_WIRE_29),
	.q(count));


CD4075	b2v_inst35(
	.C(rst),
	.B(rst_count),
	.A(SYNTHESIZED_WIRE_61),
	.F(SYNTHESIZED_WIRE_61),
	.E(SYNTHESIZED_WIRE_61),
	.D(SYNTHESIZED_WIRE_61),
	.I(SYNTHESIZED_WIRE_61),
	.H(SYNTHESIZED_WIRE_61),
	.G(SYNTHESIZED_WIRE_61),
	.J(SYNTHESIZED_WIRE_29)
	
	);


SN74LS74	b2v_inst36(
	.d(SYNTHESIZED_WIRE_37),
	.PRE(SYNTHESIZED_WIRE_62),
	.CLR(SYNTHESIZED_WIRE_62),
	.clk(clk),
	.q(SYNTHESIZED_WIRE_40)
	);



SN74LS74	b2v_inst38(
	.d(SYNTHESIZED_WIRE_40),
	.PRE(SYNTHESIZED_WIRE_63),
	.CLR(SYNTHESIZED_WIRE_63),
	.clk(clk),
	.q(DS)
	);



FPGA_LED_PSSR	b2v_inst4(
	.clk(clk),
	.rst(rst),
	.load(sw_load),
	.rA(rA),
	.rB(rB),
	.rC(rC),
	.rD(rD),
	.sel(addr[1:0]),
	.data_out(SYNTHESIZED_WIRE_37));


led_controller_32	b2v_inst40(
	.DS(data_C),
	.MR(MR),
	.SHCP(clk),
	.STCP(clk),
	.OE(OE),
	.count(count),
	.LE(LE_C),
	
	.out_A(out_I),
	.out_B(out_J),
	.out_C(out_K),
	.out_D(out_L));


led_controller_32	b2v_inst41(
	.DS(data_D),
	.MR(MR),
	.SHCP(clk),
	.STCP(clk),
	.OE(OE),
	.count(count),
	.LE(LE_D),
	
	.out_A(out_M),
	.out_B(out_N),
	.out_C(out_O),
	.out_D(out_P));



CD4001	b2v_inst43(
	.A(rst),
	.B(rst_count),
	.C(SYNTHESIZED_WIRE_64),
	.D(SYNTHESIZED_WIRE_64),
	.E(SYNTHESIZED_WIRE_64),
	.F(SYNTHESIZED_WIRE_64),
	.G(SYNTHESIZED_WIRE_64),
	.H(SYNTHESIZED_WIRE_64),
	.J(MR)
	
	
	);




CN74HC138	b2v_inst6(
	.E1(SYNTHESIZED_WIRE_65),
	.E2(SYNTHESIZED_WIRE_65),
	.E3(Y1),
	.A(addr[2:0]),
	.Y(B));



CN74HC138	b2v_inst8(
	.E1(SYNTHESIZED_WIRE_66),
	.E2(SYNTHESIZED_WIRE_66),
	.E3(Y2),
	.A(addr[2:0]),
	.Y(C));


endmodule
