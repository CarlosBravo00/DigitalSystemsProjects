library ieee;
use ieee.std_logic_1164.all;

entity register4bits is
    port (
        d_in : in std_logic_vector(3 downto 0);
        clk, ld, reset : in std_logic;
        d_out : out std_logic_vector(3 downto 0)
    );
end entity;

architecture arch of register4bits is 
    
   begin
     process (clk) 
    	begin
         if (reset = '1') then
             d_out <= "0000";
         else
             if(rising_edge(clk)) then
                 if (ld = '1') then
                     d_out <= d_in;
                 else 
                     null;
                 end if;
             end if;
         end if;
     end process;

end arch;