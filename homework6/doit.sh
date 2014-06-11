#/bin/bash

#Provide name of project to be used in naming output files below.
#Name the do file "dofile"
#Name the synthesis file "dc_syn"
#Move the comp_lib.sh file into directory
#Move the .synopsys_dc.setup file into directory
#Run this file with ./doit.sh


NAME="tas"

echo
echo
echo "***********************************************"
echo "*** B E G I N N I N G   S I M U L A T I O N ***"
echo "***********************************************"
echo
echo


# remove old results if they exist
echo "DELETING OLD FILES"
if [ -e "vectors/outout_data_rtl" ]
then
	rm -f vectors/output_data_rtl
fi
if [ -e "vectors/output_data_gate" ]
then
	rm -f vectors/output_data_gate
fi
if [ -e "vectors/output_data_gate_sdf" ]
then
	rm -f vectors/output_data_gate_sdf
fi
if [ -e "reports" ] 
then
	rm -r -f reports/
fi


# create work directory
if [ ! -d "work" ]  
then 
	echo "CREATING WORK DIRECTORY"
	vlib work
fi


# create standard directories
if [ ! -s "vectors" ]
then
	echo "MAKING vectors DIRECTORY"
	mkdir vectors
fi
if [ ! -s "bin" ] 
then 
	echo "MAKING bin DIRECTORY"
	mkdir bin
fi
if [ ! -s "logs" ]
then
	echo "MAKING logs DIRECTORY"
	mkdir logs
fi
if [ ! -s "reports" ] 
then
	echo "MAKING reports DIRECTORY"
	mkdir reports
fi
if [ ! -s "rtl_src" ] 
then
	echo "MAKING rtl_src DIRECTORY"
	mkdir rtl_src
fi
if [ ! -s "tb_src" ] 
then
	echo "MAKING tb_src DIRECTORY"
	mkdir tb_src
fi
if [ ! -s "sdfout" ]
then
	echo "MAKING sdfout DIRECTORY"
	mkdir sdfout
fi
if [ ! -s "vlogout" ]
then
	echo "MAKING vlogout DIRECTORY"
	mkdir vlogout
fi


echo
echo
echo "***********************"
echo "*** COMPILING FILES ***"
echo "***********************"
echo


