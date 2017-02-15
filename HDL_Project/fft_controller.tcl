
proc GenerateCPUClock {} {
    force -deposit /fft_controller_block/clock 1 0 ns, 0 0.5 ns -repeat 1 ns
}

proc AddWaves {} {
    add wave -position end  sim:/fft_controller_block/clock
    add wave -position end  sim:/fft_controller_block/start
}

proc Init {} {
    vlib work
    vcom graph_display.vhd
    vcom fft_controller_block.vhd

    vsim fft_controller_block
    AddWaves
    GenerateCPUClock

}

Init


run 50 ns