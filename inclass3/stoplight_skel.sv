//-------------------------------------------------------------------
//Stoplight inclass problem - skeleton 
//-------------------------------------------------------------------

module stoplight (
  input reset_n,            //reset async active low
  input clk,                //input clock
  output northsouth_red,    //stoplight output    
  output northsouth_yellow, //stoplight output    
  output northsouth_green,  //stoplight output    
  output eastwest_red,      //stoplight output    
  output eastwest_yellow,   //stoplight output   
  output eastwest_green     //stoplight output    
  );

//enumerated values for stoplight_sm
  enum reg [1:0] {
		a = 2'b00,
		b = 2'b01,
		c = 2'b10,
		d = 2'b11,
                stoplightxx   = 'x
		} stoplight_ps, stoplight_ns;

reg [3:0] timer; //count time for light intervals
reg timer_reset;

//-------------------------------------------------------------------------------
// stoplight_sm
//-------------------------------------------------------------------------------
  always_ff @(posedge clk, negedge reset_n)
    if (!reset_n) stoplight_ps <= a;		 //after reset, go to state a
    else          stoplight_ps <= stoplight_ns;  //else, go to next state

  always_comb begin
    stoplight_ns = stoplightxx;   //default assignments
    timer_reset  = 1'b0;           
    unique case (stoplight_ps)
     a :
	if (timer == 10) begin  stoplight_ns = b; timer_reset = 1'b1; end
	else                    stoplight_ns = a;
     b :
	if (timer == 3)  begin  stoplight_ns = c; timer_reset = 1'b1; end
	else 		 	stoplight_ns = b;
     c :
	if (timer == 6)  begin	stoplight_ns = d; timer_reset = 1'b1; end
	else			stoplight_ns = c;
     d : 
	if (timer == 3)  begin	stoplight_ns = a; timer_reset = 1'b1; end
	else			stoplight_ns = d;
    endcase
  end//always_comb 
   
assign eastwest_red      = ((stoplight_ps == a) || (stoplight_ps == b))  ? 1'b1 : 1'b0;
assign eastwest_yellow   =  (stoplight_ps == d)  ? 1'b1 : 1'b0;
assign eastwest_green    =  (stoplight_ps == c)  ? 1'b1 : 1'b0;
assign northsouth_red    = ((stoplight_ps == c) || (stoplight_ps == d))  ? 1'b1 : 1'b0;
assign northsouth_yellow =  (stoplight_ps == b)  ? 1'b1 : 1'b0;
assign northsouth_green  =  (stoplight_ps == a)  ? 1'b1 : 1'b0;

//-------------------------------------------------------------------------------
//timer for stoplight_sm is below 
//-------------------------------------------------------------------------------
  always_ff @(posedge clk, negedge reset_n, negedge timer_reset)
    if (!reset_n) timer         <= '0;   //at reset, go to state a
    else if (timer_reset) timer <= '0;   //reset when told to
    else timer                  <= timer + '1;  //else increment

endmodule

