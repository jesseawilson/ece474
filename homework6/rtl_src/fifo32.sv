/********************************************************************
Name: fifo.sv
Author: Jesse Wilson
ECE 474 Homework 3
********************************************************************/

module fifo ( 
	input            wr_clk,   //write clock
	input            rd_clk,   //read clock
	input            reset_n,  //reset async active low
	input            wr,       //write enable 
	input            rd,       //read enable    
	input      [7:0] data_in,  //data in
	output reg [7:0] data_out, //data out
	output reg	 empty,    //empty flag
	output reg       full      //full flag
	);

	reg	[5:0]	rd_addr;
	reg     [5:0]	wr_addr;

	reg	[7:0]	byte00;
	reg	[7:0]	byte01;
	reg	[7:0]	byte02;
	reg	[7:0]	byte03;
	reg	[7:0]	byte04;
	reg	[7:0]	byte05;
	reg	[7:0]	byte06;
	reg	[7:0]	byte07;
	reg	[7:0]	byte08;
	reg	[7:0]	byte09;
	reg	[7:0]	byte10;
	reg	[7:0]	byte11;
	reg	[7:0]	byte12;
	reg	[7:0]	byte13;
	reg	[7:0]	byte14;
	reg	[7:0]	byte15;
	reg	[7:0]	byte16;
	reg	[7:0]	byte17;
	reg	[7:0]	byte18;
	reg	[7:0]	byte19;
	reg	[7:0]	byte20;
	reg	[7:0]	byte21;
	reg	[7:0]	byte22;
	reg	[7:0]	byte23;
	reg	[7:0]	byte24;
	reg	[7:0]	byte25;
	reg	[7:0]	byte26;
	reg	[7:0]	byte27;
	reg	[7:0]	byte28;
	reg	[7:0]	byte29;
	reg	[7:0]	byte30;
	reg	[7:0]	byte31;


always_ff @(posedge wr_clk, negedge reset_n)
begin
	if(!reset_n)	wr_addr <= '0;
	else if(wr)	wr_addr <= wr_addr + 1;
end

//write to memory logic
always_ff @(posedge wr_clk, negedge reset_n)  
begin
	if(!reset_n) begin
		byte00 <= '0;
		byte01 <= '0;
		byte02 <= '0;
		byte03 <= '0;
		byte04 <= '0;
		byte05 <= '0;
		byte06 <= '0;
		byte07 <= '0;
                byte08 <= '0;
                byte09 <= '0;
                byte10 <= '0;
                byte11 <= '0;
                byte12 <= '0;
                byte13 <= '0;
                byte14 <= '0;
                byte15 <= '0;
                byte16 <= '0;
                byte17 <= '0;
                byte18 <= '0;
                byte19 <= '0;
                byte20 <= '0;
                byte21 <= '0;
                byte22 <= '0;
                byte23 <= '0;
                byte24 <= '0;
                byte25 <= '0;
                byte26 <= '0;
                byte27 <= '0;
                byte28 <= '0;
                byte29 <= '0;
                byte30 <= '0;
                byte31 <= '0;
	end
	
	else if(wr) begin
		unique case (wr_addr[4:0])
			5'b00000 : byte00 <= data_in;
			5'b00001 : byte01 <= data_in; 
		    	5'b00010 : byte02 <= data_in; 
		    	5'b00011 : byte03 <= data_in; 
		    	5'b00100 : byte04 <= data_in; 
		    	5'b00101 : byte05 <= data_in; 
		    	5'b00110 : byte06 <= data_in; 
		    	5'b00111 : byte07 <= data_in; 
			5'b01000 : byte08 <= data_in;
			5'b01001 : byte09 <= data_in;
			5'b01010 : byte10 <= data_in;
			5'b01011 : byte11 <= data_in;
			5'b01100 : byte12 <= data_in;
			5'b01101 : byte13 <= data_in;
			5'b01110 : byte14 <= data_in;
			5'b01111 : byte15 <= data_in;
			5'b10000 : byte16 <= data_in;
			5'b10001 : byte17 <= data_in; 
		    	5'b10010 : byte18 <= data_in; 
		    	5'b10011 : byte19 <= data_in; 
		    	5'b10100 : byte20 <= data_in; 
		    	5'b10101 : byte21 <= data_in; 
		    	5'b10110 : byte22 <= data_in; 
		    	5'b10111 : byte23 <= data_in; 
			5'b11000 : byte24 <= data_in;
			5'b11001 : byte25 <= data_in;
			5'b11010 : byte26 <= data_in;
			5'b11011 : byte27 <= data_in;
			5'b11100 : byte28 <= data_in;
			5'b11101 : byte29 <= data_in;
			5'b11110 : byte30 <= data_in;
			5'b11111 : byte31 <= data_in;
		endcase
	end
end


//read from memory logic
always_ff @(posedge rd_clk, negedge reset_n)  
begin
	if(!reset_n)	rd_addr <= '0;
	else if(rd)	rd_addr <= rd_addr + 1;
end


//always pass through currently selected read data to output
always_comb 
begin
	data_out = '0;

	unique case (rd_addr[4:0])
	    5'b00000 : data_out = byte00;
	    5'b00001 : data_out = byte01;
	    5'b00010 : data_out = byte02;
	    5'b00011 : data_out = byte03;
	    5'b00100 : data_out = byte04;
	    5'b00101 : data_out = byte05;
	    5'b00110 : data_out = byte06;
	    5'b00111 : data_out = byte07;
	    5'b01000 : data_out = byte08;
	    5'b01001 : data_out = byte09;
	    5'b01010 : data_out = byte10;
	    5'b01011 : data_out = byte11;
	    5'b01100 : data_out = byte12;
	    5'b01101 : data_out = byte13;
	    5'b01110 : data_out = byte14;
	    5'b01111 : data_out = byte15;
	    5'b10000 : data_out = byte16;
	    5'b10001 : data_out = byte17;
	    5'b10010 : data_out = byte18;
	    5'b10011 : data_out = byte19;
	    5'b10100 : data_out = byte20;
	    5'b10101 : data_out = byte21;
	    5'b10110 : data_out = byte22;
	    5'b10111 : data_out = byte23;
	    5'b11000 : data_out = byte24;
	    5'b11001 : data_out = byte25;
	    5'b11010 : data_out = byte26;
	    5'b11011 : data_out = byte27;
	    5'b11100 : data_out = byte28;
	    5'b11101 : data_out = byte29;
	    5'b11110 : data_out = byte30;
	    5'b11111 : data_out = byte31;
	endcase
end


//full and empty flag logic
always_comb  
begin
	empty = 1'b1;
	full  = 1'b0;

	if(rd_addr[4:0] == wr_addr[4:0]) begin
		if(rd_addr[5] == wr_addr[5]) begin
			full  = 1'b0;
			empty = 1'b1;
		end

		else begin
			full  = 1'b1;
			empty = 1'b0;
		end
	end
	
	else begin
		full  = 1'b0;
		empty = 1'b0;
	end
end


endmodule

