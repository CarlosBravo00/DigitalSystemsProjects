library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;


entity Tochito is
    Port ( Start : in  STD_LOGIC;
           Stop : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
	B1,B3,B6 : in STD_LOGIC;
           timer : out  STD_LOGIC_VECTOR (4 downto 0);
	puntos : out STD_LOGIC_VECTOR (5 downto 0));

end Tochito;

architecture Funcional of  Tochito is
signal cont : std_logic_vector (4 downto 0):="00000";
signal temp : std_logic_vector (5 downto 0):="000000";
Signal Q : STD_LOGIC := '0';

begin

Q <= (start and (not q)) or ((not stop) and q);

 process(clk,reset,Q,B1,B3,B6)
 begin
 if (clk = '1') and (clk' event) and ((B1 = '1') OR (B3 = '1') OR (B6 = '1')) then

	if (B1 = '1') then 
	 temp <= temp + "000001";
	else null;
	end if;
	
	if( B3 = '1') then
	temp <= temp + "000011";
	else null;
	end if;
	
	if (B6 = '1') then
	temp <= temp + "000110";
	else null;
	end if;
	
else null;
end if;

if reset = '1' then
	cont <= "00000";
	
	else if (clk = '1') and (clk' event) and (Q = '1') and (cont < "11111") then
		cont <= cont + 1;
	else null;
	end if;
	end if;
	
 end process;
	
 timer <= cont;
puntos <= temp;
	
end Funcional;
