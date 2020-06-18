library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity contador  is
    Port ( CLK : in  STD_LOGIC;
           --C01 : out  STD_LOGIC;
           --C00 : out  STD_LOGIC;
           unid : out  STD_LOGIC_VECTOR(3 downto 0);
           dec : out  STD_LOGIC_VECTOR(3 downto 0));
end contador;

architecture Behavioral of contador is
component contBCD is 
Port ( enable  : in  STD_LOGIC;
        clk : in  STD_LOGIC;
        reset : in  STD_LOGIC;
        s : out  STD_LOGIC_VECTOR (3 downto 0));
end component;
signal RES10,RES9,RES10b : STD_LOGIC;
signal temp1,temp2 : STD_LOGIC_VECTOR (3 downto 0);
begin

u: contBCD port map('1',CLK,RES10,temp1);
d: contBCD port map(RES9,CLK,RES10b,temp2);

RES10 <= temp1(3) AND temp1(1);
RES10b <= temp2 (3) AND temp2 (1);
RES9 <= temp1(3) and temp1(0);

unid <= temp1;
dec <= temp2;

end Behavioral;

