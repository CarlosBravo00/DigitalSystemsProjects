library ieee;
use ieee.std_logic_1164.all;

entity counter8bits  is
    Port ( CLK : in  BIT;
	        ENABLE : in BIT :='1'; -- 0 = ENABLE , 1 = CONTINUE 
            UD : in BIT;
           Q : out  BIT_VECTOR(7 downto 0));
end counter8bits;

architecture Behavioral of counter8bits is
    COMPONENT counter
    PORT(
          CLK : in  BIT;
          enable : in BIT;
          UD : in BIT;
          Q : out  BIT_VECTOR(3 downto 0));
    END COMPONENT;
signal EDEC : BIT := '0';
signal QS : BIT_VECTOR(7 downto 0) := "00000000";
begin
    EDEC <=  (QS(0) and (NOT QS(1)) AND (NOT QS(2)) AND QS(3) and (NOT UD))
             OR ((NOT QS(0)) AND (NOT QS(1)) AND (NOT QS(2)) AND (NOT QS(3)) AND UD);

C0 : counter port map(clk,ENABLE,UD,QS(3 downto 0));   
C1:  counter port map(clk,EDEC,UD,QS(7 downto 4));
 
Q<= QS;

end Behavioral;

