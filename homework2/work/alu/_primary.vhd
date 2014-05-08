library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        in_a            : in     vl_logic_vector(7 downto 0);
        in_b            : in     vl_logic_vector(7 downto 0);
        opcode          : in     vl_logic_vector(3 downto 0);
        alu_out         : out    vl_logic_vector(7 downto 0);
        alu_zero        : out    vl_logic;
        alu_carry       : out    vl_logic
    );
end alu;
