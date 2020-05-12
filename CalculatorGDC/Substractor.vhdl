library ieee;
use ieee.std_logic_1164.all;

entity substractor is 
    port (
        a, b, bin : in std_logic;
        d, bout :   out std_logic
    );
end entity;

architecture arch of substractor is 
begin
    d <= a xor (b xor bin);
    bout <= (bin and ( b and (not a))) or ((not a) and b);
end arch;