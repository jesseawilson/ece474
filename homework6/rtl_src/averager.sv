/********************************************************************
Name: averager.sv
Author: Jesse Wilson
ECE 474 Homework 6
********************************************************************/


module averager (
	input		  clk,
	input		  reset_n,
	input		  zero_sel,
	input		  read,
	input	   [7:0]  data_in,
	output reg [7:0]  data_out
	);

	reg [9:0] acl;
	

always_ff @(posedge clk, negedge reset_n)
begin
	if(!reset_n)  acl <= '0;

	else if(read) begin
		case(zero_sel)
		    1'b0 :  acl <= (acl + data_in);
		    1'b1 :  acl <= data_in;
		endcase
	end
end


always_comb
begin
	data_out = (acl >> 2);
end


endmodule

