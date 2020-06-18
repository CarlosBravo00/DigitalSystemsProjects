library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contador is
    Port ( clk : in  STD_LOGIC;
           salida : out  STD_LOGIC_VECTOR (2 downto 0));
end contador;

architecture Behavioral of contador is
signal estado: std_logic_vector(2 downto 0):="000";
begin
 process(clk)
 begin
 if rising_edge(clk)
 then
     case estado is
          when "000"=>
		 estado <="011";
          when "011"=>
		 estado <="010";
          when "010"=>
		 estado <="101";
          when "101"=>
		 estado <="100";
          when "100"=>
		 estado <="111";
          when "111"=>
		 estado <="110";
          when "110"=>
		 estado <="000";
          when others => null;
            end case;
        else null;
    end if;
    end process;
    salida <= estado;

end Behavioral;