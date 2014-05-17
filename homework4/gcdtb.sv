

`timescale 1ns/1ns

module gcdtb; //testbench module for the fifo

integer input_file, output_file, in, out;

integer i;

parameter CYCLE = 20;

reg [31:0] a_in, b_in;
reg start, reset_n, clk;
reg [31:0] result;
reg done;


initial begin
	initalize;

	#(CYCLE*10.5);
	calc(1);
	#(CYCLE);

/*
	#(WR_CYCLE*4.5);    //wait for 4 cycles
  	wrstim(8);   //write data to fifo
  	rdstim(8);   //read data from fifo
  	#(WR_CYCLE); //wait 
  	wrstim(7);   //write data to fifo
  	rdstim(7);   //read data from fifo
  	#(WR_CYCLE); //wait for things to settle
  	wrstim(6);   //write data to fifo
  	rdstim(6);   //read data from fifo
  	#(WR_CYCLE); //wait for things to settle
  	wrstim(5);   //write data to fifo
  	rdstim(5);   //read data from fifo
  	#(WR_CYCLE); //wait for things to settle
  	wrstim(4);   //write data to fifo
  	rdstim(4);   //read data from fifo
*/
	$fclose(input_file);
	$fclose(output_file);
	$finish;
end


//clock generation
initial begin
	clk <= 0; 
	forever #(CYCLE/2) clk = ~clk;
end


//reset generation
//potential problem: release of reset_n relative to two clocks
initial begin
	reset_n <= 0;
	#(CYCLE * 1.5) reset_n = 1'b1; //reset for 1.5 clock cycles
end


gcd gcd_0(.*); //instantiate the gcd 

task initalize;
begin
	start = 1'b0;
	a_in = 'x;
	b_in = 'x;

	input_file  = $fopen("input_data", "rb");
	if (input_file==0) begin 
		$display("ERROR : CAN NOT OPEN input_file"); 
	end

	output_file = $fopen("output_data", "wb");
	if (output_file==0) begin 
		$display("ERROR : CAN NOT OPEN output_file"); 
	end
end
endtask


task calc(input [8:0] rep);
begin
	for(i=0; i<rep; i++) begin
		@(negedge clk);
		$fscanf(input_file, "%h", a_in);
		$fscanf(input_file, "%h", b_in);

		$display("=================");
		start <= 1'b1;
		$display("Starting...");
		@(negedge clk);
		start <= 1'b0;

		$display("a_in: %h", a_in);
		$display("b_in: %h", b_in);
		
		@(posedge clk);
		while(!done) begin end

		$display("done=%b", done);
		$display("result: %h", result);
		$fwrite(output_file, "%h\n", result);
		$display("=================");

		a_in = 'x;
		b_in = 'x;
	end
end
endtask
		

/*
task wrstim (input [7:0] rep);  //write stimulus for block using file i/o
  begin
    for(i=0;i<rep;i++) begin
      @(negedge wr_clk);
      $fscanf(input_file,"%h",data_in);
      wr<=1'b1;
      $display("=====================");
      $display ("wrote: %h", data_in);
      @(negedge wr_clk);
      $display ("empty=%b, full=%b", empty, full);
      $display("=====================");
      wr<=1'b0;
      data_in=8'bx;
  end
end
endtask

task rdstim(input [7:0] rep);  //read stimulus for block
  begin
    for(i=0;i<rep;i++) begin
      @(negedge rd_clk);
      rd=1'b1;
      $display("=====================");
      $display ("read: %h", data_out,);
      $fwrite(output_file,"%h\n",data_out);
      @(negedge rd_clk);
      $display ("empty=%b full=%b", empty, full);
      rd=1'b0;
    end
  end
endtask
*/


endmodule 

