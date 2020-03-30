library ieee;
use ieee.std_logic_1164.all;

entity multiplier is
  port(
    A : IN BIT_VECTOR(3 DOWNTO 0);
    B : IN BIT_VECTOR(3 DOWNTO 0); 
    Z : OUT BIT_VECTOR(8 DOWNTO 0)); 
end multiplier;

architecture arch of multiplier is
  component Full_Add
    port (X, Y : in bit; Ci : in bit;
      s : out bit;
      Co : out bit);
  end component;
  component HalfAdd
    port (X, Y : in bit;
      s : out bit;
      co : out bit);
    end component;

signal A0IB0, A1IB0 , A2IB0 , A3IB0 : bit;
signal A0IB1, A1IB1 , A2IB1 , A3IB1 : bit;
signal A0IB2, A1IB2 , A2IB2 , A3IB2 : bit;
signal A0IB3, A1IB3 , A2IB3 , A3IB3 : bit;

signal CA1, CA2, CA3, CA4, CA5, CA6: bit;
signal CA7, CA8, CA9, CA10, CA11, CA12: bit;
signal SUM1, SUM2, SUM3, SUM4, SUM5, SUM6: bit;
signal die: bit;

begin
  A0IB0 <= a(0) AND b(0);
  A1IB0 <= a(1) AND b(0);
  A2IB0 <= a(2) AND b(0);
  A3IB0 <= a(3) AND b(0);--
  A0IB1 <= a(0) AND b(1);
  A1IB1 <= a(1) AND b(1);
  A2IB1 <= a(2) AND b(1);
  A3IB1 <= a(3) AND b(1);--
  A0IB2 <= a(0) AND b(2);
  A1IB2 <= a(1) AND b(2);
  A2IB2 <= a(2) AND b(2);
  A3IB2 <= a(3) AND b(2);--
  A0IB3 <= a(0) AND b(3);--
  A1IB3 <= a(1) AND b(3);--
  A2IB3 <= a(2) AND b(3);--
  A3IB3 <= a(3) AND b(3);

  Z(0) <= A0IB0;
  HA1: HalfAdd port map(A1IB0,A0IB1, Z(1), CA1);
  FA1: Full_Add port map(A2IB0,A1IB1, CA1, SUM1, CA2);
  FA2: Full_Add port map(A3IB0,A2IB1, CA2, SUM2, CA3);
  FA3: Full_Add port map('0', A3IB1, CA3, SUM3, CA4);

  HA2: HalfAdd port map(A0IB2, SUM1, z(2), CA5);
  FA4: Full_Add port map(A1IB2, SUM2, CA5, SUM4, CA6);
  FA5: Full_Add port map(A2IB2, SUM3, CA6, SUM5, CA7);
  FA6: Full_Add port map(A3IB2, CA4, CA7, SUM6, CA8);

  HA3: HalfAdd port map(A0IB3, SUM4, z(3), CA9);
  FA7: Full_Add port map(A1IB3, SUM5, CA9, z(4), CA10);
  FA8: Full_Add port map(A2IB3, SUM6, CA10, z(5), CA11);
  FA9: Full_Add port map(A3IB3, CA8, CA11, z(6), CA12);
  HA4: HalfAdd port map('0', CA12, z(7), die);

end arch;
