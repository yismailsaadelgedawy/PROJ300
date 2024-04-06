# quits any running simulation
quit -sim

# (re)compiles verilog code
vlog GPR_selector.sv
vlog GPR_selector_tb.sv

# starts simulation with desired module testbench
vsim GPR_selector_tb

# Set waveform configuration to show only leaf names
config wave -signalnamewidth 1

# Add internal signals
add wave -radix unsigned -group "Registers" GPR_selector_tb/dut/reg*


# Add input signals to waveform window
add wave -radix unsigned -group "Inputs" rst clk_50 GPRLOAD GPR_in rop1 rop2

# Add output signals to waveform window
add wave -radix unsigned -group "Outputs" GPR_out1 GPR_out2

# Run simulation
run -all

# Zoom to full waveform window
wave zoom full
