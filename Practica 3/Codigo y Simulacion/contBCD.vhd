library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;


entity contBCD is
    Port ( enable  : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (3 downto 0));
end contBCD;

architecture Funcional of contBCD is
signal cont : std_logic_vector (3 downto 0):="0000";
begin
 process(clk,reset,enable)
 begin
 
if reset = '1' then
	cont <= "0000";
	
	else if (clk = '1') and (clk' event) and (enable = '1') then
		cont <= cont + 1;
	else null;
	end if;
	end if;
	
 end process;
	
 s <= cont;
	
end Funcional;

