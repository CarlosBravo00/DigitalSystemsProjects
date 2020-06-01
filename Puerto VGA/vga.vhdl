library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_controller is
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
        enable : out std_logic;
        column : out integer;
        row : out integer;
        clk_out : out std_logic;
        h_sync, v_sync : out std_logic
        
    );
end entity;

architecture arch of vga_controller is 

    constant h_period : INTEGER := h_pulse + h_bp + h_display + h_fp; -- Total = 800
    constant v_period : INTEGER := v_pulse + v_bp + v_display + v_fp; -- Total = 560? 
    signal h_count : INTEGER RANGE 0 TO h_period - 1 := 0; -- horizonal
    signal v_count : INTEGER RANGE 0 TO v_period - 1 := 0; -- vertical

begin

    clk_out <= clk; --25 MHz

    process
    begin
        wait until clk'event and clk = '1';


        -- contadores horizontal y vertical
        if(h_count < h_period - 1) then 
            h_count <= h_count +1;
        else
            h_count <= 0;
            
            if v_count < v_period - 1 then
                v_count <= v_count + 1;
            else
                v_count <= 0;
            end if;
        end if;
      
        -- Sincronización horizontal
        if h_count < h_display + h_fp  OR h_count >= h_display + h_fp + h_pulse then
            h_sync <= NOT h_pol; 
        else
            h_sync <= h_pol;
        end if;

        -- Sincronización vertical
        if v_count < v_display + v_fp  OR v_count >= v_display + v_fp + v_pulse then
            v_sync <= NOT v_pol; 
        else
            v_sync <= v_pol;
        end if;

        -- coordenadas
        if h_count < h_display then
            column <= h_count;
        end if;
        
        if v_count < v_display then
            row <= v_count;
        end if;
     
        if h_count < h_display AND v_count < v_display then
            enable <= '1';
        else
            enable <= '0';
        end if;       

    end process;

end arch;