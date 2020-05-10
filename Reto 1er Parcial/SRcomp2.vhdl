library ieee;
use ieee.std_logic_1164.all;

ENTITY addsub IS
   PORT (
      A : IN BIT_VECTOR(7 DOWNTO 0);
      B : IN BIT_VECTOR(7 DOWNTO 0); 
      T : IN BIT;
      C_FLAG : OUT BIT;
      OV_FLAG : OUT BIT;
      R : OUT BIT_VECTOR(7 DOWNTO 0)
   );
END ENTITY;
  
  architecture arch of addsub is
    component FullAdder is 
    PORT (
        A,B,Cin : in BIT;
        Cout, S : out BIT
       );
end component;
signal C :  BIT_VECTOR(7 DOWNTO 0);
signal Bx :  BIT_VECTOR(7 DOWNTO 0); 
  begin
    Bx(0) <= B(0) xor T;
    Bx(1) <= B(1) xor T;
    Bx(2) <= B(2) xor T;
    Bx(3) <= B(3) xor T;
    Bx(4) <= B(4) xor T;
    Bx(5) <= B(5) xor T;
    Bx(6) <= B(6) xor T;
    Bx(7) <= B(7) xor T;

FA0: FullAdder port map(A(0),Bx(0),T,C(0),R(0));
FA1: FullAdder port map(A(1),Bx(1),C(0),C(1),R(1));
FA2: FullAdder port map(A(2),Bx(2),C(1),C(2),R(2));
FA3: FullAdder port map(A(3),Bx(3),C(2),C(3),R(3));
FA4: FullAdder port map(A(4),Bx(4),C(3),C(4),R(4));
FA5: FullAdder port map(A(5),Bx(5),C(4),C(5),R(5));
FA6: FullAdder port map(A(6),Bx(6),C(5),C(6),R(6));
FA7: FullAdder port map(A(7),Bx(7),C(6),C(7),R(7));
   
C_FLAG <= C(7);
OV_FLAG <= C(7) xor C(6);

  end arch;