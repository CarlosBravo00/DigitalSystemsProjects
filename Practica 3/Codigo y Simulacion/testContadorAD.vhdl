LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY testcontadorAD  IS
END testcontadorAD ;
 
ARCHITECTURE behavior OF testcontadorAD  IS 
 
    COMPONENT contador
    PORT(
         CLK : IN  Bit;
         X : in Bit;
         unid : OUT  Bit_vector(3 downto 0);
         dec : OUT  Bit_vector(3 downto 0)
        );
    END COMPONENT;
    
   signal CLK : Bit := '0';
   signal X :  Bit := '0';
   signal unid : Bit_vector(3 downto 0) := "0000";
   signal dec : Bit_vector(3 downto 0):= "0000";

   constant CLK_period : time := 10 ns;
 
BEGIN
   uut: contador PORT MAP (
          CLK => CLK,
          X => X,
          unid => unid,
          dec => dec
        );

 CLK_process :process
        begin
             CLK <= '0';
             wait for CLK_period/2;
             CLK <= '1';
             wait for CLK_period/2;
        end process;

        X <= '1' after 500 ns;

END;
