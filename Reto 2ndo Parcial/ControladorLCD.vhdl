library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControladorLCD is
    Port ( 
    clk : in  STD_LOGIC;
    RESET : in  STD_LOGIC;
    RS : in  STD_LOGIC;
    RWDATA : in  STD_LOGIC;
    DATA_INSTRUCTIONS : in STD_LOGIC_VECTOR (7 downto 0);

    SIGNAL_RS : OUT  STD_LOGIC;
    SIGNAL_RW : OUT STD_LOGIC;
    SIGNAL_EN : OUT  STD_LOGIC;
    DATA  : out STD_LOGIC_VECTOR (7 downto 0));

end  ControladorLCD;

architecture arch of ControladorLCD is

TYPE STATE IS(IDLE, RUN);
SIGNAL  present: STATE;

begin

  process(CLK)
  begin 

  IF(RESET = '1') THEN
    present <= IDLE;
  END IF;

  if rising_edge(clk) then
   case present is
       when IDLE=>
          if (RWDATA = '1') then 
            present <= RUN;
              else
            SIGNAL_RS <= '0';
            SIGNAL_RW <= '0';
            SIGNAL_EN <= '0'; 
            DATA <= "00000000";
           present <=IDLE;
           end if; 
                    
       when RUN=>
            if  (RWDATA = '1') then 
            SIGNAL_RS <= RS;
            SIGNAL_RW <= RWDATA;
            SIGNAL_EN <= '1'; 
            DATA <= DATA_INSTRUCTIONS;
            else 
            present <= IDLE;
            end if;
            
       when others => null; 
            end case;
            end if;
    end process; 
end arch;
