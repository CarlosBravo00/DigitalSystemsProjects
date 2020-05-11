library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControladorLCD is
    Port ( 
    clk : in  STD_LOGIC;
    RESET : in  STD_LOGIC;
    RS : in  STD_LOGIC;  --LCD module Register Select Signal
    RWDATA : in  STD_LOGIC;--LCD module Read/Write Select Signal
    DATA_INSTRUCTIONS : in STD_LOGIC_VECTOR (7 downto 0);

    SIGNAL_RS : OUT  STD_LOGIC; --LCD module Register Select Signal
    SIGNAL_RW : OUT STD_LOGIC;--LCD module Read/Write Select Signal
    SIGNAL_EN : OUT  STD_LOGIC;--Enable 
    DATA  : out STD_LOGIC_VECTOR (7 downto 0));

end  ControladorLCD;

architecture arch of ControladorLCD is

TYPE STATE IS(IDLE, RUN);
SIGNAL  present: STATE;

begin

  process(CLK)
  VARIABLE clk_count : INTEGER := 0; 
  begin 

  if rising_edge(clk)  then

  IF(RESET = '1') THEN
  SIGNAL_RS <= '0';
  SIGNAL_RW <= '0';
  SIGNAL_EN <= '0'; 
  DATA <= "00000000";
  present <= IDLE;
  else  
   case present is
       when IDLE=>
          if (RWDATA = '1') then 
            SIGNAL_RS <= RS;
            SIGNAL_RW <= RWDATA;
            DATA <= DATA_INSTRUCTIONS;
            present <= RUN;
              else
            SIGNAL_RS <= '0';
            SIGNAL_RW <= '0';
            SIGNAL_EN <= '0'; 
            DATA <= "00000000";
           present <=IDLE;
           end if; 
                    
       when RUN=>
            if(clk_count <= 5) then --wait on for 5 clk periods
              clk_count := clk_count + 1;
              SIGNAL_EN <= '1';
              present <= RUN;
            else 
              SIGNAL_EN <= '0';
              clk_count := 0;
              present <= IDLE;   
           end if;
                      
       when others => null; 
            end case;
            end if;
        end if;
    end process; 

end arch;
