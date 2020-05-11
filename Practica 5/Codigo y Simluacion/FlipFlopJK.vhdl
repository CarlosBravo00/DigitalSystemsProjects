library ieee;
use ieee.std_logic_1164.all;

entity FlipFlopJK is
    Port ( 
        clk : in BIT;
        enable : in BIT;
        J  : in  BIT;
        K : in  BIT;
        Q : out  BIT;
        QN : out  BIT);
end FlipFlopJK;

architecture Funcional of FlipFlopJK is
    signal Qi : BIT:= '0';
begin
 process(clk,J,K)
 begin

    if clk = '1' and clk'event and enable = '1' then 
       if( j = '0') and (k = '1') then Qi<='0';
       elsif (j = '1') and (K = '0') then Qi<='1';
       elsif ( j = '1') and (k = '1') then Qi<= not Qi;
       else Qi <= Qi;
    end if;
    else null;
    end if;

 end process;
    Q <= Qi;
	QN <= NOT Qi;
end Funcional;

