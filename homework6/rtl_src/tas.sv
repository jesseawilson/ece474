/********************************************************************
Name: tas.sv
Author: Jesse Wilson
ECE 474 Homework 6
********************************************************************/


module tas (
	input		clk_50,        // 50Mhz input clock
       	input  		clk_2,         // 2Mhz input clock
       	input  		reset_n,       // reset async active low
       	input  		serial_data,   // serial input data
       	input  		data_ena,      // serial data enable
       	output 		ram_wr_n,      // write strobe to ram
       	output [7:0]	ram_data,      // ram data
       	output [10:0]	ram_addr       // ram address
       	);

	reg [7:0]	parallel_data;
	reg		fifo_read;
	reg		fifo_write;
	reg [7:0]	fifo_out;
	reg		fifo_empty;
	reg		zero_sel;
	reg		a5_or_c3;


//a5_or_c3 logic 
always_comb
begin
	a5_or_c3 = 'x;
	
	if(parallel_data == 8'hA5 || parallel_data == 8'hC3)
		a5_or_c3 = 1'b1;
	else	a5_or_c3 = 1'b0;
end


ctrl_50mhz ctrl_50mhz_0 (
	.clk		(clk_50),
	.reset_n	(reset_n),
	.serial_en	(data_ena),
	.A5_or_C3	(a5_or_c3),
	.write		(fifo_write)
);


ctrl_2mhz ctrl_2mhz_0 (
	.clk		(clk_2),
	.reset_n	(reset_n),
	.fifo_empty	(fifo_empty),
	.read		(fifo_read),
	.zero_sel	(zero_sel),
	.write_ram	(ram_wr_n)
);


shift_reg shift_reg_0 (
	.clk		(clk_50),
	.reset_n	(reset_n),
	.serial_data	(serial_data),
	.serial_en	(data_ena),
	.parallel_data	(parallel_data)
);


fifo fifo_0 (
	.wr_clk		(clk_50),
	.rd_clk		(clk_2),
	.reset_n	(reset_n),
	.wr		(fifo_write),
	.rd		(fifo_read),
	.data_in	(parallel_data),
	.data_out	(fifo_out),
	.empty		(fifo_empty),
	.full		()
);


averager averager_0 (
	.clk		(clk_2),
	.reset_n	(reset_n),
	.zero_sel	(zero_sel),
	.read		(fifo_read),
	.data_in	(fifo_out),
	.data_out	(ram_data)
);


ram_ctr ram_ctr_0 (
	.clk		(clk_2),
	.reset_n	(reset_n),
	.write_ram	(ram_wr_n),
	.ram_addr	(ram_addr)
);


endmodule

