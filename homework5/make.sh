#/bin/bash

#Place the directory/name of the source sv file (w/o extension) below.
#Name the do file "name.do"
#Name the synthesis file "syn_name"
#Move the comp_lib.sh file into directory
#Move the .synopsys_dc.setup file into directory
#Run this file with ./make.sh


SRC_FILE="rtl_src/gcd"

TB_FILE="tb_src/tb"

NAME=`echo "$SRC_FILE" | awk -F '/' '{print $NF}'`

echo 
echo "****************************"
echo "*** BEGINNING SIMULATION ***"
echo "****************************"


# remove old results if they exist
if [ -s "vectors/outout_data_rtl" ]
then
	rm -f vectors/output_data_rtl
fi
if [ -s "vectors/output_data_gate" ]
then
	rm -f vectors/output_data_gate
fi
if [ -s "vectors/output_data_gate_sdf" ]
then
	rm -f vectors/output_data_gate_sdf
fi
if [ -s "reports" ] 
then
	rm -r -f reports/
fi


# create work directory
if [ ! -d "work" ]  
then 
	vlib work
fi

# create standard directories
if [ ! -s "vectors" ]
then
	mkdir vectors
fi
if [ ! -s "bin" ] 
then 
	mkdir bin
fi
if [ ! -s "logs" ]
then
	mkdir logs
fi
if [ ! -s "reports" ] 
then
	mkdir reports
fi
if [ ! -s "rtl_src" ] 
then
	mkdir rtl_src
fi
if [ ! -s "tb_src" ] 
then
	mkdir tb_src
fi
if [ ! -s "sdfout" ]
then
	mkdir sdfout
fi
if [ ! -s "vlogout" ]
then
	mkdir vlogout
fi


# compile source sv file
if [ -s "$SRC_FILE.sv" ]  
then
	echo 
	echo "*** Compiling $SRC_FILE.sv ***"
	echo
	vlog $SRC_FILE.sv

	if [ $? != 0 ]
	then
		echo "*** Compiling $SRC_FILE.sv FAILED ***"
		exit
	fi 
	else
		echo "*** $SRC_FILE.sv Not Present ***"
		exit
fi


# compile test bench sv file
if [ -s "$TB_FILE.sv" ]
then 
	echo
	echo "*** Compiling $TB_FILE.sv ***"
	echo
	vlog $TB_FILE.sv

	if [ $? != 0 ]
	then
		echo "*** Compiling $TB_FILE.sv FAILED ***"
		exit
	fi
	else
		echo "*** $TB_FILE.sv Not Present ***"
		exit
fi


# simulate rtl level
if [ -s "$NAME.do" ]  
then
	echo 
	echo "*** Simulating $NAME ***"
	echo
	vsim $TB_FILE -do $NAME.do -quiet -c -t 1ps 
else
	echo "*** $NAME.do does not exist, simulating without do file. ***"
	vsim $TB_FILE -quiet -c -t 1ps
fi


# rename the output_data
if [ -s "output_data" ]
then
	mv output_data vectors/output_data_rtl
else
	echo "*** output_data does not exist ***"
	exit
fi


# diff output_data and golden_data
if [ -s "vectors/golden_data" ]
then
	echo
	echo "*** Comparing output_data_rtl with golden_data ***"
	diff vectors/output_data_rtl vectors/golden_data 
			> reports/rtl_miscompares

	if [ $? -eq 0 ]
	then
		echo "*** diff output_data_rtl golden_data SUCCESS! ***"
	else
		echo "*** diff output_data_rtl golden_data FAILURE! ***"
	fi
else	
	echo "*** golden_data does not exist ***"
	exit
fi


# check for compiled libraries, compile if needed
grep "/nfs/guille/a1/cadlibs/synop_lib/SAED_EDK90nm/
	Digital_Standard_Cell_Library/verilog" work/_info &> /dev/null
if [ $? -ne 0 ]  
then
	echo 
	echo "*** Compiling Libraries ***"
	echo
	./comp_lib.sh
else
	echo
	echo "*** Libraries already compiles ***"
	echo
fi


# synthesize module
if [ -s "syn_$NAME" ]  
then
	echo 
	echo "*** Synthesizing $NAME ***"
	echo
	dc_shell-xg-t -f bin/dc_syn
	
else
	echo "*** syn_$NAME script does not exist ***"
	exit
fi


# check for gate file
if [ -s "$NAME.gate.v" ] 
then
	echo 
	echo "*** Compiling $NAME gates ***"
	echo
	vlog $NAME.gate.v

	if [ $? != 0 ]
	then
		echo "*** Could Not Compile $SRC_FILE.gate.v ***"
		exit
	fi

	else
		echo "*** $NAME gate file not found ***"
		exit
fi

# simulate gate level
if [ -s "$NAME.do" ] 
then
	echo 
	echo "*** Simulating $NAME with gates ***"
	echo
	vsim $NAME -do $NAME.do -quiet -c -t 1ps
	cp $NAME.list gate_results.txt
else
	echo "*** $NAME.do does not exist ***"
	exit
fi

# diff results
if [ -s "rtl_results.txt" ] && [ -s "gate_results.txt" ] 
then
	echo 
	echo "*** Comparing files ***"
	echo
	diff rtl_results.txt gate_results.txt

	if [ $? -eq 0 ]
	then
		echo "*** Output files identical. SUCCESS! ***"
	else
		echo "*** Output files NOT identical. FAILURE! ***"
	fi
fi

else
	echo
	echo "*** Skipping Gate Logic ***"
fi


echo
echo "*************************"
echo "*** END OF SIMULATION ***"
echo "*************************"
echo

