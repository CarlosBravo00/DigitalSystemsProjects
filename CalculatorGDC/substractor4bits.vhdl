library ieee;
use ieee.std_logic_1164.all;

entity substractor4bits is
    port(
        a, b : in std_logic_vector(3 downto 0);
        bin :  in std_logic;
        bout : out std_logic;
        d   : out std_logic_vector(3 downto 0)
    );
end entity;

architecture arch of substractor4bits is
    component substractor is
        port(
            a, b, bin : in std_logic;
            d, bout :   out std_logic
        );
    end component;
    signal bout_tmp : std_logic_vector(2 downto 0);
begin
    fs_0 : substractor port map (a(0), b(0), bin, d(0), bout_tmp(0));
    fs_1 : substractor port map (a(1), b(1), bout_tmp(0) , d(1), bout_tmp(1));
    fs_2 : substractor port map (a(2), b(2), bout_tmp(1), d(2), bout_tmp(2));
    fs_3 : substractor port map (a(3), b(3), bout_tmp(2), d(3), bout);

end arch;