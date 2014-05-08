module inclass (
       input  clk,           // clock input
       input  reset_n,       // reset async active low
       input  read,          // read signal 
       input  write,         // write signal
       input  [7:0] data_in, // data input 
       output [7:0] data_out // data output 
       );

//declare internal signals
  wire [2:0] address;   //output of counter 
  wire ram_wr;          //write line to fifo
  wire ram_rd;          //read line to fifo
  wire logic_one;       //read line to fifo

  assign logic_one = 1'b1;    //pullup to logic one

//-----------------  module instantiations  --------------------------
  counter #(.width(3)) counter_0(   //this is a three bit counter
  .clk           (),
  .reset_n       (),
  .enable        (),
  .up            (),
  .down          (),
  .count_out     ());

//instantiate the ram here. 
//at least two ways to do it. 

//instantaiate logic_blk here


//--------------------------------------------------------------------
endmodule

