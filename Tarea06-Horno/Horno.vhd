library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity Horno is
    Port ( clk : in  STD_LOGIC;
			  plus10 : in STD_LOGIC;
		    Switchs : in STD_LOGIC_VECTOR (9 downto 0);
			inTime : in  STD_LOGIC;
           Start : in  STD_LOGIC;
           Stop : in  STD_LOGIC;
			HornoExit : out STD_LOGIC;
			LEDtimer : out STD_LOGIC_VECTOR (9 downto 0));		  
end Horno;

architecture Funcional of Horno is
signal cont : std_logic_vector (9 downto 0):= "0000000000";
Signal Q : STD_LOGIC := '0';

begin

Q <= (start and (not q)) or ((not stop) and q);

 process(clk,Q,plus10,inTime )
 begin
		if (inTime = '1') then
		cont <= Switchs;
		else null;
		end if;
		
		if (plus10 = '1') then
		cont <= cont + "0000001010";
		else null;
		end if;
		
if (clk = '1') and (clk' event) and
 (Q = '1') and (cont > "0000000000") then
 
	cont <= cont - 1;

	else null;
	end if;
	
 end process;
	LEDtimer <= cont;
 hornoExit <= '0' when (cont <= "0000000000") or (Q = '0') else '1';
	
end Funcional;
