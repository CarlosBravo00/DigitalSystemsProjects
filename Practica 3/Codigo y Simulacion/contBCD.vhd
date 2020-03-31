library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use ieee.std_logic_unsigned.all;


entity contBCD is
    Port ( enable  : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (3 downto 0));
end contBCD;

architecture Funcional of contBCD is
signal cont : integer:= 0;
begin
 process(clk,reset,enable)
 begin
 
if reset = '1' then
	cont <= 0;
	
	else if (clk = '1') and (clk' event) and (enable = '1') then
		cont <= cont + 1;
	else null;
	end if;
	end if;
	
 end process;
	
 s <=  "0000" when (cont=0)  else
 "0001" when (cont=1)  else
 "0010" when (cont=2)  else
 "0011" when (cont=3)  else
 "0100" when (cont=4)  else
 "0101" when (cont=5)  else
 "0110" when (cont=6)  else
 "0111" when (cont=7)  else
 "1000" when (cont=8)  else
 "1001" when (cont=9)  else
 "1010" when (cont=10)  else
 "0000";

	
end Funcional;

