LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
	
    COMPONENT BCDto4Display
    Port ( clk : in  STD_LOGIC;
    BCD_in : in STD_LOGIC_VECTOR (3 downto 0);
    controlador : out  STD_LOGIC_VECTOR (3 downto 0);
    D1 : out STD_LOGIC_VECTOR (6 downto 0);
    D2 : out STD_LOGIC_VECTOR (6 downto 0);
    D3 : out STD_LOGIC_VECTOR (6 downto 0);
    D4 : out STD_LOGIC_VECTOR (6 downto 0));
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal BCD_in : STD_LOGIC_VECTOR (3 downto 0):= (others => '0');

     --Outputs
    signal controlador :  STD_LOGIC_VECTOR (3 downto 0):= (others => '0');
    signal D1 : STD_LOGIC_VECTOR (6 downto 0):= (others => '0');
    signal D2 : STD_LOGIC_VECTOR (6 downto 0):= (others => '0');
    signal D3 : STD_LOGIC_VECTOR (6 downto 0):= (others => '0');
    signal D4 : STD_LOGIC_VECTOR (6 downto 0):= (others => '0');

   -- Clock period definitions
   constant clk_period : time := 16 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BCDto4Display PORT MAP (
          clk => clk,
          BCD_in => BCD_in,
          controlador => controlador,
          D1 => D1,
          D2 => D2,
          D3 => D3,
          D4 => D4
        );

   CLK_process :process
   begin
    BCD_in <="0000";
      CLK <= '0';
      wait for CLK_period/2;
		CLK <= '1';
      wait for CLK_period/2;
      CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
      wait for CLK_period/2;

      BCD_in <="0010";
      CLK <= '0';
      wait for CLK_period/2;
		CLK <= '1';
      wait for CLK_period/2;
      CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
      wait for CLK_period/2;
      CLK <= '0';
      wait for CLK_period/2;
		CLK <= '1';
      wait for CLK_period/2;
      
      BCD_in <="0101";
      CLK <= '0';
        wait for CLK_period/2;
		CLK <= '1';
      wait for CLK_period/2;
      CLK <= '0';
      wait for CLK_period/2;
		CLK <= '1';
      wait for CLK_period/2;
      BCD_in <="0111";
      CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
      wait for CLK_period/2;
      CLK <= '0';
      wait for CLK_period/2;
		CLK <= '1';
      wait for CLK_period/2;
      CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
      wait for CLK_period/2;
      CLK <= '0';
      wait;
   end process;

   stim_proc: process
   begin		
      wait;
   end process;

END;