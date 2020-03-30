library ieee;
use ieee.std_logic_1164.all;

entity Full_Add is
  port (X, Y : in bit; Ci : in bit;
    s : out bit;
    co : out bit);
end Full_Add;

architecture archi of Full_Add is
  component mux
    port(A, B, C, D: in bit;
      S1,S2: in bit;
      z: out bit);
  end component;
signal Nci: bit;
begin
  Nci <= NOT ci;
  mux1: mux port map(ci, Nci, NCi, ci, X, Y, s);
  mux2: mux port map('0', ci, ci, '1', X, Y, co);
end archi;
