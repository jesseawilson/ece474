/******************************************************************************
Name:   gcd.sv
Author: Jesse Wilson
Class:  ECE 474
Assign: Homwork 4
******************************************************************************/


module gcd(	input	   [31:0] a_in,		//operand a
		input      [31:0] b_in,		//operand b
		input		  start,	//validates the input data
		input		  reset_n,	//reset
		input		  clk,		//clock
		output reg [31:0] result,	//output of GCD engine
		output reg	  done		//validates output value
	);


	reg [31:0]	reg_a;
	reg [31:0]	reg_b;
	reg		a_lt_b;
	reg		b_eq_0;

	enum reg [1:0]  {load_a		= 2'b00,
			load_a_minus_b	= 2'b01,
			swap_from_b	= 2'b10,
			hold_a		= 2'b11
			} reg_a_sel;

	enum reg [1:0]	{
			load_b		= 2'b00,
			swap_from_a	= 2'b10,
			hold_b		= 2'b11
			} reg_b_sel;

	enum reg [1:0]  {
			idle	= 2'b00,
			run	= 2'b01,
			fin	= 2'b10,
			gcd_xx	= 'x
			} gcd_ns, gcd_ps;



//reg_a 
always_ff @(posedge clk, negedge reset_n)
begin
	if(!reset_n)	
		reg_a <= '0;

	else	begin
		unique case(reg_a_sel)
		    load_a	    : reg_a <= a_in;
		    load_a_minus_b  : reg_a <= reg_a - reg_b;
		    swap_from_b	    : reg_a <= reg_b;
		    hold_a	    : reg_a <= reg_a;
		endcase
	end
end


//reg_b
always_ff @(posedge clk, negedge reset_n)
begin
	if(!reset_n)
		reg_b <= '0;
	
	else	begin
		unique case(reg_b_sel)
		    load_b	: reg_b <= b_in;
		    swap_from_a	: reg_b <= reg_a;
		    hold_b	: reg_b <= reg_b;
		endcase
	end
end


//result
always_ff @(posedge clk, negedge reset_n)
begin
	if(!reset_n)	
		result <= '0;

	else begin
		unique case(b_eq_0)
			1'b0	: result <= result;
			1'b1	: result <= reg_a;
		endcase
	end
end


//next state, present state flip flop
always_ff @(posedge clk, negedge reset_n)
begin
	if(!reset_n)	gcd_ps <= idle;
	else		gcd_ps <= gcd_ns;
end


//a_lt_b logic
always_comb
begin
	if(reg_a < reg_b) a_lt_b = 1'b1;
	else		  a_lt_b = 1'b0;
end


//b_eq_0 logic
always_comb
begin
	if(reg_b == 0)	b_eq_0 = 1'b1;
	else		b_eq_0 = 1'b0;
end


//state machine
always_comb 
begin
	gcd_ns = gcd_xx;

	case(gcd_ps)
		idle :	begin
			if(start)		gcd_ns = run;
			else			gcd_ns = idle;
		end

		run  :  begin
			if(a_lt_b)		gcd_ns = run;
			else if(!b_eq_0)	gcd_ns = run;
			else			gcd_ns = fin;
		end

		fin  :  gcd_ns = idle; 
	endcase
end


//register select logic
always_comb
begin
	reg_a_sel = hold_a;
	reg_b_sel = hold_b;
	done = 1'b0;

	case(gcd_ps)
		idle :	begin
			if(start) begin
				reg_a_sel = load_a;
				reg_b_sel = load_b;
			end

			else begin
				reg_a_sel = hold_a;
				reg_b_sel = hold_b;
			end
		end

		run  :	begin
			if(a_lt_b) begin 
				reg_a_sel = swap_from_b;
				reg_b_sel = swap_from_a;
			end

			else if(!b_eq_0) begin
				reg_a_sel = load_a_minus_b;
				reg_b_sel = hold_b;
			end

			else begin
				reg_a_sel = hold_a;
				reg_b_sel = hold_b;
			end
		end

		fin  :  begin
			reg_a_sel = hold_a;
			reg_b_sel = hold_b;
			done = 1'b1;
		end
	endcase
end


endmodule

