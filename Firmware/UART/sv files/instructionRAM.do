# quits any running simulation
quit -sim

# (re)compiles verilog code
vlog instructionRAM.sv
vlog instructionRAM_tb.sv

# starts simulation with desired module testbench
vsim instructionRAM_tb

# Set waveform configuration to show only leaf names
config wave -signalnamewidth 1

# Add input signals to waveform window
add wave -radix hex -group "Inputs" clk rst DEBUG MODE address data_in

# Add output signals to waveform window
add wave -group "Outputs" data_out



# Internal signals
add wave -radix unsigned -group "Internals" dut/addressWRITE_reg
add wave -radix unsigned -group "Internals" dut/addressINSTRUCTION_reg
add wave -radix hex -group "Internals" dut/ram
add wave -radix hex -group "Internals" dut/ram_instructions


# Run simulation
run -all

# Zoom to full waveform window
wave zoom full
