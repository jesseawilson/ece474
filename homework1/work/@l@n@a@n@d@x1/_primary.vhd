library verilog;
use verilog.vl_types.all;
entity LNANDX1 is
    port(
        SIN             : in     vl_logic;
        RIN             : in     vl_logic;
        Q               : out    vl_logic;
        QN              : out    vl_logic
    );
end LNANDX1;
