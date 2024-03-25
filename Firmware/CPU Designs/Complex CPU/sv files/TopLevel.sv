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
// CREATED		"Mon Mar 25 16:47:09 2024"

module TopLevel(
	rst,
	clk,
	clk_fast
);


input wire	rst;
input wire	clk;
input wire	clk_fast;

wire	[37:0] AC;
wire	ACLOAD;
wire	[31:0] ALU_op1;
wire	[31:0] ALU_op2;
wire	[31:0] ALU_out;
wire	[2:0] ALUSEL;
wire	[37:0] AR;
wire	ARLOAD;
wire	C;
wire	COUNTER_CLR;
wire	COUNTER_INC;
wire	COUNTER_LD;
wire	[5:0] CU_counter;
wire	[39:0] CU_decoder;
wire	[37:0] DR;
wire	DRLOAD;
wire	[37:0] GPR_out1;
wire	[31:0] GPR_out2;
wire	[3:0] GPR_sel1;
wire	[3:0] GPR_sel2;
wire	GPRLOAD;
wire	[3:0] IR;
wire	IRLOAD;
wire	[37:0] MEM;
wire	MEMLOAD;
wire	[31:0] mmr_in_A;
wire	[31:0] mmr_in_B;
wire	[31:0] mmr_in_C;
wire	[31:0] mmr_in_D;
wire	[31:0] mmr_in_E;
wire	[31:0] mmr_in_F;
wire	[31:0] mmr_in_G;
wire	[31:0] mmr_in_H;
wire	[31:0] mmr_in_I;
wire	[31:0] mmr_in_J;
wire	[31:0] mmr_in_K;
wire	[31:0] mmr_in_L;
wire	[31:0] mmr_in_M;
wire	[32:0] mmr_out_A;
wire	[32:0] mmr_out_B;
wire	[32:0] mmr_out_C;
wire	[32:0] mmr_out_D;
wire	[32:0] mmr_out_E;
wire	[32:0] mmr_out_F;
wire	[32:0] mmr_out_G;
wire	[32:0] mmr_out_H;
wire	[32:0] mmr_out_I;
wire	[32:0] mmr_out_J;
wire	[32:0] mmr_out_K;
wire	[32:0] mmr_out_L;
wire	[32:0] mmr_out_M;
wire	N;
wire	[37:0] PC;
wire	PCINC;
wire	PCLOAD;
wire	[37:0] rop1;
wire	ROP1LOAD;
wire	[37:0] rop2;
wire	ROP2LOAD;
wire	[1:0] rsel;
wire	RSELLOAD;
wire	sw_rst;
wire	[3:0] SYSBUSSEL;
wire	[37:0] system_bus;
wire	[37:0] TR;
wire	TRLOAD;
wire	V;
wire	Z;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;

assign	SYNTHESIZED_WIRE_0 = 0;
assign	SYNTHESIZED_WIRE_1 = 0;
assign	SYNTHESIZED_WIRE_2 = 0;
assign	SYNTHESIZED_WIRE_3 = 0;
assign	SYNTHESIZED_WIRE_4 = 0;
assign	SYNTHESIZED_WIRE_5 = 0;
assign	SYNTHESIZED_WIRE_6 = 0;
assign	SYNTHESIZED_WIRE_7 = 0;
assign	SYNTHESIZED_WIRE_8 = 0;
assign	SYNTHESIZED_WIRE_9 = 0;
assign	SYNTHESIZED_WIRE_10 = 0;
assign	SYNTHESIZED_WIRE_11 = 0;
assign	SYNTHESIZED_WIRE_12 = 0;
assign	SYNTHESIZED_WIRE_13 = 0;
assign	SYNTHESIZED_WIRE_14 = 0;
assign	SYNTHESIZED_WIRE_15 = 0;
assign	SYNTHESIZED_WIRE_16 = 0;
assign	SYNTHESIZED_WIRE_17 = 0;
assign	SYNTHESIZED_WIRE_18 = 0;
assign	SYNTHESIZED_WIRE_19 = 0;
assign	SYNTHESIZED_WIRE_20 = 0;




