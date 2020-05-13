library ieee;
use ieee.std_logic_1164.all;

entity datapath  is 
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
end entity;


architecture arch of datapath is

    component mux is 
    port(
        x, y : in std_logic_vector(3 downto 0);
        sel : in std_logic;
        res : out std_logic_vector(3 downto 0)
    );
    end component;

    component substractor4bits is
        port(
            a, b : in std_logic_vector(3 downto 0);
            bin :  in std_logic;
            bout : out std_logic;
            d   : out std_logic_vector(3 downto 0)
        );
    end component;

    component comparator is
        port(
            x, y : in std_logic_vector(3 downto 0);
            x_gt_y, x_eq_y, x_lt_y : out std_logic
        );
    end component;

    component register4bits is
        port (
            d_in : in std_logic_vector(3 downto 0);
            clk, ld, reset : in std_logic;
            d_out : out std_logic_vector(3 downto 0)
        );
    end  component;

    component outputregister is
        port (
            d_in : in std_logic_vector(3 downto 0);
            clk, ld, reset : in std_logic;
            d_out : out std_logic_vector(3 downto 0)
        );
    end  component;

    signal xmux , ymux : std_logic_vector(3 downto 0);
    signal xreg , yreg : std_logic_vector(3 downto 0);
    signal x_ysub , y_xsub :std_logic_vector(3 downto 0);
    signal flag :std_logic;
begin

MUX_X: mux port map(x_i,x_ysub,x_sel,xmux);
MUX_Y: mux port map(y_i,y_xsub,y_sel,ymux);

REGISTER_X: register4bits port map(xmux,clk,x_ld,'0',xreg);
REGISTER_Y: register4bits port map(ymux,clk,y_ld,'0',yreg);

Comp: comparator port map (xreg,yreg,X_gt_y,x_eq_y,x_lt_y);

SUBX_Y: substractor4bits port map(xreg,yreg,'0',flag,x_ysub);
SUBY_X: substractor4bits port map(yreg,xreg,'0',flag,y_xsub);

outputreg: outputregister port map(xreg,clk,o_enb,'0',Data_o);



end arch ;