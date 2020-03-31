library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCDto4Display is
    Port ( clk : in  STD_LOGIC;
           BCD_in : in STD_LOGIC_VECTOR (3 downto 0);
           controlador : out  STD_LOGIC_VECTOR (3 downto 0);
           D1 : out STD_LOGIC_VECTOR (6 downto 0);
           D2 : out STD_LOGIC_VECTOR (6 downto 0);
           D3 : out STD_LOGIC_VECTOR (6 downto 0);
           D4 : out STD_LOGIC_VECTOR (6 downto 0));
end  BCDto4Display;

architecture arch of  BCDto4Display is
signal estado: std_logic_vector(3 downto 0):="0000";
signal LED_out : STD_LOGIC_VECTOR (6 downto 0):="0000000";

begin
 process(clk)
 begin
 if rising_edge(clk)
 then
     case estado is
 when "0000"=>
		 estado <="0001";
when "0001"=>
          D1 <= LED_out;
         D2 <= "0000000";
         D3 <= "0000000";
         D4 <= "0000000";
		 estado <="0010";
when "0010"=>
          D2 <= LED_out;
          D1 <= "0000000";
          D3 <= "0000000";
          D4 <= "0000000";
		 estado <="0100";
when "0100"=>
          D3 <= LED_out;
          D1 <= "0000000";
          D2 <= "0000000";
          D4 <= "0000000";
         estado <="1000";
when "1000"=>
          D4 <= LED_out;
          D1 <= "0000000";
          D2 <= "0000000";
          D3 <= "0000000";
		 estado <="0001";
          when others => null;
            end case;
        else null;
    end if;
    end process;
    controlador <= estado;

process(BCD_in)
    begin
        case BCD_in is
        when "0000" => LED_out <= "0000001"; -- "0"     
        when "0001" => LED_out <= "1001111"; -- "1" 
        when "0010" => LED_out <= "0010010"; -- "2" 
        when "0011" => LED_out <= "0000110"; -- "3" 
        when "0100" => LED_out <= "1001100"; -- "4" 
        when "0101" => LED_out <= "0100100"; -- "5" 
        when "0110" => LED_out <= "0100000"; -- "6" 
        when "0111" => LED_out <= "0001111"; -- "7" 
        when "1000" => LED_out <= "0000000"; -- "8"     
        when "1001" => LED_out <= "0000100"; -- "9" 
        when others => null;
        end case;
    end process;

end arch;