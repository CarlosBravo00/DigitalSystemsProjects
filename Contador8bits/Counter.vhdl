library ieee;
use ieee.std_logic_1164.all;

entity counter  is
    Port ( CLK : in  BIT;
	   enable : in BIT;
            UD : in BIT;
           Q : out  BIT_VECTOR(3 downto 0));
end counter;

architecture Behavioral of counter is
component FlipFlopJK is 
Port ( 
    clk : in BIT;
    enable : in BIT;
    J  : in  BIT;
    K : in  BIT;
    Q : out  BIT;
    QN : out  BIT);
end component;
    signal UDN : BIT;
    signal Q0,Q1,Q2,Q3: BIT;
    signal Q0N,Q1N,Q2N,Q3N: BIT;
    signal J0,J1,J2,J3: BIT;
    signal K0,K1,K2,K3: BIT;
begin
    UDN <= NOT UD;
    J3 <= (UDN AND Q0 AND Q1 AND Q2) OR (UD AND Q2N AND Q1N AND Q0N);
    K3 <= (UDN AND Q0) OR (UD AND Q0N);
    J2 <= (UDN AND Q1 AND Q0) OR (UD AND Q3 AND Q0N);
    K2 <= (UDN AND Q1 AND Q0) OR (UD AND Q1N AND Q0N);
    J1 <= (UDN AND Q3N AND Q0) OR (UD AND Q2 AND Q0N) OR (UD AND Q3 AND Q0N);
    K1 <= (UDN AND Q0) OR (UD AND Q0N);
    J0 <= '1';
    K0 <= '1';
    
JK0 : FlipFlopJK port map(clk,enable,J0,K0,Q0,Q0N);
JK1 : FlipFlopJK port map(clk,enable,J1,K1,Q1,Q1N);
JK2 : FlipFlopJK port map(clk,enable,J2,K2,Q2,Q2N);
JK3 : FlipFlopJK port map(clk,enable,J3,K3,Q3,Q3N);

Q(0) <= Q0;
Q(1) <= Q1;
Q(2) <= Q2;
Q(3) <= Q3;


end Behavioral;

