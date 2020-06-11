library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_controller_tb is
    constant h_pulse   :  INTEGER := 96;
    constant h_bp      :  INTEGER := 48;
    constant h_display :  INTEGER := 640;
    constant h_fp      :  INTEGER := 16;
    constant h_pol     :  std_logic := '0'; 
    constant v_pulse   :  INTEGER := 2;
    constant v_bp      :  INTEGER := 33;
    constant v_display :  INTEGER := 480;
    constant v_fp      :  INTEGER := 10;
    constant v_pol     :  std_logic := '0';
    constant period    :  time := 40 ps;
end entity;

architecture arch of vga_controller_tb is

    component vga_controller is
        generic (
          h_pulse   :  INTEGER := 96;
          h_bp      :  INTEGER := 48;
          h_display :  INTEGER := 640;
          h_fp      :  INTEGER := 16;
          h_pol     :  std_logic := '0'; 
          v_pulse   :  INTEGER := 2;
          v_bp      :  INTEGER := 33;
          v_display :  INTEGER := 480;
          v_fp      :  INTEGER := 10;
          v_pol     :  std_logic := '0' 
        );
        port (
            clk : in std_logic;
            clk_out : out std_logic;
            h_sync, v_sync : out std_logic;
            rgb : out std_logic_vector(8 downto 0)
        );
    end component;
    
    signal clk : std_logic := '0';
    signal clk_out : std_logic;
    signal h_sync, v_sync : std_logic;
    signal rgb : std_logic_vector(8 downto 0);

begin

    UUT : vga_controller 
        generic map (h_pulse,h_bp, h_display, h_fp,h_pol,v_pulse,v_bp,v_display,v_fp,v_pol)
        port map (clk, clk_out, h_sync, v_sync,rgb);

    process 
    begin
        clk <= '0'; wait for period / 2;
        clk <= '1'; wait for period / 2;
    end process;

end arch ; -- arch