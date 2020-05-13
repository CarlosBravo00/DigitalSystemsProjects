library ieee;
use ieee.std_logic_1164.all;

entity controller is 
    port(
        clk : in std_logic;
        x_i , y_i : in std_logic_vector(3 downto 0);
        GO_i : in std_logic;
        data_o : out std_logic_Vector(3 downto 0)
    );
end entity;
  
architecture arch of controller is
    component  datapath  is 
    port(
        clk : in std_logic;
        x_i , y_i : in std_logic_vector(3 downto 0);
        y_sel, x_sel: in std_logic;
        x_ld , y_ld : in std_logic;
        x_sub, y_sub : in std_logic;
        o_enb : in std_logic;
        X_gt_y,x_eq_y,x_lt_y : out std_logic;
        data_o : out std_logic_Vector(3 downto 0)
    );
end component;

signal y_sel, x_sel: std_logic;
signal x_ld , y_ld: std_logic;
signal x_sub, y_sub : std_logic;
signal o_enb : std_logic;
signal X_gt_y,x_eq_y,x_lt_y : std_logic;

TYPE STATES IS(S0,S1,S2,S3);
SIGNAL state: STATES;

begin

A: datapath port map (clk,x_i,y_i,y_sel,x_sel,x_ld,y_ld,x_sub,y_sub
,o_enb,X_gt_y,x_eq_y,x_lt_y,data_o);

x_sub <= '0';
y_sub <= '0';

process(CLK)
begin 

if rising_edge(clk) then
    case state is 
         when S0=>
            if (GO_i = '1') then 
                if(x_gt_y = '1') then
                    x_sel <= '1';
                    y_sel <= '0';
                    state <= S1;
                elsif (x_lt_y = '1') then 
                    x_sel <= '0';
                    y_sel <= '1';
                    state <= S1;
                else 
                x_sel <= '0';
                y_sel <= '0';
                state <= S1;
                end if;
            else
            state <= S0;
            end if;

         when S1=>
                x_ld <='1';
                y_ld <='1';
                state <= S2;
                
         when S2=>
                x_ld <='0';
                y_ld <='0';
                state <= S3;

         when S3=>
                if(x_eq_y = '1') then
                o_enb <= '1';
                state <= S3;
                else 
                state <= S0;
                
                end if;
                
     
         when others => null; 
         end case;

    end if;
end process;

end arch;

