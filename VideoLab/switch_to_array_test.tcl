vcom graph_display.vhd
vcom switch_to_array.vhd
vsim switch_to_array
add wave -position end  sim:/switch_to_array/switch
add wave -position end  sim:/switch_to_array/data
force -deposit sim:/switch_to_array/switch 000000000000000000 0
run 1 ns
force -deposit sim:/switch_to_array/switch 000000000000000001 0
run 1 ns
force -deposit sim:/switch_to_array/switch 010001000100010001 0
run 1 ns
