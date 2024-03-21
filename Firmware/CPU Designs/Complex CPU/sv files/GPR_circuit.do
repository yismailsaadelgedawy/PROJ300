# quits any running simulation
quit -sim

# (re)compiles verilog code
vlog GPR_circuit.sv
vlog GPR_circuit_tb.sv

# starts simulation with desired module testbench
vsim GPR_circuit_tb

# Set waveform configuration to show only leaf names
config wave -signalnamewidth 1

# Add internal signals
add wave -radix unsigned -group "Registers" GPR_circuit_tb/dut/b2v_inst/regA
add wave -radix unsigned -group "Registers" GPR_circuit_tb/dut/b2v_inst/regB
add wave -radix unsigned -group "Registers" GPR_circuit_tb/dut/b2v_inst/regC
add wave -radix unsigned -group "Registers" GPR_circuit_tb/dut/b2v_inst/regD
add wave -radix unsigned -group "Registers" GPR_circuit_tb/dut/b2v_inst/regE
add wave -radix unsigned -group "Registers" GPR_circuit_tb/dut/b2v_inst/regF
add wave -radix unsigned -group "Registers" GPR_circuit_tb/dut/b2v_inst/regG
add wave -radix unsigned -group "Registers" GPR_circuit_tb/dut/b2v_inst/regH
add wave -radix unsigned -group "Registers" GPR_circuit_tb/dut/b2v_inst/regI
add wave -radix unsigned -group "Registers" GPR_circuit_tb/dut/b2v_inst/regJ
add wave -radix unsigned -group "Registers" GPR_circuit_tb/dut/b2v_inst/regK
add wave -radix unsigned -group "Registers" GPR_circuit_tb/dut/b2v_inst/regL
add wave -radix unsigned -group "Registers" GPR_circuit_tb/dut/b2v_inst/regM

# Add input signals to waveform window
add wave -radix unsigned -group "Inputs" rst clk_50 GPRLOAD GPR_data rop1 rop2

# Add output signals to waveform window
add wave -radix unsigned -group "Outputs" GPR_out1 GPR_out2

# Run simulation
run -all

# Zoom to full waveform window
wave zoom full
