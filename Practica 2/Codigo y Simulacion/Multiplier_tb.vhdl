LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
  
    COMPONENT multiplier
    PORT(
      	A : IN BIT_VECTOR(3 DOWNTO 0);
  	B : IN BIT_VECTOR(3 DOWNTO 0); 
    	Z : OUT BIT_VECTOR(8 DOWNTO 0); 
        );
    END COMPONENT;

   --Inputs
   signal A : BIT_VECTOR(3 DOWNTO 0):= (others => '0');
   signal B : BIT_VECTOR(3 DOWNTO 0):= (others => '0');

 	--Outputs
   singal Z : BIT_VECTOR(8 DOWNTO := (others => '0');
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: addsub PORT MAP (
            A => A,
            B => B,
            Z => Z,
        );

   -- Stimulus process
   stim_proc: process
   begin		
   A <= "0000";
   B <= "0000";

   -- 2 casos de suma de números positivos
        wait for 10 ns;
        A <= "1000"; 
        B <= "0100"; 

        wait for 10 ns;	
        A <= "1010"; 
        B <= "0001"; 
    
        wait;
   end process;
END;
