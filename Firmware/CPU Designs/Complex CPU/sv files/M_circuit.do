# quits any running simulation
quit -sim

# (re)compiles verilog code
vlog M_circuit.sv
vlog M_circuit_tb.sv

# starts simulation with desired module testbench
vsim M_circuit_tb

# Set waveform configuration to show only leaf names
config wave -signalnamewidth 1

# Add internal signals

# address checker 1
add wave M_circuit_tb/dut/b2v_inst1/state

# stack
add wave -radix unsigned -group "stack" M_circuit_tb/dut/b2v_inst4/data_in
add wave -radix unsigned -group "stack" M_circuit_tb/dut/b2v_inst4/address
add wave -radix unsigned -group "stack" M_circuit_tb/dut/b2v_inst4/load
add wave -radix unsigned -group "stack" M_circuit_tb/dut/b2v_inst4/data_out

# Add input signals to waveform window
add wave -radix unsigned -group "Inputs" rst clk_50 AR DR CU      

# Add output signals to waveform window
add wave -radix unsigned -group "Outputs" data_out

# Run simulation
run -all

# Zoom to full waveform window
wave zoom full
