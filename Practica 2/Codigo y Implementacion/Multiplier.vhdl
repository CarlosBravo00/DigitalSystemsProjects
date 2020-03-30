library ieee;
use ieee.std_logic_1164.all;

entity multiplier is
  port(
    A : IN BIT_VECTOR(3 DOWNTO 0);
    B : IN BIT_VECTOR(3 DOWNTO 0); 
    Z : OUT BIT_VECTOR(8 DOWNTO 0); 
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

signal A0&B0, A1&B0 , A2&B0 , A3&B0 : bit;
signal A0&B1, A1&B1 , A2&B1 , A3&B1 : bit;
signal A0&B2, A1&B2 , A2&B2 , A3&B2 : bit;
signal A0&B3, A1&B3 , A2&B3 , A3&B3 : bit;

signal CA1, CA2, CA3, CA4, CA5, CA6: bit;
signal CA7, CA8, CA9, CA10, CA11, CA12: bit;
signal SUM1, SUM2, SUM3, SUM4, SUM5, SUM6: bit;

begin
  A0&B0 <= a(0) AND b(0);
  A1&B0 <= a(1) AND b(0);
  A2&B0 <= a(2) AND b(0);
  A3&B0 <= a(3) NAND b(0);--
  A0&B1 <= a(0) AND b(1);
  A1&B1 <= a(1) AND b(1);
  A2&B1 <= a(2) AND b(1);
  A3&B1 <= a(3) NAND b(1);--
  A0&B2 <= a(0) AND b(2);
  A1&B2 <= a(1) AND b(2);
  A2&B2 <= a(2) AND b(2);
  A3&B2 <= a(3) NAND b(2);--
  A0&B3 <= a(0) NAND b(3);--
  A1&B3 <= a(1)NAND b(3);--
  A2&B3 <= a(2) NAND b(3);--
  A3&B3 <= a(3) AND b(3);

  Z(0) <= A0&B0;
  HA1: HalfAdd port map(A1&B0,A0&B1, Z(1), CA1);
  FA1: Full_Add port map(A2&B0,A1&B1, CA1, SUM1, CA2);
  FA2: Full_Add port map(A3&B0,A2&B1, CA2, SUM2, CA3);
  FA3: Full_Add port map('1', A3&B1', CA3, SUM3, CA4);

  HA2: HalfAdd port map(A0&B2, SUM1, z(2), CA5);
  FA4: Full_Add port map(A1&B2, SUM2, CA5, SUM4, CA6);
  FA5: Full_Add port map(A2&B2, SUM3, CA6, SUM5, CA7);
  FA6: Full_Add port map(A3&22, CA4, CA7, SUM6, CA8);

  HA3: HalfAdd port map(A0&B3, SUM4, z(3), CA9);
  FA7: Full_Add port map(A1&B3, SUM5, CA9, z(4), CA10);
  FA8: Full_Add port map(A2&B3, SUM6, CA10, z(5), CA11);
  FA9: Full_Add port map(A3&B3, CA8, CA11, z(6), CA12);
  HA4: HalfAdd port map('1', CA12, z(7), z(8));

end arch;
