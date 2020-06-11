library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga is 
    port(
        enable : in std_logic;
        clk : in std_logic;
        column : in integer;
        row : in integer;
        rgb : out std_logic_vector(8 downto 0)
    );
end entity;

architecture arch of vga is
    signal red,blue,green : std_logic_vector(2 downto 0);
begin

    process (clk)
    begin 
        if clk'event and clk = '1' then 
            if column > 100 AND column < 200 AND row > 1 AND row < 5 then 
            red <= "111";
            green <= "111";
            blue <= "111";
            else 
            red <= "000";
            green <= "000";
            blue <= "111";
            end if;
        end if;
        end process;

        rgb(8 downto 6) <= red and (enable & enable & enable);
        rgb(5 downto 3) <= green and (enable & enable & enable);
        rgb(2 downto 0) <= blue and (enable & enable & enable);

end arch;