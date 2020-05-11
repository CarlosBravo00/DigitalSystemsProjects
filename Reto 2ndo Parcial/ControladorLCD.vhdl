library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControladorLCD is
    Port ( 
    clk : in  STD_LOGIC;
    RESET : in  STD_LOGIC;
    RS : in  STD_LOGIC;
    RWDATA : in  STD_LOGIC;
    INSTRUCTIONS : in STD_LOGIC_VECTOR (7 downto 0);

    SIGNAL_RS : OUT  STD_LOGIC;
    SIGNAL_RW : OUT STD_LOGIC;
    SIGNAL_EN : OUT  STD_LOGIC;
    DATA  : out STD_LOGIC_VECTOR (7 downto 0));

end  ControladorLCD;

architecture arch of ControladorLCD is

TYPE STATE IS(IDLE, READY, SEND);
SIGNAL  estado : STATE;

begin
    process(clk)
    begin
        if rising_edge(clk)
        then
            case estado is
                when IDLE=>
                  estado <=READY;
                when READY=>
                  estado <=SEND;
                when SEND=>
                  estado <=IDLE;

                when others => null;
                    end case;
                else null;
            end if;
    end process;

end arch;
