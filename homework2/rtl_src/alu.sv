/******************************************************************************
Name: alu.sv
Author: Jesse Wilson
Description: Source file for ALU
******************************************************************************/

module alu(
	input		[7:0]	in_a	  ,	//input a
	input		[7:0]	in_b	  ,	//input b
	input		[3:0]	opcode	  ,	//opcode input
	output	reg	[7:0]	alu_out	  ,	//alu output
	output	reg		alu_zero  ,	//'1' alu_output[7:0] == 8'h0
	output	reg		alu_carry	//indicates a carry out from ALU
	);

	parameter c_add = 4'h1;
	parameter c_sub = 4'h2;
	parameter c_inc = 4'h3;
	parameter c_dec = 4'h4;
	parameter c_or  = 4'h5;
	parameter c_and = 4'h6;
	parameter c_xor = 4'h7;
	parameter c_shr = 4'h8;
	parameter c_shl = 4'h9;
	parameter c_onescomp = 4'hA;
	parameter c_twoscomp = 4'hB;

	reg	[8:0] total;
	reg	[7:0] two_tmp;

always_comb  begin

	unique case(opcode)
		c_add : begin
			total = in_a + in_b;
			alu_out = total[7:0];
			alu_carry = total[8];
			end
			
		c_sub : begin
			total = in_a - in_b;
			alu_out = total[7:0];
			alu_carry = total[8];
			end
			
		c_inc : begin
			total = in_a + 1;
			alu_out = total[7:0];
			alu_carry = total[8];
			end
			
		c_dec : begin 
			total = in_a - 1;
			alu_out = total[7:0];
			alu_carry = total[8];
			end

		c_or  : begin
			alu_out = in_a | in_b;
			alu_carry = 1'b0;
			end

		c_and : begin
			alu_out = in_a & in_b;
			alu_carry = 1'b0;
			end

		c_xor : begin 
			alu_out = in_a ^ in_b;
			alu_carry = 1'b0;
			end

		c_shr : begin
			alu_out = in_a >> 1;
			alu_carry = 1'b0;
			end

		c_shl : begin
			total = in_a << 1;
			alu_out = total[7:0];
			alu_carry = total[8];
			end

		c_onescomp : begin
			     alu_out = ~in_a;
			     alu_carry = 1'b0;
			     end

		c_twoscomp : begin
			     two_tmp = ~in_a;
			     total = two_tmp + 1;
			     alu_out = total[7:0];
			     alu_carry = total[8];
			     end	
		
		default : begin
			  alu_out = 8'h00;
			  alu_carry = 1'b0;
			  end

	endcase

	alu_zero = ~(|(alu_out+alu_out));

end

endmodule

