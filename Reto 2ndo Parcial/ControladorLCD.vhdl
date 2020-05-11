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

--    component BCDto4Display is
--         Port ( BCD_in : in STD_LOGIC_VECTOR (3 downto 0);
--               LED_out : out STD_LOGIC_VECTOR (6 downto 0));
--        end  component;

TYPE STATE IS(IDLE, READY, SEND);
SIGNAL  estado : STATE;

--
--signal estado: std_logic_vector(3 downto 0):="0000";
--signal LED_out1,LED_out2,LED_out3,LED_out4 : STD_LOGIC_VECTOR (6 downto 0);


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
