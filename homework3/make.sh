#/bin/bash

#Place the directory/name of the source sv file (w/o file extension) below.
#Name the do file "name.do"
#Name the synthesis file "syn_name"
#Move the comp_lib.sh file into directory
#Move the .synopsys_dc.setup file into directory
#Run this file with ./make.sh

SRC_FILE="src/fifo"

NAME=`echo "$SRC_FILE" | awk -F '/' '{print $NF}'`

echo 
echo "****************************"
echo "*** BEGINNING SIMULATION ***"
echo "****************************"

# create work director
if [ ! -d "work" ]  
then 
	echo  
	echo "*** work directory does not exist.. making it ***"
	echo
	vlib work
fi

# remove old results if they exist
if [ -s "rtl_results.txt" ]
then
	rm -f rtl_results.txt
fi
if [ -s "gate_results.txt" ]
then
	rm -f gate_results.txt
fi
if [ -s "$NAME.list" ]
then
	rm -f $NAME.list
fi

# compile all sv files
if [ -s "$SRC_FILE.sv" ]  
then
	echo 
	echo "*** Compiling $SRC_FILE.sv ***"
	echo
	vlog -novopt $SRC_FILE.sv

	if [ $? != 0 ]
	then
		echo "*** Compiling FAILED ***"
		exit
	fi 
	else
		echo "*** $SRC_FILE.sv Not Present ***"
		exit
fi

# simulate sv level
if [ -s "$NAME.do" ]  
then
	echo 
	echo "*** Simulating $NAME ***"
	echo
	vsim $NAME -do $NAME.do -quiet -c -t 1ps
	cp $NAME.list rtl_results.txt

else
	echo "*** $NAME.do does not exist ***"
	exit
fi

if [ "$1" = "gate" ]
then

# synthesize module
if [ -s "syn_$NAME" ]  
then
	echo 
	echo "*** Synthesizing $NAME ***"
	echo
	dc_shell-xg-t -f syn_$NAME

else
	echo "*** syn_$NAME script does not exist ***"
	exit
fi

# check for compiled libraries
grep "/nfs/guille/a1/cadlibs/synop_lib/SAED_EDK90nm/Digital_Standard_Cell_Library/verilog" work/_info &> /dev/null
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

fi

echo
echo "*************************"
echo "*** END OF SIMULATION ***"
echo "*************************"
echo

