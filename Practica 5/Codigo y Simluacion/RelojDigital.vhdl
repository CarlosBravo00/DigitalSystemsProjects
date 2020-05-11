library ieee;
use ieee.std_logic_1164.all;

entity contador  is
    Port ( CLK : in  BIT;
           M_unid : out  BIT_VECTOR(3 downto 0);
           M_dece : out  BIT_VECTOR(3 downto 0);
           H_unid : out  BIT_VECTOR(3 downto 0):= "0001";
           H_dece : out  BIT);
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

    signal Q0,Q1,Q2,Q3: BIT;
    signal Q0N,Q1N,Q2N,Q3N: BIT;
    signal J0,J1,J2,J3: BIT;
    signal K0,K1,K2,K3: BIT;

    signal DQ0,DQ1,DQ2,DQ3: BIT;
    signal DQ0N,DQ1N,DQ2N,DQ3N: BIT;
    signal DJ0,DJ1,DJ2,DJ3: BIT;
    signal DK0,DK1,DK2,DK3: BIT;

    signal HQ0:BIT :='1';
    signal HQ1,HQ2,HQ3: BIT;
    signal HQ0N,HQ1N,HQ2N,HQ3N: BIT;
    signal HJ0,HJ1,HJ2,HJ3: BIT;
    signal HK0,HK1,HK2,HK3: BIT;

    signal QE,QEN,JE,KE: BIT;

    signal en_min: BIT;
    signal en_hor: BIT;
begin

    --Minutos
    --UNIDADES

J3 <= Q0 AND Q1 AND Q2;
K3 <= Q0;
J2 <= Q1 AND Q0;
K2 <= Q1 AND Q0;
J1 <= Q3N AND Q0;
K1 <= Q0;
J0 <= '1';
K0 <= '1';
    
JK0 : FlipFlopJK port map(clk,'1',J0,K0,Q0,Q0N);
JK1 : FlipFlopJK port map(clk,'1',J1,K1,Q1,Q1N);
JK2 : FlipFlopJK port map(clk,'1',J2,K2,Q2,Q2N);
JK3 : FlipFlopJK port map(clk,'1',J3,K3,Q3,Q3N);

M_unid(0) <= Q0;
M_unid(1) <= Q1;
M_unid(2) <= Q2;
M_unid(3) <= Q3;

-- 
 en_min <= (Q0 and Q1N AND Q2N AND Q3);
--
--Decenas 

 DJ3 <= '0';
 DK3 <= '1';
 DJ2 <= DQ1 AND DQ0;
 DK2 <= DQ0;
 DJ1 <= DQ2N AND DQ0;
 DK1 <= DQ0;
 DJ0 <= '1';
 DK0 <= '1';

 JK0d : FlipFlopJK port map(clk,en_min,DJ0,DK0,DQ0,DQ0N);
 JK1d : FlipFlopJK port map(clk,en_min,DJ1,DK1,DQ1,DQ1N);
 JK2d : FlipFlopJK port map(clk,en_min,DJ2,DK2,DQ2,DQ2N);
 JK3d : FlipFlopJK port map(clk,en_min,DJ3,DK3,DQ3,DQ3N);

 M_dece(0) <= DQ0;
 M_dece(1) <= DQ1;
 M_dece(2) <= DQ2;
 M_dece(3) <= DQ3;

 --
 en_hor <= (Q0 and Q1N AND Q2N AND Q3 AND DQ0 AND DQ1N AND DQ2 AND DQ3N);
 -- Horas

 JE  <= HQ3 AND HQ0;
 KE  <= HQ1;
 HJ3 <= HQ2 AND HQ1 AND HQ0;
 HK3 <= HQ0;
 HJ2 <= HQ1 AND HQ0;
 HK2 <= HQ1 AND HQ0;
 HJ1 <= HQ3N AND HQ0;
 HK1 <= QE OR HQ0;
 HJ0 <= '1';
 HK0 <= '1'; 


 JKE : FlipFlopJK port map(clk,en_hor,JE,KE,QE,QEN);
 JK0H : FlipFlopJK port map(clk,en_hor,HJ0,HK0,HQ0,HQ0N);
 JK1H : FlipFlopJK port map(clk,en_hor,HJ1,HK1,HQ1,HQ1N);
 JK2H : FlipFlopJK port map(clk,en_hor,HJ2,HK2,HQ2,HQ2N);
 JK3H : FlipFlopJK port map(clk,en_hor,HJ3,HK3,HQ3,HQ3N);

 H_unid(0) <= HQ0;
 H_unid(1) <= HQ1;
 H_unid(2) <= HQ2;
 H_unid(3) <= HQ3;
 H_dece <= QE;



end Behavioral;

