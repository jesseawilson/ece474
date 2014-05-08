add list -nodelta
configure list -strobestart {9 ns}  -strobeperiod {10 ns}
configure list -usestrobe 1

add list -notrigger -hex -width 6  -label opcode	opcode
add list -notrigger -hex -width 6  -label in_a		in_a
add list -notrigger -hex -width 6  -label in_b          in_b
add list -notrigger -hex -width 10 -label alu_out	alu_out
add list -notrigger -hex -width 10 -label alu_zero	alu_zero
add list -notrigger -hex -width 10 -label alu_carry	alu_carry   

view signals
add wave -r in_a
add wave -r in_b
add wave -r opcode
add wave -r alu_out
add wave -r alu_carry
add wave -r alu_zero

force in_a	x"10"
force in_b	x"20"
force opcode	x"1"
run 10ns

force in_a	x"FF"
force in_b	x"01"
force opcode	x"1"
run 10ns

force in_a	x"FF"
force in_b	x"FE"
force opcode	x"2"
run 10ns

force in_a	x"01"
force in_b	x"00"
force opcode	x"3"
run 10ns

force in_a	x"01"
force opcode	x"4"
run 10ns

force in_a	x"03"
force in_b	x"02"
force opcode	x"5"
run 10ns

force in_a	x"FF"
force in_b	x"07"
force opcode	x"6"
run 10ns

force in_a	x"0A"
force in_b	x"0C"
force opcode	x"7"
run 10ns

force in_a	x"FF"
force in_b	x"00"
force opcode	x"8"
run 10ns

force in_a	x"FF"
force opcode	x"9"
run 10ns

force in_a	x"77"
force opcode	x"A"
run 10ns

force in_a	x"77"
force opcode	x"B"
run 10ns

force in_a	x"00"
force opcode	x"B"
run 10ns

force in_a	b"111111X1"
force opcode	x"A"
run 10ns

force in_a	x"00"
force opcode	x"C"
run 10ns

write list alu.list

quit

