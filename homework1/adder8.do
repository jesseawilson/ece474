add list -nodelta
configure list -strobestart {9 ns}  -strobeperiod {10 ns}
configure list -usestrobe 1

add list -notrigger -hex -width 4  -label a          a
add list -notrigger -hex -width 4  -label b          b
add list -notrigger -hex -width 10 -label sum_out    sum_out
add list -notrigger -hex -width 8  -label c_out      c_out

force a		x"50"
force b		x"50"
run 10ns

force a		x"20"
force b		x"30"
run 10ns

force a		x"58"
force b		x"57"
run 10ns

force a		x"20"
force b		x"59"
run 10ns

force a		x"36"
force b		x"18"
run 10ns

force a		x"52"
force b		x"25"
run 10ns

force a		x"76"
force b		x"23"
run 10ns

force a		x"51"
force b		x"28"
run 10ns

force a		x"12"
force b		x"30"
run 10ns

force a		x"20"
force b		x"40"
run 10ns

force a		x"80"
force b		x"65"
run 10ns

force a		x"23"
force b		x"61"
run 10ns

force a		x"10"
force b		x"20"
run 10ns

force a		x"20"
force b		x"30"
run 10ns

force a		x"30"
force b		x"40"
run 10ns

force a		x"50"
force b		x"40"
run 10ns

force a		x"80"
force b		x"90"
run 10ns

force a		x"70"
force b		x"60"
run 10ns

force a		x"90"
force b		x"55"
run 10ns

force a		x"20"
force b		x"05"
run 10ns

force a		x"10"
force b		x"90"
run 10ns


write list adder8.list

quit

