library verilog;
use verilog.vl_types.all;
entity alu_DW01_addsub_0 is
    port(
        A               : in     vl_logic_vector(8 downto 0);
        B               : in     vl_logic_vector(8 downto 0);
        CI              : in     vl_logic;
        ADD_SUB         : in     vl_logic;
        SUM             : out    vl_logic_vector(8 downto 0);
        CO              : out    vl_logic
    );
end alu_DW01_addsub_0;
