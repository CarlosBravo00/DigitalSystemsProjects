--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:26:45 10/04/2019
-- Design Name:   
-- Module Name:   /home/ise/Tare04/test3.vhd
-- Project Name:  Tare04
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Tarea04
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test3 IS
END test3;
 
ARCHITECTURE behavior OF test3 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Tarea04
    PORT(
         Capuchino : IN  std_logic;
         Moka : IN  std_logic;
         Expresso : IN  std_logic;
         Americano : IN  std_logic;
         Azucar : IN  std_logic;
         SustitutoA : IN  std_logic;
         Crema : IN  std_logic;
         Leche : IN  std_logic;
         price : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Capuchino : std_logic := '0';
   signal Moka : std_logic := '0';
   signal Expresso : std_logic := '0';
   signal Americano : std_logic := '0';
   signal Azucar : std_logic := '0';
   signal SustitutoA : std_logic := '0';
   signal Crema : std_logic := '0';
   signal Leche : std_logic := '0';

 	--Outputs
   signal price : std_logic_vector(6 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Tarea04 PORT MAP (
          Capuchino => Capuchino,
          Moka => Moka,
          Expresso => Expresso,
          Americano => Americano,
          Azucar => Azucar,
          SustitutoA => SustitutoA,
          Crema => Crema,
          Leche => Leche,
          price => price
        );

   -- Stimulus process
   stim_proc: process
   begin		
			Capuchino <= '1';
			Moka <= '0';
			Expresso <= '0';
			Americano <= '0';
   			
         Azucar <= '0';
         SustitutoA <= '1';
         Crema <= '0';
         Leche <= '1';
			
      wait for 100 ns;	
			Capuchino <= '0';
			Moka <= '1';
			Expresso <= '0';
			Americano <= '0';
   			
         Azucar <= '1';
         SustitutoA <= '0';
         Crema <= '1';
         Leche <= '0';
			
		wait for 100 ns;	
			Capuchino <= '0';
			Moka <= '0';
			Expresso <= '1';
			Americano <= '0';
   			
         Azucar <= '0';
         SustitutoA <= '1';
         Crema <= '0';
         Leche <= '0';
		
	
		wait for 100 ns;	
			Capuchino <= '0';
			Moka <= '0';
			Expresso <= '0';
			Americano <= '1';
   			
         Azucar <= '0';
         SustitutoA <= '0';
         Crema <= '0';
         Leche <= '1';
			
	
		wait for 100 ns;	
			Capuchino <= '1';
			Moka <= '0';
			Expresso <= '1';
			Americano <= '0';
   			
         Azucar <= '0';
         SustitutoA <= '0';
         Crema <= '0';
         Leche <= '0';

      wait;
   end process;

END;