CPU_regN	b2v_inst(
	.inc(SYNTHESIZED_WIRE_0),
	.load(ARLOAD),
	.rst(sw_rst),
	.clk(clk),
	.d(system_bus[11:0]),
	.q(AR[11:0]));
	defparam	b2v_inst.N = 12;




CPU_regNA	b2v_inst11(
	.inc(SYNTHESIZED_WIRE_1),
	.load(RSELLOAD),
	.rst(sw_rst),
	.clk(clk_fast),
	.d(system_bus[33:32]),
	.q(rsel));
	defparam	b2v_inst11.N = 2;


CPU_regNA	b2v_inst12(
	.inc(SYNTHESIZED_WIRE_2),
	.load(ROP1LOAD),
	.rst(sw_rst),
	.clk(clk_fast),
	.d(system_bus[31:16]),
	.q(rop1[15:0]));
	defparam	b2v_inst12.N = 16;


CPU_regNA	b2v_inst13(
	.inc(SYNTHESIZED_WIRE_3),
	.load(ROP2LOAD),
	.rst(sw_rst),
	.clk(clk_fast),
	.d(system_bus[15:0]),
	.q(rop2[15:0]));
	defparam	b2v_inst13.N = 16;



systemBus_muxN	b2v_inst15(
	.AC(AC),
	.AR(AR),
	.DR(DR),
	.GPR1(GPR_out1),
	.MEM(MEM),
	.PC(PC),
	.rop1(rop1),
	.rop2(rop2),
	.sel(SYSBUSSEL),
	.TR(TR),
	.q(system_bus));
	defparam	b2v_inst15.N = 38;


CPU_regN	b2v_inst16(
	.inc(SYNTHESIZED_WIRE_4),
	.load(TRLOAD),
	.rst(sw_rst),
	.clk(clk),
	.d(system_bus[31:0]),
	.q(TR[31:0]));
	defparam	b2v_inst16.N = 32;



GPR_selector	b2v_inst18(
	.rst(sw_rst),
	.clk_50(clk),
	.GPRLOAD(GPRLOAD),
	.GPR_in(system_bus[31:0]),
	.rop1(GPR_sel1),
	.rop2(GPR_sel2),
	.GPR_out1(GPR_out1[31:0]),
	.GPR_out2(GPR_out2));


ALU	b2v_inst19(
	.ALUSEL(ALUSEL),
	.op1(ALU_op1),
	.op2(ALU_op2),
	.q(ALU_out));
	defparam	b2v_inst19.N = 32;


CPU_regN	b2v_inst2(
	.inc(PCINC),
	.load(PCLOAD),
	.rst(sw_rst),
	.clk(clk),
	.d(system_bus[11:0]),
	.q(PC[11:0]));
	defparam	b2v_inst2.N = 12;


operand_MUX	b2v_inst20(
	.sel(rsel[1]),
	.GPR(GPR_out1[31:0]),
	.rop(rop1[11:0]),
	.data_out(ALU_op1));


operand_MUX	b2v_inst21(
	.sel(rsel[0]),
	.GPR(GPR_out2),
	.rop(rop2[11:0]),
	.data_out(ALU_op2));


