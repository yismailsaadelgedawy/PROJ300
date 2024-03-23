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
// CREATED		"Sat Mar 23 09:53:05 2024"

module M_circuit(
	CU,
	clk_50,
	rst,
	AR,
	DR,
	data_out
);


input wire	CU;
input wire	clk_50;
input wire	rst;
input wire	[11:0] AR;
input wire	[31:0] DR;
output wire	[37:0] data_out;

wire	[11:0] addr;
wire	clk;
wire	[32:0] conc_mmr_data;
wire	[31:0] data_in;
wire	[11:0] instruction_addr;
wire	[37:0] instruction_out;
wire	load_mmr;
wire	load_stack;
wire	[1:0] mem_in_select;
wire	[1:0] mem_out_select;
wire	MEMLOAD;
wire	[11:0] mmr_addr;
wire	[31:0] mmr_out;
wire	[6:0] mmr_sel;
wire	[32:0] mmrA;
wire	[32:0] mmrB;
wire	[32:0] mmrC;
wire	[32:0] mmrD;
wire	[32:0] mmrE;
wire	[32:0] mmrF;
wire	[32:0] mmrG;
wire	[32:0] mmrH;
wire	[32:0] mmrI;
wire	[32:0] mmrJ;
wire	[32:0] mmrK;
wire	[32:0] mmrL;
wire	[32:0] mmrM;
wire	[31:0] regA;
wire	[31:0] regB;
wire	[31:0] regC;
wire	[31:0] regD;
wire	[31:0] regE;
wire	[31:0] regF;
wire	[31:0] regG;
wire	[31:0] regH;
wire	[31:0] regI;
wire	[31:0] regJ;
wire	[31:0] regK;
wire	[31:0] regL;
wire	[31:0] regM;
wire	[11:0] stack_addr;
wire	[31:0] stack_out;
wire	sw_rst;
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




M_DEMUX	b2v_inst(
	.addr(addr),
	.sel(mem_in_select),
	.instruction(instruction_addr),
	.mmr(mmr_addr),
	.stack(stack_addr));


M_addr_checker	b2v_inst1(
	.MEMLOAD(MEMLOAD),
	.addr(addr),
	.load_mmr(load_mmr),
	.load_stack(load_stack),
	.sel(mem_in_select));


M_mmr_selector	b2v_inst10(
	.addr(mmr_addr),
	.sel(mmr_sel));




M_addr_checker	b2v_inst14(
	.MEMLOAD(SYNTHESIZED_WIRE_0),
	.addr(addr),
	
	
	.sel(mem_out_select));



CPU_regN	b2v_inst16(
	.inc(SYNTHESIZED_WIRE_1),
	.load(mmrC[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(mmrC[32:1]),
	.q(regC));
	defparam	b2v_inst16.N = 32;



CPU_regN	b2v_inst18(
	.inc(SYNTHESIZED_WIRE_2),
	.load(mmrD[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(mmrD[32:1]),
	.q(regD));
	defparam	b2v_inst18.N = 32;



conc32	b2v_inst2(
	.LOAD(load_mmr),
	.data_in(data_in),
	.data_out(conc_mmr_data));


CPU_regN	b2v_inst20(
	.inc(SYNTHESIZED_WIRE_3),
	.load(mmrE[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(mmrE[32:1]),
	.q(regE));
	defparam	b2v_inst20.N = 32;



CPU_regN	b2v_inst22(
	.inc(SYNTHESIZED_WIRE_4),
	.load(mmrF[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(mmrF[32:1]),
	.q(regF));
	defparam	b2v_inst22.N = 32;



CPU_regN	b2v_inst24(
	.inc(SYNTHESIZED_WIRE_5),
	.load(mmrG[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(mmrG[32:1]),
	.q(regG));
	defparam	b2v_inst24.N = 32;



CPU_regN	b2v_inst26(
	.inc(SYNTHESIZED_WIRE_6),
	.load(mmrH[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(mmrH[32:1]),
	.q(regH));
	defparam	b2v_inst26.N = 32;



CPU_regN	b2v_inst28(
	.inc(SYNTHESIZED_WIRE_7),
	.load(mmrI[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(mmrI[32:1]),
	.q(regI));
	defparam	b2v_inst28.N = 32;



testROM	b2v_inst3(
	.address(instruction_addr),
	.instruction(instruction_out));
	defparam	b2v_inst3.ADDR_WIDTH = 12;
	defparam	b2v_inst3.DATA_WIDTH = 38;


CPU_regN	b2v_inst30(
	.inc(SYNTHESIZED_WIRE_8),
	.load(mmrJ[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(mmrJ[32:1]),
	.q(regJ));
	defparam	b2v_inst30.N = 32;



CPU_regN	b2v_inst32(
	.inc(SYNTHESIZED_WIRE_9),
	.load(mmrK[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(mmrK[32:1]),
	.q(regK));
	defparam	b2v_inst32.N = 32;



CPU_regN	b2v_inst34(
	.inc(SYNTHESIZED_WIRE_10),
	.load(mmrL[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(mmrL[32:1]),
	.q(regL));
	defparam	b2v_inst34.N = 32;



CPU_regN	b2v_inst36(
	.inc(SYNTHESIZED_WIRE_11),
	.load(mmrM[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(mmrM[32:1]),
	.q(regM));
	defparam	b2v_inst36.N = 32;



M_RAM	b2v_inst4(
	.load(load_stack),
	.address(stack_addr),
	.data_in(data_in),
	.data_out(stack_out));
	defparam	b2v_inst4.ADDR_WIDTH = 12;
	defparam	b2v_inst4.DATA_WIDTH = 32;


M_MUX	b2v_inst5(
	.instruction(instruction_out),
	.mmr(mmr_out),
	.sel(mem_out_select),
	.stack(stack_out),
	.data(data_out));


M_mmr_DEMUX	b2v_inst6(
	.data_in(conc_mmr_data),
	.sel(mmr_sel[3:0]),
	.mmrA(mmrA),
	.mmrB(mmrB),
	.mmrC(mmrC),
	.mmrD(mmrD),
	.mmrE(mmrE),
	.mmrF(mmrF),
	.mmrG(mmrG),
	.mmrH(mmrH),
	.mmrI(mmrI),
	.mmrJ(mmrJ),
	.mmrK(mmrK),
	.mmrL(mmrL),
	.mmrM(mmrM));


M_mmr_MUX	b2v_inst7(
	.mmrA(regA),
	.mmrB(regB),
	.mmrC(regC),
	.mmrD(regD),
	.mmrE(regE),
	.mmrF(regF),
	.mmrG(regG),
	.mmrH(regH),
	.mmrI(regI),
	.mmrJ(regJ),
	.mmrK(regK),
	.mmrL(regL),
	.mmrM(regM),
	.sel(mmr_sel[3:0]),
	.data_out(mmr_out));


CPU_regN	b2v_inst8(
	.inc(SYNTHESIZED_WIRE_12),
	.load(mmrA[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(mmrA[32:1]),
	.q(regA));
	defparam	b2v_inst8.N = 32;


CPU_regN	b2v_inst9(
	.inc(SYNTHESIZED_WIRE_13),
	.load(mmrB[0]),
	.rst(sw_rst),
	.clk(clk),
	.d(mmrB[32:1]),
	.q(regB));
	defparam	b2v_inst9.N = 32;

assign	addr = AR;
assign	MEMLOAD = CU;
assign	data_in = DR;
assign	sw_rst = rst;
assign	clk = clk_50;

endmodule
