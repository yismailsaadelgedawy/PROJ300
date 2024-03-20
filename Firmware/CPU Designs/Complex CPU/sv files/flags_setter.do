# quits any running simulation
quit -sim

# (re)compiles verilog code
vlog flags_setter.sv
vlog flags_setter_tb.sv

# starts simulation with desired module testbench
vsim flags_setter_tb

# Set waveform configuration to show only leaf names
config wave -signalnamewidth 1

# Add input signals to waveform window
add wave -radix hex -group "Inputs" rst AC_update opcode op1 op2 AC_result

# Add output signals to waveform window
add wave -group "Outputs" N Z C V

# Run simulation
run -all

# Zoom to full waveform window
wave zoom full
