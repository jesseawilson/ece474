module gcd(	input [31:0] a_in,		//operand a
		input [31:0] b_in,		//operand b
		input start,			//validates the input data
		input reset_n,			//reset
		input clk,			//clock
		output reg [31:0] result,	//output of GCD engine
		output reg done			//validates output value
	);


	reg [31:0]	reg_a, reg_b;

	enum reg [1:0]  {
			load_a		= 2'b00,
			load_a_minus_b	= 2'b01,
			swap_from_b	= 2'b10,
			hold_a		= 2'b11,
			reg_a_xx	= 'x
			} reg_a_sel;

	enum reg [1:0]	{
			load_b		= 2'b00,
			swap_from_a	= 2'b10,
			hold_b		= 2'b11,
			reg_b_xx	= 'x
			} reg_b_sel;

	enum reg [1:0]  {
			idle	= 2'b00;
			run	= 2'b01;
			finish	= 2'b10;
			gcd_xx	= 'x
			} gcd_ns, gcd_ps;



//reg_a 
always_ff @(posedge clk, negedge reset_n)
begin
	if(!reset_n)	
		reg_a <= '0;

	else	begin
		unique case(reg_a_sel)
			load_a		: reg_a <= a_in;
			load_a_minus_b  : reg_a <= reg_a - reg_b;
			swap_from_b	: reg_a <= reg_b;
			hold_a		: reg_a <= reg_a;
		endcase
	end
end


//reg_b
always_ff @(posedge clk, negedge reset_n)
begin
	if(!reset_n)
		reg_b <= '0;
	
	else	begin
		unique case(reg_a_sel)
			load_b		: reg_b <= b_in;
			swap_from_a	: reg_b <= reg_a;
			hold_b		: reg_b <= reg_b;
		endcase
	end
end



