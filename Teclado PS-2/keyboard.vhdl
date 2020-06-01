library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity keyboard is
    port(
        keyboard_clk, keyboard_data, clk_25Mhz, reset, enable : in std_logic;
        scan_code   : out std_logic_vector(7 downto 0);
        scan_ready  : out std_logic
    );
end entity;


architecture arch of keyboard is
    signal incount : unsigned(3 downto 0) := "0000";
    signal keyboard_clk_filtered : std_logic;
    signal read_char : std_logic := '0';
    signal ready_set : std_logic := '0';
    signal shift_in : std_logic_vector(8 downto 0);
    signal filter : std_logic_vector(7 downto 0);

begin

    clock_filter : process
    begin
        wait until clk_25Mhz'event and clk_25Mhz = '1';
        filter(6 downto 0) <= filter(7 downto 1);
        filter(7) <= keyboard_clk;
        if filter = x"FF" then 
            keyboard_clk_filtered <= '1';
        elsif filter = x"00" then
            keyboard_clk_filtered <= '0';
        end if;
    end process;
-- TODO : validate parity bit
    process 
    begin
        wait until (keyboard_clk_filtered'event and keyboard_clk_filtered = '0');
        if reset = '1' then
            incount <= x"0";
            read_char <= '0';
        else 
            if keyboard_data = '0' and read_char = '0' then
                read_char <= '1';
                ready_set <= '0';
            else 
                -- Shift enl siguientes 8 bits para construir el scan code
                if read_char = '1' then
                    if incount  < x"9" then
                        incount <= incount + 1;
                        shift_in(7 downto 0) <= shift_in(8 downto 1);
                        shift_in(8) <= keyboard_data;
                        ready_set <= '0';
                    else
                        scan_code <= shift_in(7 downto 0);
                        read_char <= '0';
                        ready_set <= '1';
                        incount <= x"0";
                    end if;
                end if;
            end if;
        end if;
    end process;
    
    -- Proceso que habilita el controlador
    -- Cuando enable = 1, indicará que no estará listo para leer el scancode de tu teclado
    -- Cuando enable = 0, indicará el momento en el que permitirá leer el scancode del teclado
    process (enable, ready_set)
    begin
        if enable = '1' then
            scan_ready <= '0';
        elsif ready_set'event and ready_set = '1' then
            scan_ready <= '1';
        end if;
    end process;
    
end arch ; -- arch