Memory	b2v_inst22(
	.clk_50(clk),
	.rst(rst),
	.CU(MEMLOAD),
	.AR(AR[11:0]),
	.DR(DR[31:0]),
	.mmr_in_A(mmr_in_A),
	.mmr_in_B(mmr_in_B),
	.mmr_in_C(mmr_in_C),
	.mmr_in_D(mmr_in_D),
	.mmr_in_E(mmr_in_E),
	.mmr_in_F(mmr_in_F),
	.mmr_in_G(mmr_in_G),
	.mmr_in_H(mmr_in_H),
	.mmr_in_I(mmr_in_I),
	.mmr_in_J(mmr_in_J),
	.mmr_in_K(mmr_in_K),
	.mmr_in_L(mmr_in_L),
	.mmr_in_M(mmr_in_M),
	.data_out(MEM),
	.mmr_out_A(mmr_out_A),
	.mmr_out_B(mmr_out_B),
	.mmr_out_C(mmr_out_C),
	.mmr_out_D(mmr_out_D),
	.mmr_out_E(mmr_out_E),
	.mmr_out_F(mmr_out_F),
	.mmr_out_G(mmr_out_G),
	.mmr_out_H(mmr_out_H),
	.mmr_out_I(mmr_out_I),
	.mmr_out_J(mmr_out_J),
	.mmr_out_K(mmr_out_K),
	.mmr_out_L(mmr_out_L),
	.mmr_out_M(mmr_out_M));


flags_setter	b2v_inst23(
	.rst(sw_rst),
	.ACLOAD(ACLOAD),
	.AC_result(ALU_out[11:0]),
	.op1(ALU_op1[11:0]),
	.op2(ALU_op2[11:0]),
	.opcode(IR),
	.N(N),
	.Z(Z),
	.C(C),
	.V(V));


