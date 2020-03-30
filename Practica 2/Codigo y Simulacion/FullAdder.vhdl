library ieee;
use ieee.std_logic_1164.all;

entity Full_Add is
  port (X, Y : in bit; Ci : in bit;
    s : out bit;
    co : out bit);
end Full_Add;

architecture archi of Full_Add is
  component mux_4_1
    port(A, B, C, D: in bit;
      S1,S2: in bit;
      z: out bit);
  end component;
signal cinnot : bit;
begin
  Ncin <= NOT ci;
  mux1: mux_4_1 port map(ci, cinnot, cinnot, ci, X, Y, s);
  mux2: mux_4_1 port map('0', ci, ci, '1', X, Y, co);
end archi;
