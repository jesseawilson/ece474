/********************************************************************
Name: ctrl_50mhz.sv
Author: Jesse Wilson
ECE 474 Homework 6
********************************************************************/

module ctrl_50mhz (
	input		clk,
	input		reset_n,
	input		serial_en,
	input		A5_or_C3,
	output reg	write
	);


	//comp_byte reg
	enum reg 	{
			not_complete	= 1'b0,
			complete	= 1'b1,
			comp_byte_xx	= 'x
			} comp_byte_ps, comp_byte_ns;

	//temp_pkt reg
	enum reg 	{
			not_temp_pkt	= 1'b0,
			temp_pkt	= 1'b1,
			temp_pkt_xx	= 'x
			} temp_pkt_ps, temp_pkt_ns;

	//write_fifo reg
	enum reg 	{
			no_write_fifo	= 1'b0,
			write_fifo	= 1'b1,
			write_fifo_xx	= 'x
			} write_fifo_ps, write_fifo_ns;

	//write_byte reg
	enum reg [2:0]	{
			header		= 3'b000,
			byte1		= 3'b001,
			byte2		= 3'b010,
			byte3		= 3'b011,
			byte4		= 3'b100,
			write_byte_xx	= 'x
			} write_byte_ps, write_byte_ns;


//comp_byte state machine
always_ff @(posedge clk, negedge reset_n)
begin
	if(!reset_n)	comp_byte_ps <= not_complete;
	else		comp_byte_ps <= comp_byte_ns;
end

always_comb
begin
	comp_byte_ns = comp_byte_xx;
	
	case(comp_byte_ps)
		not_complete :	begin
				if(!serial_en)	comp_byte_ns = complete;
				else		comp_byte_ns = not_complete;
		end

		complete     :	comp_byte_ns = not_complete;
	endcase
end


//temp_pkt state machine
always_ff @(posedge clk, negedge reset_n)
begin
	if(!reset_n)	temp_pkt_ps <= not_temp_pkt;
	else		temp_pkt_ps <= temp_pkt_ns;
end

always_comb
begin
	temp_pkt_ns = temp_pkt_xx;

	case(temp_pkt_ps)
		not_temp_pkt :	begin
				if(A5_or_C3 && write_byte_ns == byte1)
						temp_pkt_ns = temp_pkt;
				else		temp_pkt_ns = not_temp_pkt;
		end

		temp_pkt     :	begin
				if(write_byte_ns == header)
						temp_pkt_ns = not_temp_pkt;
				else		temp_pkt_ns = temp_pkt;
		end
	endcase
end


//write_fifo state machine
always_ff @(posedge clk, negedge reset_n)
begin
	if(!reset_n)	write_fifo_ps <= no_write_fifo;
	else		write_fifo_ps <= write_fifo_ns;
end

always_comb
begin
	write_fifo_ns = write_fifo_xx;

	case(write_fifo_ps)
		no_write_fifo :	begin
				if(comp_byte_ns == complete &&
				   write_byte_ps != header &&
				   temp_pkt_ps == temp_pkt)
						write_fifo_ns = write_fifo;
				else		write_fifo_ns = no_write_fifo;
		end

		write_fifo    :	write_fifo_ns = no_write_fifo;
	endcase
end


//write_byte state machine
always_ff @(posedge clk, negedge reset_n)
begin
	if(!reset_n)	write_byte_ps <= header;
	else		write_byte_ps <= write_byte_ns;
end

always_comb
begin
	write_byte_ns = write_byte_xx;

	case(write_byte_ps)
		header       :	begin
				if(comp_byte_ns == complete)
						write_byte_ns = byte1;
				else		write_byte_ns = header;
		end

		byte1        :	begin
				if(comp_byte_ns == complete)
						write_byte_ns = byte2;
				else		write_byte_ns = byte1;
		end

		byte2        :	begin
				if(comp_byte_ns == complete)
						write_byte_ns = byte3;
				else		write_byte_ns = byte2;
		end

		byte3        :	begin
				if(comp_byte_ns == complete)
						write_byte_ns = byte4;
				else		write_byte_ns = byte3;
		end

		byte4        :	begin
				if(comp_byte_ns == complete)
						write_byte_ns = header;
				else		write_byte_ns = byte4;
		end

	endcase
end


//write output logic
always_comb
begin
	write = 'x;

	if(write_fifo_ps == write_fifo)
			write = 1'b1;
	else		write = 1'b0;
end


endmodule

