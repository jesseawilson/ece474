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
	reg     [7:0]	wr_sel;
	reg		last_wr; //0 if read, 1 if write

	reg	[7:0]	rd_byte0;
	reg	[7:0]	rd_byte1;
	reg	[7:0]	rd_byte2;
	reg	[7:0]	rd_byte3;
	reg	[7:0]	rd_byte4;
	reg	[7:0]	rd_byte5;
	reg	[7:0]	rd_byte6;
	reg	[7:0]	rd_byte7;


//write counter logic
always @(posedge wr_clk, negedge reset_n) begin
	if(!reset_n)	wr_addr = '0;

	else if(wr)	begin
			unique case (wr_addr)
			    0 : wr_sel[0] = 1;
			    1 : wr_sel[1] = 1;
		    	    2 : wr_sel[2] = 1;
		    	    3 : wr_sel[3] = 1;
		    	    4 : wr_sel[4] = 1;
		    	    5 : wr_sel[5] = 1;
		    	    6 : wr_sel[6] = 1;
		    	    7 : wr_sel[7] = 1;
			endcase
	
			wr_addr = wr_addr + 1; 
			last_wr = 1;
			end

	else		begin
			wr_addr = wr_addr;
			wr_sel  = '0;
			end
end


//read counter logic
always @(posedge rd_clk, negedge reset_n) begin
	if(!reset_n)	rd_addr = '0;

	else if(rd)	begin
			unique case (rd_addr)
			    0 : data_out = rd_byte0;
			    1 : data_out = rd_byte1;
			    2 : data_out = rd_byte2;
			    3 : data_out = rd_byte3;
			    4 : data_out = rd_byte4;
			    5 : data_out = rd_byte5;
			    6 : data_out = rd_byte6;
			    7 : data_out = rd_byte7;
			endcase

			rd_addr = rd_addr + 1;
			last_wr = 0;
			end

	else		begin
			rd_addr = rd_addr; 
			wr_sel  = '0;
			end
end


//full and empty flag logic
always_comb @(posedge wr_clk, negedge reset_n) begin
	if(!reset_n)	begin
			empty = 1;
			full  = 0;
			end

	else if(rd_addr == wr_addr) begin
		if(last_wr)	full  = 1;
		else		empty = 1;
		end
	
	else	begin
		empty = 0;
		full  = 0;
		end

end


//memory modules, 8 bits per module
mem8 mem8_0(
.clk		(wr_clk),
.reset_n	(reset_n),
.en		(wr_sel[0]),
.byte_in	(data_in),
.byte_out	(rd_byte0)
);

mem8 mem8_1(
.clk		(wr_clk),
.reset_n	(reset_n),
.en		(wr_sel[1]),
.byte_in	(data_in),
.byte_out	(rd_byte1)
);

mem8 mem8_2(
.clk		(wr_clk),
.reset_n	(reset_n),
.en		(wr_sel[2]),
.byte_in	(data_in),
.byte_out	(rd_byte2)
);

mem8 mem8_3(
.clk		(wr_clk),
.reset_n	(reset_n),
.en		(wr_sel[3]),
.byte_in	(data_in),
.byte_out	(rd_byte3)
);

mem8 mem8_4(
.clk		(wr_clk),
.reset_n	(reset_n),
.en		(wr_sel[4]),
.byte_in	(data_in),
.byte_out	(rd_byte4)
);

mem8 mem8_5(
.clk		(wr_clk),
.reset_n	(reset_n),
.en		(wr_sel[5]),
.byte_in	(data_in),
.byte_out	(rd_byte5)
);

mem8 mem8_6(
.clk		(wr_clk),
.reset_n	(reset_n),
.en		(wr_sel[6]),
.byte_in	(data_in),
.byte_out	(rd_byte6)
);

mem8 mem8_7(
.clk		(wr_clk),
.reset_n	(reset_n),
.en		(wr_sel[7]),
.byte_in	(data_in),
.byte_out	(rd_byte7)
);

endmodule


module mem8 (
	input		clk,
	input		reset_n, 
	input		en,
	input	[7:0]	byte_in,
	output	[7:0]	byte_out
	);

//memory 
always_ff @(posedge clk, negedge reset_n)
	if(!reset_n)	byte_out <= '0;
	else if(en)	byte_out <= byte_in;
	else		byte_out <= byte_out;
	
endmodule


