#!/bin/bash

echo ""
echo "*** BEGINNING SIMULATION ***"
echo ""

if [ ! -d "work" ] ; then 
	echo "" 
	echo "*** work directory does not exist.. making it ***"
	vlib work
fi

if [ -s "fadder.sv" ] ; then 
	echo ""
	echo "*** Making fadder ***"
	vlog -novopt fadder.sv
fi

if [ -s "adder8.sv" ] ; then
	echo ""
	echo "*** Making adder8 ***"
	vlog -novopt adder8.sv
fi

if [ -s "adder8.do" ] ; then
	echo ""
	echo "*** Simulating adder8 ***"
	vsim adder8 -do adder8.do -quiet -c -t 1ps
	cp adder8.list rtl_results.txt
fi

if [ -s "syn_adder8" ] ; then
	echo ""
	echo "*** Synthesizing adder8 ***"
	dc_shell-xg-t -f syn_adder8
fi

grep "/nfs/guille/a1/cadlibs/synop_lib/SAED_EDK90nm/Digital_Standard_Cell_Library/verilog" work/_info &> /dev/null
if [ $? -ne 0 ] ; then
	echo ""
	echo "Compiling Libraries"
	./comp_lib.sh
fi

if [ -s "adder8.gate.v" ] ; then
	echo ""
	echo "*** Compiling adder8.gate.v ***"
	vlog adder8.gate.v
fi

if [ -s "adder8.do" ] ; then
	echo ""
	echo "*** Simulating adder8 with gates ***"
	vsim adder8 -do adder8.do -quiet -c -t 1ps
	cp adder8.list gate_results.txt
fi

if [ -s "rtl_results.txt" ] && [ -s "gate_results.txt" ] ; then
	echo ""
	echo "*** Comparing files ***"
	echo "*** If nothing printed before finished, everything was successful. ***"
	diff rtl_results.txt gate_results.txt
	echo "*** Comparing finished ***"
fi

echo ""
echo "*** END OF SIMULATION ***"
echo ""

