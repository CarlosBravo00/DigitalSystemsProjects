library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity keyboard_tb is
    constant period : time := 40 ns; -- Reloj del sistema de 25MHz
    constant bit_period : time := 60 us; -- 16.7 kHz max
end entity;

architecture arch of keyboard_tb is

    component keyboard is
        port(
            keyboard_clk, keyboard_data, clk_25Mhz, reset, enable : in std_logic;
            scan_code   : out std_logic_vector(7 downto 0);
            scan_ready  : out std_logic
        );
    end component;
    
    signal clk : std_logic := '0';
    signal reset : std_logic;
    signal enable : std_logic := '0';
    signal kbd_clk : std_logic := 'H';
    signal kbd_data : std_logic := 'H';
    signal scan_ready :std_logic;
    signal scan_code : std_logic_vector(7 downto 0);

    type code_type is array (natural range <>) of std_logic_vector(7 downto 0);
    constant codes : code_type := ( x"15", x"1D"); -- Q, W

begin

    UUT : keyboard port map (kbd_clk, kbd_data, clk, reset, enable, scan_code, scan_ready);

    clk <= not clk after (period / 2);
    reset <= '1', '0' after period;

    process
        procedure send_code ( data : std_logic_vector(7 downto 0)) is 
        begin
            kbd_clk <= 'H';
            kbd_data <= 'H';
            
            wait for (bit_period / 2);
            -- start bit
            kbd_data <= '0';
            wait for (bit_period / 2);
            kbd_clk <= '0'; wait for (bit_period / 2);
            kbd_clk <= '1';

            -- data bits
            for i in 0 to 7 loop
                kbd_data <= data(i);
                wait for (bit_period / 2);
                kbd_clk <= '0'; wait for (bit_period / 2);
                kbd_clk <= '1';
            end loop;
            kbd_data <= '0'; -- parity bit 
            wait for (bit_period / 2);
            kbd_clk <= '0'; wait for (bit_period / 2);
            kbd_clk <= '1';
            -- stop bit
            kbd_data <= '1';
            wait for (bit_period / 2);
            kbd_clk <= '0'; wait for (bit_period / 2);
            kbd_clk <= '1';
            kbd_data <= 'H';
            wait for bit_period * 3;
        end procedure send_code;
    begin
        wait for bit_period;
        for i in codes'range loop
            send_code(codes(i));
        end loop;
    end process;

    process 
    begin
        wait until scan_ready = '1';
        wait for 300 * period;
        enable <= '0';
        
    end process;

end arch ; -- arch