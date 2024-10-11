library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_unit_tb is
-- Testbench has no ports
end control_unit_tb;

architecture behavior of control_unit_tb is

    -- Signals to connect to the DUT (Device Under Test)
    signal clk, reset : std_logic;
    signal IR_Load : std_logic;
    signal IR : std_logic_vector(7 downto 0);
    signal MAR_Load, PC_Load, PC_Inc : std_logic;
    signal A_Load, B_Load : std_logic;
    signal ALU_Sel : std_logic_vector(2 downto 0);
    signal CCR_Result : std_logic_vector(3 downto 0);
    signal CCR_Load : std_logic;
    signal Bus2_Sel, Bus1_Sel : std_logic_vector(1 downto 0);
    signal wr : std_logic;
    
    -- Clock period
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the control unit
    uut: entity work.control_unit
        port map (
            clk => clk,
            reset => reset,
            IR_Load => IR_Load,
            IR => IR,
            MAR_Load => MAR_Load,
            PC_Load => PC_Load,
            PC_Inc => PC_Inc,
            A_Load => A_Load,
            B_Load => B_Load,
            ALU_Sel => ALU_Sel,
            CCR_Result => CCR_Result,
            CCR_Load => CCR_Load,
            Bus2_Sel => Bus2_Sel,
            Bus1_Sel => Bus1_Sel,
            wr => wr
        );

    -- Clock generation process
    clk_process: process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initialize signals
        reset <= '0';
        IR <= (others => '0');
        CCR_Result <= (others => '0');
        wait for 10 ns;
        
        -- Apply reset
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        wait for 20 ns;

        -- Test LDA_IMM instruction
        IR <= x"86";  -- LDA_IMM instruction
        wait for 40 ns;
        
        -- Test STA_DIR instruction
        IR <= x"96";  -- STA_DIR instruction
        wait for 40 ns;

        -- Test ADD_AB instruction
        IR <= x"42";  -- ADD_AB instruction
        wait for 40 ns;

        -- Add more tests as necessary
        wait;

    end process;

end architecture;

