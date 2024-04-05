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
// CREATED		"Mon Mar 25 09:48:26 2024"

module Memory(
	CU,
	clk_50,
	rst,
	AR,
	DR,
	mmr_in_A,
	mmr_in_B,
	mmr_in_C,
	mmr_in_D,
	mmr_in_E,
	mmr_in_F,
	mmr_in_G,
	mmr_in_H,
	mmr_in_I,
	mmr_in_J,
	mmr_in_K,
	mmr_in_L,
	mmr_in_M,
	data_out,
	mmr_out_A,
	mmr_out_B,
	mmr_out_C,
	mmr_out_D,
	mmr_out_E,
	mmr_out_F,
	mmr_out_G,
	mmr_out_H,
	mmr_out_I,
	mmr_out_J,
	mmr_out_K,
	mmr_out_L,
	mmr_out_M
);


input wire	CU;
input wire	clk_50;
input wire	rst;
input wire	[11:0] AR;
input wire	[31:0] DR;
input wire	[31:0] mmr_in_A;
input wire	[31:0] mmr_in_B;
input wire	[31:0] mmr_in_C;
input wire	[31:0] mmr_in_D;
input wire	[31:0] mmr_in_E;
input wire	[31:0] mmr_in_F;
input wire	[31:0] mmr_in_G;
input wire	[31:0] mmr_in_H;
input wire	[31:0] mmr_in_I;
input wire	[31:0] mmr_in_J;
input wire	[31:0] mmr_in_K;
input wire	[31:0] mmr_in_L;
input wire	[31:0] mmr_in_M;
output wire	[37:0] data_out;
output wire	[32:0] mmr_out_A;
output wire	[32:0] mmr_out_B;
output wire	[32:0] mmr_out_C;
output wire	[32:0] mmr_out_D;
output wire	[32:0] mmr_out_E;
output wire	[32:0] mmr_out_F;
output wire	[32:0] mmr_out_G;
output wire	[32:0] mmr_out_H;
output wire	[32:0] mmr_out_I;
output wire	[32:0] mmr_out_J;
output wire	[32:0] mmr_out_K;
output wire	[32:0] mmr_out_L;
output wire	[32:0] mmr_out_M;

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

assign	SYNTHESIZED_WIRE_0 = 0;




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



conc32	b2v_inst2(
	.LOAD(load_mmr),
	.data_in(data_in),
	.data_out(conc_mmr_data));


testROM	b2v_inst3(
	.address(instruction_addr),
	.instruction(instruction_out));
	defparam	b2v_inst3.ADDR_WIDTH = 12;
	defparam	b2v_inst3.DATA_WIDTH = 38;


M_mmr_DEMUX	b2v_inst38(
	.data_in(conc_mmr_data),
	.sel(mmr_sel[3:0]),
	.mmrA(mmr_out_A),
	.mmrB(mmr_out_B),
	.mmrC(mmr_out_C),
	.mmrD(mmr_out_D),
	.mmrE(mmr_out_E),
	.mmrF(mmr_out_F),
	.mmrG(mmr_out_G),
	.mmrH(mmr_out_H),
	.mmrI(mmr_out_I),
	.mmrJ(mmr_out_J),
	.mmrK(mmr_out_K),
	.mmrL(mmr_out_L),
	.mmrM(mmr_out_M));


M_RAM	b2v_inst4(
	.load(load_stack),
	.address(stack_addr),
	.data_in(data_in),
	.data_out(stack_out));
	defparam	b2v_inst4.ADDR_WIDTH = 12;
	defparam	b2v_inst4.DATA_WIDTH = 32;


M_mmr_MUX	b2v_inst40(
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


M_MUX	b2v_inst5(
	.instruction(instruction_out),
	.mmr(mmr_out),
	.sel(mem_out_select),
	.stack(stack_out),
	.data(data_out));

assign	addr = AR;
assign	MEMLOAD = CU;
assign	regA = mmr_in_A;
assign	regB = mmr_in_B;
assign	regC = mmr_in_C;
assign	regD = mmr_in_D;
assign	regE = mmr_in_E;
assign	regF = mmr_in_F;
assign	regG = mmr_in_G;
assign	regH = mmr_in_H;
assign	regI = mmr_in_I;
assign	regJ = mmr_in_J;
assign	regK = mmr_in_K;
assign	regL = mmr_in_L;
assign	regM = mmr_in_M;
assign	data_in = DR;

endmodule
