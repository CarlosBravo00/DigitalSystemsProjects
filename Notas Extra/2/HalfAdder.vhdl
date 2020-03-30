library ieee;
use ieee.std_logic_1164.all;

entity HalfAdd is
  port (X, Y : in bit;
    s : out bit;
    co : out bit);
  end HalfAdd;

architecture archit of HalfAdd is
  component mux_4_1
    port(A, B, C, D: in bit;
      S1,S2: in bit;
      z: out bit);
  end component;
begin
mux1: mux_4_1 port map('0', '1', '1', '0', X, Y, s);
mux2: mux_4_1 port map('0', '0', '0', '1', X, Y, co);
end archit; 
