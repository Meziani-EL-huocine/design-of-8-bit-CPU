library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cpu_tb is
end cpu_tb;

architecture Behavioral of cpu_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component cpu is
        port(
            clk         : in std_logic;
            reset       : in std_logic;
            address     : out std_logic_vector(7 downto 0);
            from_memory : in std_logic_vector(7 downto 0);
            wr          : out std_logic;
            to_memory   : out std_logic_vector(7 downto 0)
        );
    end component;

    -- Clock and reset signals
    signal clk         : std_logic := '0';
    signal reset       : std_logic := '0';
    signal address     : std_logic_vector(7 downto 0);
    signal from_memory : std_logic_vector(7 downto 0) := (others => '0');
    signal wr          : std_logic;
    signal to_memory   : std_logic_vector(7 downto 0);

    -- Clock period definition
    constant clk_period : time := 20 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: cpu port map (
        clk         => clk,
        reset       => reset,
        address     => address,
        from_memory => from_memory,
        wr          => wr,
        to_memory   => to_memory
    );

    -- Clock process
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    -- Stimulus process for various test cases
    stimulus: process
    begin
        -- Test Case 1: Reset CPU
        reset <= '1';
        wait for 40 ns;  -- Keep reset active for a short period
        reset <= '0';
        wait for 40 ns;
        
        -- Test Case 2: Instruction Fetch (simulate fetching from memory)
        from_memory <= "11001010";  -- Example instruction
        wait for 100 ns;
        
        -- Check Program Counter Increment
        -- Simulate the next memory instruction after fetching an instruction
        from_memory <= "10101010";  -- Another instruction (can be branch/jump, etc.)
        wait for 100 ns;
        
        -- Test Case 3: ALU Operation (Addition)
        -- Simulate instructions for ALU operation (e.g., adding two numbers)
        from_memory <= "00000001";  -- Load value into register A
        wait for 100 ns;
        from_memory <= "00000010";  -- Load value into register B
        wait for 100 ns;
        
        -- Simulate ALU addition operation (check ALU_Sel signals for proper function)
        from_memory <= "00110000";  -- Trigger ALU add operation (opcode for add)
        wait for 100 ns;

        -- Test Case 4: Write to Memory
        from_memory <= "00000111";  -- Simulate a value to write to memory
        wait for 100 ns;
        
        -- Test Case 5: Read from Memory
        from_memory <= "01010101";  -- Simulate reading a value from memory
        wait for 100 ns;

        -- Test Case 6: Branch/Jump Instruction
        from_memory <= "11111111";  -- Example branch/jump instruction
        wait for 100 ns;

        -- Test Case 7: Test Reset Again (ensure CPU resets correctly)
        reset <= '1';
        wait for 40 ns;
        reset <= '0';
        wait for 100 ns;

        -- Additional Test Case: More ALU Operations
        -- Simulate an ALU subtraction
        from_memory <= "00000100";  -- Load value into register A
        wait for 100 ns;
        from_memory <= "00000001";  -- Load value into register B
        wait for 100 ns;
        
        from_memory <= "00110001";  -- Trigger ALU subtract operation (opcode for sub)
        wait for 100 ns;

        -- Simulate different logic operations (AND, OR)
        from_memory <= "00110110";  -- Trigger ALU AND operation (opcode for AND)
        wait for 100 ns;
        from_memory <= "00110101";  -- Trigger ALU OR operation (opcode for OR)
        wait for 100 ns;

        -- End of simulation
        wait;
    end process;

end Behavioral;

