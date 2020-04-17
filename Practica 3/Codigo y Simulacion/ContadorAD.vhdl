library ieee;
use ieee.std_logic_1164.all;

entity contador  is
    Port ( CLK : in  BIT;
            X : in BIT;
           unid : out  BIT_VECTOR(3 downto 0);
           dec : out  BIT_VECTOR(3 downto 0));
end contador;

architecture Behavioral of contador is
component FlipFlopJK is 
Port ( 
    clk : in BIT;
    enable : in BIT;
    J  : in  BIT;
    K : in  BIT;
    Q : out  BIT;
    QN : out  BIT);
end component;
    signal XN : BIT;
    signal Q0,Q1,Q2,Q3: BIT;
    signal Q0N,Q1N,Q2N,Q3N: BIT;
    signal J0,J1,J2,J3: BIT;
    signal K0,K1,K2,K3: BIT;

    signal DQ0,DQ1,DQ2,DQ3: BIT;
    signal DQ0N,DQ1N,DQ2N,DQ3N: BIT;
    signal DJ0,DJ1,DJ2,DJ3: BIT;
    signal DK0,DK1,DK2,DK3: BIT;

    signal clkd: BIT;
begin
    XN <= NOT X;
    J3 <= (XN AND Q0 AND Q1 AND Q2) OR (X AND Q2N AND Q1N AND Q0N);
    K3 <= (XN AND Q0) OR (X AND Q0N);
    J2 <= (XN AND Q1 AND Q0) OR (X AND Q3 AND Q0N);
    K2 <= (XN AND Q1 AND Q0) OR (X AND Q1N AND Q0N);
    J1 <= (XN AND Q3N AND Q0) OR (X AND Q2 AND Q0N) OR (X AND Q3 AND Q0N);
    K1 <= (XN AND Q0) OR (X AND Q0N);
    J0 <= '1';
    K0 <= '1';
    
JK0 : FlipFlopJK port map(clk,'1',J0,K0,Q0,Q0N);
JK1 : FlipFlopJK port map(clk,'1',J1,K1,Q1,Q1N);
JK2 : FlipFlopJK port map(clk,'1',J2,K2,Q2,Q2N);
JK3 : FlipFlopJK port map(clk,'1',J3,K3,Q3,Q3N);

unid(0) <= Q0;
unid(1) <= Q1;
unid(2) <= Q2;
unid(3) <= Q3;

 clkd <= (Q0 and Q1N AND Q2N AND Q3 and XN) OR (Q0N AND Q1N AND Q2N AND Q3N AND X);
 
 DJ3 <= (XN AND DQ0 AND DQ1 AND DQ2) OR (X AND DQ2N AND DQ1N AND DQ0N);
 DK3 <= (XN AND DQ0) OR (X AND DQ0N);
 DJ2 <= (XN AND DQ1 AND DQ0) OR (X AND DQ3 AND DQ0N);
 DK2 <= (XN AND DQ1 AND DQ0) OR (X AND DQ1N AND DQ0N);
 DJ1 <= (XN AND DQ3N AND DQ0) OR (X AND DQ2 AND DQ0N) OR (X AND DQ3 AND DQ0N);
 DK1 <= (XN AND DQ0) OR (X AND DQ0N);
 DJ0 <= '1';
 DK0 <= '1';

 JK0d : FlipFlopJK port map(clk,clkd,DJ0,DK0,DQ0,DQ0N);
 JK1d : FlipFlopJK port map(clk,clkd,DJ1,DK1,DQ1,DQ1N);
 JK2d : FlipFlopJK port map(clk,clkd,DJ2,DK2,DQ2,DQ2N);
 JK3d : FlipFlopJK port map(clk,clkd,DJ3,DK3,DQ3,DQ3N);

 dec(0) <= DQ0;
 dec(1) <= DQ1;
 dec(2) <= DQ2;
 dec(3) <= DQ3;



end Behavioral;

