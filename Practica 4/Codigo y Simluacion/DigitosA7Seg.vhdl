library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DigitosA7Seg is
    Port ( clk : in  STD_LOGIC;
           BCD1,BCD2,BCD3,BCD4 : in STD_LOGIC_VECTOR (3 downto 0);
           D1 : out STD_LOGIC_VECTOR (6 downto 0);
           D2 : out STD_LOGIC_VECTOR (6 downto 0);
           D3 : out STD_LOGIC_VECTOR (6 downto 0);
          D4 : out STD_LOGIC_VECTOR (6 downto 0));
end  DigitosA7Seg;

architecture arch of  DigitosA7Seg is
    component BCDto4Display is
        Port ( BCD_in : in STD_LOGIC_VECTOR (3 downto 0);
               LED_out : out STD_LOGIC_VECTOR (6 downto 0));
        end  component;

signal estado: std_logic_vector(3 downto 0):="0000";
signal LED_out1,LED_out2,LED_out3,LED_out4 : STD_LOGIC_VECTOR (6 downto 0);

begin

    LED1 : BCDto4Display port map(BCD1,LED_out1);
    LED2 : BCDto4Display port map(BCD2,LED_out2);
    LED3 : BCDto4Display port map(BCD3,LED_out3);
    LED4 : BCDto4Display port map(BCD4,LED_out4);

 process(clk)
 begin
 if rising_edge(clk)
 then
     case estado is
 when "0000"=>
            D1 <="1111111";
            D2 <= "1111111";
            D3 <= "1111111";
            D4 <= "1111111";
		 estado <="0111";
when "0111"=>
        D2 <= LED_out2;
         D1 <= "1111111";
         D3 <= "1111111";
         D4 <= "1111111";
		 estado <="1011";
when "1011"=>
         D3 <= LED_out3;
         D2 <= "1111111";
         D1 <= "1111111";
         D4 <= "1111111";
		 estado <="1101";
when "1101"=>
          D4 <= LED_out4;
          D1 <= "1111111";
          D2 <= "1111111";
          D3 <= "1111111";
         estado <="1110";
when "1110"=>
          D1 <= LED_out1;
          D4 <= "1111111";
          D2 <= "1111111";
          D3 <= "1111111";
		 estado <="0111";
          when others => null;
            end case;
        else null;
    end if;
    end process;

end arch;
