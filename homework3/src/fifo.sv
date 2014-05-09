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
	output           empty,    //empty flag
	output           full      //full flag
	);

	reg	[2:0]	rd_addr;
	reg     [2:0]	wr_addr;
	reg		prev; //1 for write, 0 for read
	reg	[7:0]	wr_byte;

	reg	[7:0]	byte0;
	reg	[7:0]	byte1;
	reg	[7:0]	byte2;
	reg	[7:0]	byte3;
	reg	[7:0]	byte4;
	reg	[7:0]	byte5;
	reg	[7:0]	byte6;
	reg	[7:0]	byte7;


//write counter
always_ff @(posedge wr_clk, negedge reset_n)  
begin
	if(!reset_n)	wr_addr <= '0;
	else if(wr)	wr_addr <= wr_addr + 1;  //may cause issue by incrementing durring writing
	else		wr_addr <= wr_addr;
end


//read counter
always_ff @(posedge rd_clk, negedge reset_n)  
begin
	if(!reset_n)	rd_addr <= '0;
	else if(rd)	rd_addr <= rd_addr + 1;
	else		rd_addr <= rd_addr;
end


//write to memory logic
always_ff @(posedge wr_clk, negedge reset_n)  
begin
	if(!reset_n)	begin
  			byte0   <= '0;
			byte1   <= '0;
			byte2   <= '0;
			byte3   <= '0;
			byte4   <= '0;
			byte5   <= '0;
			byte6   <= '0;
			byte7   <= '0;
			end
	
	else if(wr)	begin
			unique case (wr_addr)
			    3'b000 : byte0 = wr_byte;
			    3'b001 : byte1 = wr_byte; 
		    	    3'b010 : byte2 = wr_byte; 
		    	    3'b011 : byte3 = wr_byte; 
		    	    3'b100 : byte4 = wr_byte; 
		    	    3'b101 : byte5 = wr_byte; 
		    	    3'b110 : byte6 = wr_byte; 
		    	    3'b111 : byte7 = wr_byte; 
			endcase

			wr_byte <= data_in;
			end
	
	else		wr_byte <= wr_byte;
end


//read from memory logic
always_ff @(posedge rd_clk, negedge reset_n)  
begin
	if(!reset_n)	data_out <= '0;

	else		begin
			unique case (rd_addr)
			    3'b000 : data_out = byte0;
			    3'b001 : data_out = byte1;
			    3'b010 : data_out = byte2;
			    3'b011 : data_out = byte3;
			    3'b100 : data_out = byte4;
			    3'b101 : data_out = byte5;
			    3'b110 : data_out = byte6;
			    3'b111 : data_out = byte7;
			endcase
			end
end




//full and empty flag logic
always_comb  
begin
	if(!reset_n)	begin
			empty = 1;
			full  = 0;
			end

	else if(rd_addr == wr_addr) begin
		if(prev) begin
			 full  = 1;
			 empty = 0;
			 end

		else	 begin
			 empty = 1;
			 full  = 0;
			 end
		end
	
	else	begin
		empty = 0;
		full  = 0;
		end

end


endmodule

