library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity bit8  is
Port(	  S: in std_logic;
	  Clk: in std_logic;
 	
	  P: out std_logic_vector(7 downto 0);
	  Done: out std_logic);
end bit8;

architecture Behavioral of bit8 is
signal state: integer := 0;
signal scancode: std_logic_vector(7 downto 0);
signal cont: std_logic_vector(3 downto 0) := "0000";
begin
	process(Clk)
	begin

	if(Clk'event and Clk='1') then
	case state is 
		when 0 => 
			cont <= "0000";
			Done <= '0';
			state <= 1;
		when 1 =>
			if cont < 8 then
				cont <= cont + 1;
				Done <= '0';
				state <= 1;
				scancode <= S & scancode(7 downto 1);
			else
				state <= 0;
				Done <= '1';
				P <= scancode(7 downto 0);
			end if;
	when others => null;
	end case;

	else null;
	end if;

	end process;
end Behavioral;