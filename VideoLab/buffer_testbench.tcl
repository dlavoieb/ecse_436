
proc GenerateCPUClock {} {
    force -deposit /buffer_fft_output/clock 1 0 ns, 0 0.5 ns -repeat 1 ns
}

proc AddWaves {} {
    add wave -position end  sim:/buffer_fft_output/clock
    add wave -position end  sim:/buffer_fft_output/valid
    add wave -position end -radix unsigned sim:/buffer_fft_output/sample
    add wave -position end  sim:/buffer_fft_output/ready
    add wave -position end -radix unsigned sim:/buffer_fft_output/data_output
}

proc Init {} {
    vlib work
    vcom graph_display.vhd
    vcom buffer_fft_output.vhd

    vsim buffer_fft_output
    AddWaves
    GenerateCPUClock

    force -deposit sim:/buffer_fft_output/valid 0 0
}

Init


force -deposit sim:/buffer_fft_output/valid 1 0
force -deposit sim:/buffer_fft_output/sample 0001110001110001 0
run 6ns
force -deposit sim:/buffer_fft_output/valid 0 0
force -deposit sim:/buffer_fft_output/sample UUUUUUUUUUUUUUUU 0
run 3ns
force -deposit sim:/buffer_fft_output/valid 1 0
force -deposit sim:/buffer_fft_output/sample 0000000000000000 0
run 1ns
force -deposit sim:/buffer_fft_output/sample 0000000000000001 0
run 1ns
force -deposit sim:/buffer_fft_output/sample 0000000000000010 0
run 1ns
force -deposit sim:/buffer_fft_output/sample 0000000000000011 0
run 1ns
force -deposit sim:/buffer_fft_output/sample 0000000000000100 0
run 1ns
force -deposit sim:/buffer_fft_output/sample 0000000000000101 0
run 1ns
force -deposit sim:/buffer_fft_output/valid 0 0
force -deposit sim:/buffer_fft_output/sample UUUUUUUUUUUUUUUU 0
run 3ns
