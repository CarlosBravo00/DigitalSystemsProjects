--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TESTtoch IS
END TESTtoch;
 
ARCHITECTURE behavior OF TESTtoch IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Tochito
    PORT(
         Start : IN  std_logic;
         Stop : IN  std_logic;
         clk : IN  std_logic;
         reset : IN  std_logic;
         B1 : IN  std_logic;
         B3 : IN  std_logic;
         B6 : IN  std_logic;
         timer : OUT  std_logic_vector(4 downto 0);
         puntos : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Start : std_logic := '0';
   signal Stop : std_logic := '0';
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal B1 : std_logic := '0';
   signal B3 : std_logic := '0';
   signal B6 : std_logic := '0';

 	--Outputs
   signal timer : std_logic_vector(4 downto 0);
   signal puntos : std_logic_vector(5 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Tochito PORT MAP (
          Start => Start,
          Stop => Stop,
          clk => clk,
          reset => reset,
          B1 => B1,
          B3 => B3,
          B6 => B6,
          timer => timer,
          puntos => puntos
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
  begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		wait for clk_period*10;
			Start <= '1';
		wait for clk_period/2;
			Start <= '0';
			
		wait for clk_period;
			B1 <= '1';
		wait for clk_period;
			B1 <= '0';
			
			wait for clk_period;
			B3 <= '1';
		wait for clk_period;
			B3 <= '0';
			
	wait for clk_period*3;
			B6 <= '1';
		wait for clk_period;
			B6 <= '0';		
			
		wait for clk_period*10;
		  Stop <= '1';
		wait for clk_period;
		  Stop <= '0';
		  
		wait for clk_period;
		  Reset <= '1';
		wait for clk_period;
		  Reset<= '0';	
		  wait for 100 ns;
      wait;
   end process;

END;
