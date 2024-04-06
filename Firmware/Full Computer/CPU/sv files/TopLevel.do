# quits any running simulation
quit -sim

# (re)compiles verilog code
vlog TopLevel.sv
vlog TopLevel_tb.sv

# starts simulation with desired module testbench
vsim TopLevel_tb

# Set waveform configuration to show only leaf names
config wave -signalnamewidth 1

add wave TopLevel_tb/dut/b2v_inst27/CPUstate

########################################################################

# Add input signals to waveform window
add wave rst clk

# Add output signals to waveform window


########################################################################

# Add internal signals

# System bus
add wave -radix unsigned -group "System Bus" TopLevel_tb/dut/b2v_inst15/PC
add wave -radix unsigned -group "System Bus" TopLevel_tb/dut/b2v_inst15/DR
add wave -radix unsigned -group "System Bus" TopLevel_tb/dut/b2v_inst15/AR
add wave -radix unsigned -group "System Bus" TopLevel_tb/dut/b2v_inst15/AC
add wave -radix unsigned -group "System Bus" TopLevel_tb/dut/b2v_inst15/MEM
add wave -radix unsigned -group "System Bus" TopLevel_tb/dut/b2v_inst15/TR
add wave -radix unsigned -group "System Bus" TopLevel_tb/dut/b2v_inst15/rop1
add wave -radix unsigned -group "System Bus" TopLevel_tb/dut/b2v_inst15/rop2
add wave -radix unsigned -group "System Bus" TopLevel_tb/dut/b2v_inst15/GPR1
add wave -radix unsigned -group "System Bus" TopLevel_tb/dut/b2v_inst15/sel
add wave -radix binary -group "System Bus" TopLevel_tb/dut/system_bus



# Memory
add wave -radix hex -group "Memory" -label address TopLevel_tb/dut/AR
add wave -radix binary -group "Memory" TopLevel_tb/dut/b2v_inst22/instruction_out
add wave -radix unsigned -group "Memory" TopLevel_tb/dut/b2v_inst22/mmr_out
add wave -radix unsigned -group "Memory" TopLevel_tb/dut/b2v_inst22/stack_out
add wave -radix unsigned -group "Memory" TopLevel_tb/dut/b2v_inst22/data_out

# Instruction
add wave -radix binary -group "Instruction" TopLevel_tb/dut/IR
add wave -radix binary -group "Instruction" TopLevel_tb/dut/rsel
add wave -radix binary -group "Instruction" TopLevel_tb/dut/rop*

# MMRs
add wave -radix unsigned -group "MMRs" TopLevel_tb/dut/mmr_in_*

# Main Registers
add wave -radix unsigned -group "Main Registers" TopLevel_tb/dut/AR
add wave -radix unsigned -group "Main Registers" TopLevel_tb/dut/PC
add wave -radix unsigned -group "Main Registers" TopLevel_tb/dut/DR
add wave -radix unsigned -group "Main Registers" TopLevel_tb/dut/AC

# GPR Outputs
add wave -radix unsigned -group "GPR Outputs" TopLevel_tb/dut/b2v_inst18/reg*


# GPR Selector
add wave -radix unsigned -group "GPR Selector" TopLevel_tb/dut/b2v_inst18/GPR_in
add wave -radix unsigned -group "GPR Selector" TopLevel_tb/dut/GPRLOAD
add wave -radix unsigned -group "GPR Selector" TopLevel_tb/dut/GPR_sel*
add wave -radix unsigned -group "GPR Selector" TopLevel_tb/dut/GPR_out*



# CPU flags
add wave -radix binary -group "Flags Setter" -label opcode TopLevel_tb/dut/IR
add wave -radix unsigned -group "Flags Setter" TopLevel_tb/dut/b2v_inst23/op1
add wave -radix unsigned -group "Flags Setter" TopLevel_tb/dut/b2v_inst23/op2
add wave -radix unsigned -group "Flags Setter" TopLevel_tb/dut/b2v_inst23/AC_result
add wave -radix unsigned -group "Flags Setter" TopLevel_tb/dut/N
add wave -radix unsigned -group "Flags Setter" TopLevel_tb/dut/Z
add wave -radix unsigned -group "Flags Setter" TopLevel_tb/dut/C
add wave -radix unsigned -group "Flags Setter" TopLevel_tb/dut/V


# ALU
add wave -radix unsigned -group "ALU" TopLevel_tb/dut/ALUSEL
add wave -radix unsigned -group "ALU" TopLevel_tb/dut/ALU_op*
add wave -radix unsigned -group "ALU" TopLevel_tb/dut/ALU_out
add wave -radix unsigned -group "ALU" TopLevel_tb/dut/ACLOAD


########################################################################

# Run simulation
run -all

# Zoom to full waveform window
wave zoom full
