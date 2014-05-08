//-------------------------------------------------------------------
//This module creates a testbench for the stoplight     
//R. Traylor 4.29.2014
//-------------------------------------------------------------------

`timescale 1ns/1ns

module stoplighttb; 

parameter CYCLE = 100;

reg clk, reset_n;
reg eastwest_red, eastwest_yellow, eastwest_green, northsouth_red, northsouth_yellow, northsouth_green;

//clock generation 
initial begin
  clk <= 0;
  forever #(CYCLE/2) clk = ~clk;
end

//reset generation
initial begin
    reset_n <= 0;
    #(CYCLE * 1.5) reset_n = 1'b1; //reset for 1.5 clock cycles
  end

initial begin
  $monitor("EW_red=%b, EW_yellow=%b, EW_green=%b, NS_red=%b, NS_yellow=%b, NS_green=%b",
            eastwest_red, eastwest_yellow, eastwest_green, northsouth_red, northsouth_yellow, northsouth_green);
  end

//instantiate the stoplight module
stoplight stoplight_0(.*); 

endmodule 
