add list -nodelta
configure list -strobestart {9 ns}  -strobeperiod {10 ns}
configure list -usestrobe 1

add list -notrigger -hex -width 8 -label wr_clk		wr_clk
add list -notrigger -hex -width 8 -label rd_clk		rd_clk
add list -notrigger -hex -width 8 -label reset_n        reset_n
add list -notrigger -hex -width 8 -label wr		wr
add list -notrigger -hex -width 8 -label rd		rd
add list -notrigger -hex -width 8 -label data_in	data_in  
add list -notrigger -hex -width 8 -label data_out	data_out 
add list -notrigger -hex -width 8 -label empty		empty 
add list -notrigger -hex -width 8 -label full		full 

view signals
add wave -r wr_clk
add wave -r rd_clk
add wave -r reset_n
add wave -r wr
add wave -r rd
add wave -r data_in
add wave -r data_out
add wave -r empty
add wave -r full


write list alu.list

quit

