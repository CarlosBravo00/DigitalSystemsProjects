--------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test01 IS
END test01;
 
ARCHITECTURE behavior OF test01 IS 
	
    COMPONENT Horno
    PORT(
         clk : IN  std_logic;
         plus10 : IN  std_logic;
         Switchs : IN  std_logic_vector(9 downto 0);
         inTime : IN  std_logic;
         Start : IN  std_logic;
         Stop : IN  std_logic;
			LEDtimer : out STD_LOGIC_VECTOR (9 downto 0);
         HornoExit : OUT  std_logic
			);
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal plus10 : std_logic := '0';
   signal Switchs : std_logic_vector(9 downto 0) := (others => '0');
   signal inTime : std_logic := '0';
   signal Start : std_logic := '0';
   signal Stop : std_logic := '0';

 	--Outputs
   signal HornoExit : std_logic;
	signal LEDtimer : std_logic_vector(9 downto 0) := (others => '0');

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Horno PORT MAP (
          clk => clk,
          plus10 => plus10,
          Switchs => Switchs,
          inTime => inTime,
          Start => Start,
          Stop => Stop,
          HornoExit => HornoExit,
			 LEDtimer => LEDtimer
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
  Switchs <= "0000010000";	 
		wait for clk_period*10;
			inTime <= '1';
			Start <= '1';
          Stop <= '0';
		wait for clk_period/2;
			inTime <= '0';
			Start <= '0';
		wait for clk_period*10;
		  Stop <= '1';
			plus10 <= '1';
		wait for clk_period;
		  Stop <= '0';
			plus10 <= '0';
		wait for clk_period;
			Start <= '1';
		wait for clk_period/2;
			Start <= '0';
		wait for 100 ns;
      wait;
   end process;

END;
