library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_tb is
-- Testbench has no ports
end ALU_tb;

architecture Behavioral of ALU_tb is

  -- Component declaration for the ALU
  component ALU
    port(
      A       : in  std_logic_vector(7 downto 0);  
      B       : in  std_logic_vector(7 downto 0);  
      ALU_Sel : in  std_logic_vector(2 downto 0);   
      NZVC    : out std_logic_vector(3 downto 0);  
      Result  : out std_logic_vector(7 downto 0)
    );
  end component;

  -- Test signals
  signal A, B    : std_logic_vector(7 downto 0);
  signal ALU_Sel : std_logic_vector(2 downto 0);
  signal NZVC    : std_logic_vector(3 downto 0);
  signal Result  : std_logic_vector(7 downto 0);

begin

  -- Instantiate the ALU
  uut: ALU
    port map(
      A => A,
      B => B,
      ALU_Sel => ALU_Sel,
      NZVC => NZVC,
      Result => Result
    );

  -- Stimulus process to apply different values to A, B, and ALU_Sel
  stim_proc: process
    variable A_int, B_int : integer;
    variable ALU_Sel_int  : integer;
  begin
    -- Iterate over all possible values for ALU_Sel (0 to 7)
    for ALU_Sel_int in 0 to 7 loop
      ALU_Sel <= std_logic_vector(to_unsigned(ALU_Sel_int, 3)); -- Set ALU operation

      -- Iterate over all possible values for A (0 to 255)
      for A_int in 0 to 3 loop
        A <= std_logic_vector(to_unsigned(A_int, 8)); -- Set A input

        -- Iterate over all possible values for B (0 to 255)
        for B_int in 0 to 4 loop
          B <= std_logic_vector(to_unsigned(B_int, 8)); -- Set B input

          -- Wait for 10ns before testing the next combination
          wait for 10 ns;
        end loop;
      end loop;
    end loop;

    -- Finish the simulation after all cases are tested
    wait;
  end process;

end Behavioral;

