library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;

entity ALU is
  port(
        A, B    : in std_logic_vector(7 downto 0);  
        ALU_Sel : in std_logic_vector(2 downto 0);   
        NZVC    : out std_logic_vector(3 downto 0);  
        Result  : out std_logic_vector(7 downto 0)  
    );  
end ALU;

architecture Behavioral of ALU is
  
  signal alu_result : std_logic_vector(7 downto 0);
  signal N_flag, Z_flag, V_flag, C_flag : std_logic;

begin

  ALU_PROCESS : process (A, B, ALU_Sel)
    variable Sum_uns : std_logic_vector(8 downto 0);
    variable Diff_uns : unsigned(8 downto 0);
    
  begin
    -- ADDITION (ALU_Sel = "000")
    if (ALU_Sel = "000") then
        -- Sum Calculation
        Sum_uns :=  std_logic_vector(signed('0' & A) + signed('0' & B));
        alu_result <= (Sum_uns(7 downto 0));
        
        -- Negative Flag (N)
        N_flag <= alu_result(7);
        
        -- Zero Flag (Z)
        if (alu_result = x"00") then
            Z_flag <= '1';
        else
            Z_flag <= '0';
        end if;
        
        -- Overflow Flag (V)
        if ((A(7) = '0' and B(7) = '0' and alu_result(7) = '1') or
            (A(7) = '1' and B(7) = '1' and alu_result(7) = '0')) then
            V_flag <= '1';
        else
            V_flag <= '0';
        end if;
        
        -- Carry Flag (C)
        C_flag <= Sum_uns(8);

--NZVC <= N_flag & Z_flag & V_flag & C_flag;

    -- SUBTRACTION (ALU_Sel = "001")
    elsif (ALU_Sel = "001") then
        -- Difference Calculation
        Diff_uns := unsigned('0' & A) - unsigned('0' & B);
        alu_result <= std_logic_vector(Diff_uns(7 downto 0));
        
        -- Negative Flag (N)
        N_flag <= alu_result(7);
        
        -- Zero Flag (Z)
        if (alu_result = x"00") then
            Z_flag <= '1';
        else
            Z_flag <= '0';
        end if;
        
        -- Overflow Flag (V)
        if ((A(7) = '0' and B(7) = '1' and alu_result(7) = '1') or
            (A(7) = '1' and B(7) = '0' and alu_result(7) = '0')) then
            V_flag <= '1';
        else
            V_flag <= '0';
        end if;
        
        -- Carry Flag (C)
        C_flag <= Diff_uns(8);

--NZVC <= N_flag & Z_flag & V_flag & C_flag;

    -- AND Operation (ALU_Sel = "010")
    elsif (ALU_Sel = "010") then
        alu_result <= A and B;
        
        -- Negative Flag (N)
        N_flag <= alu_result(7);
        
        -- Zero Flag (Z)
        if (alu_result = x"00") then
            Z_flag <= '1';
        else
            Z_flag <= '0';
        end if;
        
        -- Overflow Flag (V) - Not applicable for logical operations
        V_flag <= '0';
        
        -- Carry Flag (C) - Not applicable for logical operations
        C_flag <= '0';

--NZVC <= N_flag & Z_flag & V_flag & C_flag;

    -- OR Operation (ALU_Sel = "011")
    elsif (ALU_Sel = "011") then
        alu_result <= A or B;
        
        -- Negative Flag (N)
        N_flag <= alu_result(7);
        
        -- Zero Flag (Z)
        if (alu_result = x"00") then
            Z_flag <= '1';
        else
            Z_flag <= '0';
        end if;
        
        -- Overflow Flag (V) - Not applicable for logical operations
        V_flag <= '0';
        
        -- Carry Flag (C) - Not applicable for logical operations
        C_flag <= '0';

--NZVC <= N_flag & Z_flag & V_flag & C_flag;

    -- XOR Operation (ALU_Sel = "100")
    elsif (ALU_Sel = "100") then
        alu_result <= A xor B;
        
        -- Negative Flag (N)
        N_flag <= alu_result(7);
        
        -- Zero Flag (Z)
        if (alu_result = x"00") then
            Z_flag <= '1';
        else
            Z_flag <= '0';
        end if;
        
        -- Overflow Flag (V) - Not applicable for logical operations
        V_flag <= '0';
        
        -- Carry Flag (C) - Not applicable for logical operations
        C_flag <= '0';

--NZVC <= N_flag & Z_flag & V_flag & C_flag;

    -- Logical Shift Left (ALU_Sel = "101")
    elsif (ALU_Sel = "101") then
        alu_result <= A(6 downto 0) & '0';
        
        -- Negative Flag (N)
        N_flag <= alu_result(7);
        
        -- Zero Flag (Z)
        if (alu_result = x"00") then
            Z_flag <= '1';
        else
            Z_flag <= '0';
        end if;
        
        -- Carry Flag (C) - Set if MSB is shifted out
        C_flag <= A(7);
        
        -- Overflow Flag (V) - Not applicable for shifts
        V_flag <= '0';

--NZVC <= N_flag & Z_flag & V_flag & C_flag;

    -- Logical Shift Right (ALU_Sel = "110")
    elsif (ALU_Sel = "110") then
        alu_result <= '0' & A(7 downto 1);
        
        -- Negative Flag (N)
        N_flag <= alu_result(7);
        
        -- Zero Flag (Z)
        if (alu_result = x"00") then
            Z_flag <= '1';
        else
            Z_flag <= '0';
        end if;
        
        -- Carry Flag (C) - Set if LSB is shifted out
        C_flag <= A(0);
        
        -- Overflow Flag (V) - Not applicable for shifts
        V_flag <= '0';

--NZVC <= N_flag & Z_flag & V_flag & C_flag;

    else
        -- Default Case: Set result to zero
        alu_result <= (others => '0');
        N_flag <= '0';
        Z_flag <= '1'; -- Zero by default
        V_flag <= '0';
        C_flag <= '0';
    end if;

    
   

  
   
    -- Drive final result and NZVC flags
      end process;

 
    

    NZVC <= N_flag & Z_flag & V_flag & C_flag;
    Result <= alu_result;


end Behavioral;

