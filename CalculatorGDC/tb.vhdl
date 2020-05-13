LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    COMPONENT controller is 
    port(
        clk : in std_logic;
        x_i , y_i : in std_logic_vector(3 downto 0);
        GO_i : in std_logic;
        data_o : out std_logic_Vector(3 downto 0)
    );
end COMPONENT;
    
   signal CLK : std_logic := '0';
   signal GO_i:  std_logic := '0';
   signal x_i : std_logic_vector(3 downto 0) := "0000";
   signal y_i : std_logic_vector(3 downto 0):= "0000";
   signal data_o : std_logic_vector(3 downto 0):= "0000";

   constant CLK_period : time := 10 ns;
 
BEGIN
   uut: controller PORT MAP (
          CLK => CLK,
          GO_i => GO_i,
          x_i => x_i,
          y_i => y_i,
          data_o => data_o
        );

 CLK_process :process
        begin
             CLK <= '0';
             wait for CLK_period/2;
             CLK <= '1';
             wait for CLK_period/2;
        end process;

        GO_i <= '1' after 50 ns;
        x_i <= "0010";
        y_i <= "0100";

END;
