# quits any running simulation
quit -sim

# (re)compiles verilog code
vlog TopLevel.sv
vlog TopLevel_tb.sv

# starts simulation with desired module testbench
vsim TopLevel_tb

# Set waveform configuration to show only leaf names
config wave -signalnamewidth 1

# Add input signals to waveform window
add wave -group "Inputs" rst sw_load clk OE rA rB rC rD

# Add output signals to waveform window
add wave -group "Output 1" out_D out_C out_B out_A 
add wave -group "Output 2" out_H out_G out_F out_E 
add wave -group "Output 3" out_L out_K out_J out_I
add wave -group "Output 4" out_P out_O out_N out_M

# Internals
add wave -group "FPGA Shifter" dut/b2v_inst4/data_out

add wave -radix unsigned -group "Device 1" dut/b2v_inst/count
add wave -group "Device 1" dut/b2v_inst/DS
add wave -group "Device 1" dut/b2v_inst/shiftD
add wave -group "Device 1" dut/b2v_inst/shiftC
add wave -group "Device 1" dut/b2v_inst/shiftB
add wave -group "Device 1" dut/b2v_inst/shiftA

add wave -radix unsigned -group "Device 2" dut/b2v_inst/count
add wave -group "Device 2" dut/b2v_inst30/DS
add wave -group "Device 2" dut/b2v_inst30/shiftD
add wave -group "Device 2" dut/b2v_inst30/shiftC
add wave -group "Device 2" dut/b2v_inst30/shiftB
add wave -group "Device 2" dut/b2v_inst30/shiftA


# Run simulation
run -all

# Zoom to full waveform window
wave zoom full
