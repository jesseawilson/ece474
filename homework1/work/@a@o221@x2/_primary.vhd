library verilog;
use verilog.vl_types.all;
entity AO221X2 is
    port(
        IN1             : in     vl_logic;
        IN2             : in     vl_logic;
        IN3             : in     vl_logic;
        IN4             : in     vl_logic;
        IN5             : in     vl_logic;
        Q               : out    vl_logic
    );
end AO221X2;
