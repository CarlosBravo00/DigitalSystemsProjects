library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity Tarea04 is
    Port ( Capuchino , Moka , Expresso , Americano : in std_logic;
				Azucar , SustitutoA, Crema, Leche : in std_logic;
           price : out STD_LOGIC_VECTOR (6 downto 0));
end Tarea04;

architecture Behavioral of Tarea04 is
signal dc , de1 , de2, de3 , de4 : STD_LOGIC_VECTOR (6 downto 0);
signal coffe : STD_LOGIC_VECTOR(3 downto 0);
signal extra : STD_LOGIC_VECTOR (3 downto 0);
begin

coffe(3) <= Capuchino;
coffe(2) <= Moka;
coffe(1) <= Expresso; 
coffe(0) <= Americano;

extra(3) <= Azucar;
extra(2) <= SustitutoA;
extra(1) <= Crema;
extra(0) <= Leche;

dc <= "0110111" when (coffe = "1000") else 
"1000100" when (coffe = "0100") else 
"0010111" when (coffe = "0010") else 
"0100011" when (coffe = "0001") else 
"0000000";

de1 <= "0000101" when (extra(3) = '1') else "0000000";
de2 <= "0001111" when (extra(2) = '1') else "0000000";
de3 <= "0011001" when (extra(1) = '1') else "0000000";
de4 <= "0001101" when (extra(0) = '1') else "0000000";

price <= de1 + de2 + de3 + de4 + dc;

end Behavioral;

