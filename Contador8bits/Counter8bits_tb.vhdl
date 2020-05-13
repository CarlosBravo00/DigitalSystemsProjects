LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY counter8bits_tb  IS
END counter8bits_tb ;
 
ARCHITECTURE behavior OF counter8bits_tb  IS 
 
    COMPONENT counter8bits
           PORT(
          CLK : in  BIT;
          HOLD : in BIT;
          UD : in BIT;
          Q : out  BIT_VECTOR(7 downto 0));
    END COMPONENT;
    
   signal CLK : Bit := '0';
   signal HOLD :  Bit := '0';
   signal UD :  Bit := '0';
   signal Q : Bit_vector(7 downto 0) := "00000000";

   constant CLK_period : time := 10 ns;
 
BEGIN
   uut: counter8bits PORT MAP (
          CLK => CLK,
          HOLD => HOLD,
          UD => UD,
          Q => Q
        );

 CLK_process :process
        begin
             CLK <= '0';
             wait for CLK_period/2;
             CLK <= '1';
             wait for CLK_period/2;
        end process;

        UD <= '1' after 500 ns;
        HOLD <= '1' after 50 ns, '0' after 1000 ns;

END;
