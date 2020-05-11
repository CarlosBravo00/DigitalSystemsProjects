LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY testRelojDigital  IS
END testRelojDigital ;
 
ARCHITECTURE behavior OF testRelojDigital  IS 
 
    COMPONENT contador
    PORT(
     CLK : in  BIT;
     M_unid : out  BIT_VECTOR(3 downto 0);
     M_dece : out  BIT_VECTOR(3 downto 0);
     H_unid : out  BIT_VECTOR(3 downto 0):= "0001";
     H_dece : out  BIT);
    END COMPONENT;
    
   signal CLK : Bit := '0';
   signal M_unid : Bit_vector(3 downto 0) := "0000";
   signal M_dece : Bit_vector(3 downto 0) := "0000";
   signal H_unid : Bit_vector(3 downto 0) := "0001";
   signal H_dece : BIT := '0';
   constant CLK_period : time := 10 ns;
 
BEGIN
   uut: contador PORT MAP (
          CLK => CLK,
          M_unid => M_unid,
          M_dece => M_dece,
          H_unid => H_unid,
          H_dece => H_dece
        );

 CLK_process :process
        begin
             CLK <= '0';
             wait for CLK_period/2;
             CLK <= '1';
             wait for CLK_period/2;
        end process;


END;
