`timescale 1ps/1ps
//`define EOF 32'hFFFF_FFFF

module tb; //testbench module 

integer input_file, output_file, in, out;
integer i;
integer nret;  //number of input fields returned from input file
integer numb_inputs = 2;  //expected input from input data file


parameter CYCLE = 2000;  //2ns period

reg clk, reset_n;
reg start, done;
reg [31:0] a_in, b_in; 
reg [31:0] result;


//clock generation for write clock
initial begin
  clk <= 0; 
  forever #(CYCLE/2) clk = ~clk;
end

//release of reset_n relative to two clocks
initial begin
    input_file  = $fopen("vectors/input_data", "rb");
    if (input_file==0) begin 
      $display("ERROR : CAN NOT OPEN input_file"); 
    end
    output_file = $fopen("vectors/output_data", "wb");
    if (output_file==0) begin 
      $display("ERROR : CAN NOT OPEN output_file"); 
    end
    a_in='x;
    b_in='x;
    start=1'b0;
    reset_n <= 0;
    #(CYCLE * 1.5) reset_n = 1'b1; //reset for 1.5 clock cycles
end

gcd gcd_0(.*); //instantiate the fifo

//about this inital block...
//see: http://stackoverflow.com/questions/5431941/while-feof-file-is-always-wrong
//
initial begin
  #(CYCLE*4);  //delay after reset
  while(!$feof(input_file)) begin 
    while(numb_inputs == (nret = $fscanf(input_file,"%d %d", a_in, b_in))) begin
      start=1'b1;
      #(CYCLE);
      start=1'b0;
      while(done != 1'b1) #(CYCLE);
      $fwrite(output_file,"a_in: %d   b_in: %d   result: %d\n",a_in, b_in, result);
      #(CYCLE*2); //2 cycle delay between trials
    end
  end
$fclose(input_file);
$finish;
end

endmodule
