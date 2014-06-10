/********************************************************************
Name: ram_ctr.sv
Author: Jesse Wilson
ECE 474 Homework 6
********************************************************************/


module ram_ctr (
	input		   clk,
	input		   reset_n,
	input		   write_ram,
	output reg [15:0]  ram_addr
	);


always_ff @(posedge clk, negedge reset_n)
begin
	if(!reset_n) ram_addr <= 15'h07ff;

	else if(ram_addr == 15'h0) begin
		ram_addr <= 15'h07ff;
	end

	else if(write_ram) begin
		ram_addr <= (ram_addr - 1'h1);
	end
end


endmodule