# compile source sv files
for SRC_FILE in rtl_src/*
do
	
	if [ -s "$SRC_FILE" ]  
	then
		echo
		echo "COMPILING $SRC_FILE"
		vlog $SRC_FILE
	
		if [ $? != 0 ]
		then
			echo "ERROR: COMPILING $SRC_FILE FAILED"
			exit
		fi 
		else
			echo "ERROR: $SRC_FILE DOES NOT EXIST"
			exit
	fi
done


# compile test bench sv file
if [ -s "tb_src/tb.sv" ]
then 
	echo
	echo "COMPILING tb.sv"
	vlog tb_src/tb.sv

	if [ $? != 0 ]
	then
		echo "ERROR: COMPILING tb.sv FAILED"
		exit
	fi
	else
		echo "ERROR: tb.sv DOES NOT EXIST"
		exit
fi


echo
echo
echo "**********************"
echo "*** RTL SIMULATION ***"
echo "**********************"
echo
# simulate rtl level
if [ -s "dofile" ]  
then
	echo
	echo "RTL: SIMULATING $NAME WITH TESTBENCH"
	vsim tb -do dofile -quiet -c -t 1ps 
else
	echo "ERROR: RTL: dofile DOES NOT EXIST"
	exit
fi


# rename the output_data
if [ -e "vectors/output_data" ]
then
	mv vectors/output_data vectors/output_data_rtl
else
	echo "ERROR: RTL: output_data DOES NOT EXIST"
	exit
fi


# diff output_data and golden_data
if [ -s "vectors/golden_data" ]
then
	echo
	echo "RTL: COMPARING output_data_rtl WITH golden_data..."
	diff vectors/output_data_rtl vectors/golden_data > reports/rtl_miscompares
	diff vectors/output_data_rtl vectors/golden_data &> /dev/null

	if [ $? -eq 0 ]
	then
		echo
		echo "RTL: OUTPUT FILES IDENTICAL. SUCCESS!"
	else
		echo
		echo "RTL: OUTPUT FILES NOT IDENTICAL. FAILURE!"
		exit
	fi
else	
	echo "ERROR: golden_data DOES NOT EXIST"
	exit
fi


echo
echo
echo "**********************"
echo "*** GATE SYNTHESIS ***"
echo "**********************"
echo
# check for compiled libraries, compile if needed
grep "/nfs/guille/a1/cadlibs/synop_lib/SAED_EDK90nm/
	Digital_Standard_Cell_Library/verilog" work/_info &> /dev/null
if [ $? -ne 0 ]  
then
	echo "SYN: COMPILING SYNTHESIS LIBRARIES"
	./comp_lib.sh
	echo "SYN: SYNTHESIS LIBRARIES COMPILED"
else
	echo "SYN: SYNTHESIS LIBRARIES ALREADY COMPILED"
fi


# synthesize module
if [ -s "bin/dc_syn" ]  
then
	echo
	echo "SYN: SYNTHESIZING $NAME WITH dc_syn"
	dc_shell-xg-t -f bin/dc_syn > logs/synth_log
	
else
	echo "ERROR: SYN: dc_syn DOES NOT EXIST"
	exit
fi


#check for latches in design
grep -i "latch" reports/cells_used &> /dev/null 
if [ $? -ne 0 ] 
then
	echo "NO LATCHES FOUND IN GATE SYNTHESIS" > reports/latches_used
	echo "SYN: NO LATCHES FOUND IN GATE SYNTHESIS"
else
	grep -i "latch" logs/synth_log > reports/latches_used
	echo "SYN: LATCHES FOUND IN GATE SYNTHESIS"
	exit
fi


# fix missing timing parameter in sdf file
sed '/(HOLD (posedge RSTB)/d' < "sdfout/$NAME.gate.sdf" > "sdfout/$$tempfile"
sed '/(HOLD (posedge SETB)/d' < "sdfout/$$tempfile" > "sdfout/$NAME.gate.sdf"
rm sdfout/$$tempfile


echo
echo
echo "***********************"
echo "*** GATE SIMULATION ***"
echo "***********************"
echo
# check for gate file
if [ -s "vlogout/$NAME.gate.v" ] 
then
	echo
	echo "COMPILING $NAME.gate.v"
	vlog vlogout/$NAME.gate.v -work work

	if [ $? != 0 ]
	then
		echo "ERROR: COMPILING $NAME.gate.v FAILED"
		exit
	fi
	else
		echo "ERROR: $NAME.gate.v DOES NOT EXIST"
		exit
fi


# simulate gate level
if [ -s "dofile" ] 
then
	echo
	echo "GATE: SIMULATING $NAME WITH TESTBENCH"
	vsim tb -do dofile +nowarnTFMPC -quiet -c -t 1ps
else
	echo "ERROR: GATE: dofile DOES NOT EXIST"
	exit
fi


# rename the output_data
if [ -e "vectors/output_data" ]
then
	mv vectors/output_data vectors/output_data_gate
else
	echo "ERROR: GATE: output_data DOES NOT EXIST"
	exit
fi


# diff output_data_gate and golden_data
if [ -s "vectors/golden_data" ]
then
	echo
	echo "GATE: COMPARING output_data_gate WITH golden_data..."
	diff vectors/output_data_gate vectors/golden_data > reports/gate_miscompares
	diff vectors/output_data_gate vectors/golden_data &> /dev/null

	if [ $? -eq 0 ]
	then
		echo
		echo "GATE: OUTPUT FILES IDENTICAL. SUCCESS!"
	else
		echo
		echo "GATE: OUTPUT FILES NOT IDENTICAL. FAILURE!"
		#exit
	fi
else	
	echo "ERROR: GATE: golden_data DOES NOT EXIST"
	exit
fi


echo
echo
echo "***************************"
echo "*** SDF GATE SIMULATION ***"
echo "***************************"
echo
# simulate gate level with sdf file
if [ -s "dofile" ] 
then
	echo
	echo "SDF: SIMULATING $NAME WITH TESTBENCH"
	vsim tb -do dofile +nowarnTFMPC -quiet -c -sdfmax "/tb/"$NAME"_0=sdfout/$NAME.gate.sdf" -t 1ps +nowarn3448 
else
	echo "ERROR: SDF: dofile DOES NOT EXIST"
	exit
fi


# rename the output_data
if [ -e "vectors/output_data" ]
then
	mv vectors/output_data vectors/output_data_gate_sdf
else
	echo "ERROR: SDF: output_data DOES NOT EXIST"
	exit
fi


# diff output_data_gate and golden_data
if [ -s "vectors/golden_data" ]
then
	echo
	echo "SDF: COMPARING output_data_gate_sdf WITH golden_data..."
	diff vectors/output_data_gate_sdf vectors/golden_data > reports/gate_sdf_miscompares
	diff vectors/output_data_gate_sdf vectors/golden_data &> /dev/null

	if [ $? -eq 0 ]
	then
		echo
		echo "SDF: OUTPUT FILES IDENTICAL. SUCCESS!"
	else
		echo
		echo "SDF: OUTPUT FILES NOT IDENTICAL. FAILURE!"
		exit
	fi
else	
	echo "ERROR: SDF: golden_data DOES NOT EXIST"
	exit
fi


echo
echo
echo "*****************************************"
echo "*** E N D   O F   S I M U L A T I O N ***"
echo "*****************************************"
echo
echo

