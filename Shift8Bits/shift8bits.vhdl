library ieee;
use ieee.std_logic_1164.all;

entity shift8bits is
    port (
        clr, clk, sdr, sdl : in std_logic;
        mode : in std_logic_vector(1 downto 0);
        parallel : in std_logic_vector(7 downto 0);
        q : out std_logic_vector(7 downto 0));
end entity;

architecture arch of  shift8bits is
    component shift_register is
        port (
            clr, clk, sdr, sdl : in std_logic;
            mode : in std_logic_vector(1 downto 0);
            parallel : in std_logic_vector(3 downto 0);
            q : out std_logic_vector(3 downto 0));
    end component;
    signal q_assist : std_logic_vector(7 downto 0);

 begin

    SHIFT1 : shift_register port map(clr,clk,q_assist(3),sdl,mode,parallel(7 downto 4),q_assist(7 downto 4));
    SHIFT0 : shift_register port map(clr,clk,sdr,q_assist(4),mode,parallel(3 downto 0),q_assist(3 downto 0));
 
    q <= q_assist;

end arch ; -- arch
 