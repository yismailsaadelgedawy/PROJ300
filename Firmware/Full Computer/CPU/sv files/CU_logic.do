# quits any running simulation
quit -sim

# (re)compiles verilog code
vlog CU_logic.sv
vlog CU_logic_tb.sv

# starts simulation with desired module testbench
vsim CU_logic_tb

# Set waveform configuration to show only leaf names
config wave -signalnamewidth 1

# adding an internal signal
add wave CU_logic_tb/dut/CPUstate

# Add input signals to waveform window
add wave -group "Inputs" N Z C V CPU_state

# Add output signals to waveform window
add wave -group "Outputs" RSELLOAD ROP1LOAD ROP2LOAD TRLOAD ARLOAD PCLOAD DRLOAD ACLOAD IRLOAD GPRLOAD MEMLOAD PCINC COUNTER_LD COUNTER_INC COUNTER_CLR
add wave -radix unsigned -group "Outputs" ALUSEL SYSTEMBUSSEL

# Run simulation
run -all

# Zoom to full waveform window
wave zoom full
