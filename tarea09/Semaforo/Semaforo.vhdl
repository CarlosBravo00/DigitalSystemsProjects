library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity semaforo is
port(clk: in std_ulogic;
S1: out std_logic_vector(2 downto 0);
S2: out std_logic_vector(2 downto 0);
S3: out std_logic_vector(2 downto 0);
S4: out std_logic_vector(2 downto 0));
end semaforo;

architecture Behavioral of semaforo is
signal State: integer:=0;
begin
	process(clk)
	begin
		if rising_edge(clk) then
			case State is
				when 0 => State <= 1;
				when 1 => State <= 2;
				when 2 => State <= 3;
				when 3 => State <= 4;
				when 4 => State <= 5;
				when 5 => State <= 6;
				when 6 => State <= 7;
				when 7 => State <= 8;
				when 8 => State <= 9;
				when 9 => State <= 10;
				when 10 => State <= 11;
				when 11 => State <= 0;
				when others => null;
			end case;
		else null;
		end if;
	end process;

S1 <= "100" when state = 0
			else "100" when state = 1
			else "010" when state = 2
			else "001" when state = 3
			else "001" when state = 4
			else "001" when state = 5
			else "001" when state = 6
			else "001" when state = 7
			else "001" when state = 8
			else "001" when state = 9
			else "001" when state = 10
			else "001" when state = 11
			else "000";
S2 <= "001" when state = 0
			else "001" when state = 1
			else "001" when state = 2
			else "100" when state = 3
			else "100" when state = 4
			else "010" when state = 5
			else "001" when state = 6
			else "001" when state = 7
			else "001" when state = 8
			else "001" when state = 9
			else "001" when state = 10
			else "001" when state = 11
			else "000";
S3 <= "001" when state = 0
			else "001" when state = 1
			else "001" when state = 2
			else "001" when state = 3
			else "001" when state = 4
			else "001" when state = 5
			else "100" when state = 6
			else "100" when state = 7
			else "010" when state = 8
			else "001" when state = 9
			else "001" when state = 10
			else "001" when state = 11
			else "000";
S4 <= "001" when state = 0
			else "001" when state = 1
			else "001" when state = 2
			else "001" when state = 3
			else "001" when state = 4
			else "001" when state = 5
			else "001" when state = 6
			else "001" when state = 7
			else "001" when state = 8
			else "100" when state = 9
			else "100" when state = 10
			else "010" when state = 11
			else "000";
end Behavioral;