CPU_regN	b2v_inst24(
	.inc(SYNTHESIZED_WIRE_5),
	.load(mmr_out_A[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(mmr_out_A[32:1]),
	.q(mmr_in_A));
	defparam	b2v_inst24.N = 32;


CU_counter	b2v_inst25(
	.load(COUNTER_LD),
	.inc(COUNTER_INC),
	.clr(COUNTER_CLR),
	.clk(clk),
	.rst(sw_rst),
	.opcode(IR),
	.sel_bits(rsel),
	.q(CU_counter));
	defparam	b2v_inst25.N = 6;
	defparam	b2v_inst25.opcode_bits = 4;


CU_decoder	b2v_inst26(
	.counter_value(CU_counter),
	.CPU_state(CU_decoder));
	defparam	b2v_inst26.N = 6;
	defparam	b2v_inst26.states = 40;


CU_logic	b2v_inst27(
	.N(N),
	.Z(Z),
	.C(C),
	.V(V),
	.CPU_state(CU_decoder),
	.RSELLOAD(RSELLOAD),
	.ROP1LOAD(ROP1LOAD),
	.ROP2LOAD(ROP2LOAD),
	.TRLOAD(TRLOAD),
	.ARLOAD(ARLOAD),
	.PCLOAD(PCLOAD),
	.DRLOAD(DRLOAD),
	.ACLOAD(ACLOAD),
	.IRLOAD(IRLOAD),
	.GPRLOAD(GPRLOAD),
	.MEMLOAD(MEMLOAD),
	.PCINC(PCINC),
	.COUNTER_LD(COUNTER_LD),
	.COUNTER_INC(COUNTER_INC),
	.COUNTER_CLR(COUNTER_CLR),
	.ALUSEL(ALUSEL),
	.SYSTEMBUSSEL(SYSBUSSEL));
	defparam	b2v_inst27.states = 40;


CPU_regN	b2v_inst28(
	.inc(SYNTHESIZED_WIRE_6),
	.load(mmr_out_B[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(mmr_out_B[32:1]),
	.q(mmr_in_B));
	defparam	b2v_inst28.N = 32;


CPU_regN	b2v_inst29(
	.inc(SYNTHESIZED_WIRE_7),
	.load(mmr_out_C[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(mmr_out_C[32:1]),
	.q(mmr_in_C));
	defparam	b2v_inst29.N = 32;




CPU_regN	b2v_inst31(
	.inc(SYNTHESIZED_WIRE_8),
	.load(mmr_out_D[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(mmr_out_D[32:1]),
	.q(mmr_in_D));
	defparam	b2v_inst31.N = 32;



CPU_regN	b2v_inst33(
	.inc(SYNTHESIZED_WIRE_9),
	.load(mmr_out_E[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(mmr_out_E[32:1]),
	.q(mmr_in_E));
	defparam	b2v_inst33.N = 32;



CPU_regN	b2v_inst35(
	.inc(SYNTHESIZED_WIRE_10),
	.load(mmr_out_F[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(mmr_out_F[32:1]),
	.q(mmr_in_F));
	defparam	b2v_inst35.N = 32;



CPU_regN	b2v_inst37(
	.inc(SYNTHESIZED_WIRE_11),
	.load(mmr_out_G[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(mmr_out_G[32:1]),
	.q(mmr_in_G));
	defparam	b2v_inst37.N = 32;



CPU_regN	b2v_inst39(
	.inc(SYNTHESIZED_WIRE_12),
	.load(mmr_out_H[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(mmr_out_H[32:1]),
	.q(mmr_in_H));
	defparam	b2v_inst39.N = 32;


CPU_regN	b2v_inst4(
	.inc(SYNTHESIZED_WIRE_13),
	.load(DRLOAD),
	.rst(sw_rst),
	.clk(clk),
	.d(system_bus),
	.q(DR));
	defparam	b2v_inst4.N = 38;



CPU_regN	b2v_inst41(
	.inc(SYNTHESIZED_WIRE_14),
	.load(mmr_out_I[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(mmr_out_I[32:1]),
	.q(mmr_in_I));
	defparam	b2v_inst41.N = 32;



CPU_regN	b2v_inst43(
	.inc(SYNTHESIZED_WIRE_15),
	.load(mmr_out_J[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(mmr_out_J[32:1]),
	.q(mmr_in_J));
	defparam	b2v_inst43.N = 32;



CPU_regN	b2v_inst45(
	.inc(SYNTHESIZED_WIRE_16),
	.load(mmr_out_K[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(mmr_out_K[32:1]),
	.q(mmr_in_K));
	defparam	b2v_inst45.N = 32;



CPU_regN	b2v_inst47(
	.inc(SYNTHESIZED_WIRE_17),
	.load(mmr_out_L[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(mmr_out_L[32:1]),
	.q(mmr_in_L));
	defparam	b2v_inst47.N = 32;



CPU_regN	b2v_inst49(
	.inc(SYNTHESIZED_WIRE_18),
	.load(mmr_out_M[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(mmr_out_M[32:1]),
	.q(mmr_in_M));
	defparam	b2v_inst49.N = 32;












dest_reg_selector	b2v_inst59(
	.rop1(rop1[15:12]),
	.rop1_AL(rop1[11:8]),
	.rop2(rop2[15:12]),
	.rop2_AL(rop2[11:8]),
	.state(CU_decoder),
	.GPR_sel1(GPR_sel1),
	.GPR_sel2(GPR_sel2));


CPU_regN	b2v_inst6(
	.inc(SYNTHESIZED_WIRE_19),
	.load(ACLOAD),
	.rst(sw_rst),
	.clk(clk),
	.d(ALU_out),
	.q(AC[31:0]));
	defparam	b2v_inst6.N = 32;



CPU_regNA	b2v_inst8(
	.inc(SYNTHESIZED_WIRE_20),
	.load(IRLOAD),
	.rst(sw_rst),
	.clk(clk_fast),
	.d(system_bus[37:34]),
	.q(IR));
	defparam	b2v_inst8.N = 4;



assign	sw_rst = rst;
assign	AC[37:32] = 6'b000000;
assign	AR[37:12] = 26'b00000000000000000000000000;
assign	GPR_out1[37:32] = 6'b000000;
assign	PC[37:12] = 26'b00000000000000000000000000;
assign	rop1[37:16] = 22'b0000000000000000000000;
assign	rop2[37:16] = 22'b0000000000000000000000;
assign	TR[37:32] = 6'b000000;

endmodule
