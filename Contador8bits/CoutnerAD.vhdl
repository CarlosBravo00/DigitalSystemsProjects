library ieee;
use ieee.std_logic_1164.all;

entity contador  is
    Port ( CLK : in  BIT;
	   enable : in BIT;
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
    
JK0 : FlipFlopJK port map(clk,enable,J0,K0,Q0,Q0N);
JK1 : FlipFlopJK port map(clk,enable,J1,K1,Q1,Q1N);
JK2 : FlipFlopJK port map(clk,enable,J2,K2,Q2,Q2N);
JK3 : FlipFlopJK port map(clk,enable,J3,K3,Q3,Q3N);

unid(0) <= Q0;
unid(1) <= Q1;
unid(2) <= Q2;
unid(3) <= Q3;


end Behavioral;

