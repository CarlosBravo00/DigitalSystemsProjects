
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY testbit8 IS
END testbit8;
 
ARCHITECTURE behavior OF testbit8 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT bit8
    PORT(
         S : IN  std_logic;
         Clk : IN  std_logic;
         P : OUT  std_logic_vector(7 downto 0);
         Done : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal S : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal P : std_logic_vector(7 downto 0);
   signal Done : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: bit8 PORT MAP (
          S => S,
          Clk => Clk,
          P => P,
          Done => Done
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
			s<='1';	
      wait for Clk_period;
			s<='0';	
		wait for Clk_period;
			s<='1';	
		wait for Clk_period;
			s<='0';	
		wait for Clk_period;
			s<='1';	
		wait for Clk_period;
			s<='0';	
		wait for Clk_period;
			s<='1';	
		wait for Clk_period;
			s<='0';	
			
		wait for Clk_period;
			s<='1';	
     wait for Clk_period;
			s<='1';	
		wait for Clk_period;
			s<='1';	
		wait for Clk_period;
			s<='0';	
		wait for Clk_period;
			s<='0';	
		wait for Clk_period;
			s<='0';	
		wait for Clk_period;
			s<='0';	
		wait for Clk_period;
			s<='1';	

      -- insert stimulus here 

      wait;
   end process;

END;
