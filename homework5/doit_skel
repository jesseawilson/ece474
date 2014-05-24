#!/bin/bash

#make directories needed if they don't exist
if [ ! -s vectors ]; then
  mkdir vectors
fi

##if......


#remove previous results from /vectors and /reports
#rm.....
#rm.....
#rm.....


#check for work directory and make if necessary 

#compile verilog modules
vlog rtl_src/gcd.sv  
vlog  tb_src/tb.sv  

#simulate the rtl design
vsim tb -do dofile -quiet -c -t 1ps

#rename the output_data
#remove the old output_data file
#diff output_data and golden_data
#report the results

#compile synthesis library into work if needed

#synthesize the design using dc_syn and redirect output to the logfile

#check for latches in synthesized design
##grep.....

#check for errors in synthesis from latches being included
#if latches are found, report it

#fix missing timing parameter in sdf file
sed '/(HOLD (posedge RSTB)/d' < sdfout/gcd.gate.sdf  > sdfout/$$tempfile
sed '/(HOLD (posedge SETB)/d' < sdfout/$$tempfile    > sdfout/gcd.gate.sdf
rm sdfout/$$tempfile

#compile the gate level gcd 
vlog vlogout/gcd.gate.v  -work work

#simulate gate-level gcd 
vsim tb -do dofile  +nowarnTFMPC -quiet -c -t 1ps 
#rename the output_data
#remove the old output_data file
#diff output_data and golden_data
#report the results

#simulate the gate-level gcd with the sdf file
vsim tb -do dofile +nowarnTFMPC -quiet -c -sdfmax /tb/gcd_0=sdfout/gcd.gate.sdf -t 1ps  +nowarn3448

#rename the output_data
#remove the old output_data file
#diff output_data and golden_data
#report the results

