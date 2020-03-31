LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY testcontador IS
END testcontador;
 
ARCHITECTURE behavior OF testcontador IS 
 
    COMPONENT contador
    PORT(
         CLK : IN  std_logic;
         unid : OUT  std_logic_vector(3 downto 0);
         dec : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    
   signal CLK : std_logic := '0';
   signal unid : std_logic_vector(3 downto 0);
   signal dec : std_logic_vector(3 downto 0);

   constant CLK_period : time := 1 ns;
 
BEGIN
   uut: contador PORT MAP (
          CLK => CLK,
          unid => unid,
          dec => dec
        );

   CLK_process :process
   begin
      CLK <= '0';
      wait for CLK_period/4;
		CLK <= '1';
      wait for CLK_period/4;
      CLK <= '0';
		wait for CLK_period/4;
		CLK <= '1';
      wait for CLK_period/4;
      CLK <= '0';
      wait for CLK_period/4;
		CLK <= '1';
      wait for CLK_period/4;
      CLK <= '0';
		wait for CLK_period/4;
		CLK <= '1';
      wait for CLK_period/4;
      CLK <= '0';
      wait for CLK_period/4;
		CLK <= '1';
      wait for CLK_period/4;
      CLK <= '0';
		wait for CLK_period/4;
		CLK <= '1';
      wait for CLK_period/4;
      CLK <= '0';
      wait for CLK_period/4;
		CLK <= '1';
      wait for CLK_period/4;
      CLK <= '0';
		wait for CLK_period/4;
		CLK <= '1';
      wait for CLK_period/4;
      CLK <= '0';
      wait for CLK_period/4;
		CLK <= '1';
      wait for CLK_period/4;
      CLK <= '0';
		wait for CLK_period/4;
		CLK <= '1';
      wait for CLK_period/4;
      CLK <= '0';
      wait;
   end process;

   stim_proc: process
   begin		
      wait;
   end process;

END;
