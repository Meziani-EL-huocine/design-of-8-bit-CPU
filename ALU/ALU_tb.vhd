library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;

entity ALU_tb is
    -- No ports for a testbench
end ALU_tb;

architecture Behavioral of ALU_tb is

    -- Component declaration for the ALU
    component ALU is
        port(
            A, B    : in std_logic_vector(7 downto 0);
            ALU_Sel : in std_logic_vector(2 downto 0);
            NZVC    : out std_logic_vector(3 downto 0);
            Result  : out std_logic_vector(7 downto 0)
        );
    end component;

    -- Test signals
    signal A, B : std_logic_vector(7 downto 0);
    signal ALU_Sel : std_logic_vector(2 downto 0);
    signal NZVC : std_logic_vector(3 downto 0);
    signal Result : std_logic_vector(7 downto 0);

begin

    -- Instantiate the ALU
    uut: ALU
        port map (
            A => A,
            B => B,
            ALU_Sel => ALU_Sel,
            NZVC => NZVC,
            Result => Result
        );

    -- Test process
    process
    begin
       
       
      
       ALU_sel <= "000";
       wait for 10 ns;
        
       for i in 0 to 6 loop 
            A <= "10010010";  -- A = 1
            B <= "11111111";  -- B = 1
           ALU_sel <= std_logic_vector(to_unsigned(i, 3));
           wait for 10 ns;
        end loop;

    end process;

end Behavioral;

