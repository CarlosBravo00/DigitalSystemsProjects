LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

ENTITY testControladorLCD  IS
END testControladorLCD ;
 
ARCHITECTURE behavior OF testControladorLCD  IS 
 
    COMPONENT ControladorLCD
    PORT(
       clk : in  STD_LOGIC;
       RESET : in  STD_LOGIC;
       RS : in  STD_LOGIC;
       RWDATA : in  STD_LOGIC;
       DATA_INSTRUCTIONS : in STD_LOGIC_VECTOR (7 downto 0);
   
       SIGNAL_RS : OUT  STD_LOGIC;
       SIGNAL_RW : OUT STD_LOGIC;
       SIGNAL_EN : OUT  STD_LOGIC;
       DATA  : out STD_LOGIC_VECTOR (7 downto 0));
    END COMPONENT;

   signal CLK : STD_LOGIC := '0';
   signal RESET: STD_LOGIC := '0';
   signal RS : STD_LOGIC := '0';
   signal RWDATA : STD_LOGIC := '0';
   signal DATA_INSTRUCTIONS: STD_LOGIC_VECTOR (7 downto 0) := "00000000";

   signal SIGNAL_RS : STD_LOGIC := '0';
   signal SIGNAL_RW : STD_LOGIC := '0';
   signal SIGNAL_EN : STD_LOGIC := '0';
   signal DATA : STD_LOGIC_VECTOR (7 downto 0) := "00000000";

   constant CLK_period : time := 50 ns;
   

 
BEGIN
   uut: ControladorLCD PORT MAP (
       CLK => CLK,
       RESET => RESET,
       RS => RS,
       RWDATA => RWDATA,
       DATA_INSTRUCTIONS => DATA_INSTRUCTIONS,
    
       SIGNAL_RS => SIGNAL_RS,
       SIGNAL_RW => SIGNAL_RW, 
       SIGNAL_EN => SIGNAL_EN,
       DATA => DATA

        );

stimulus : process 

      file fin : TEXT open READ_MODE is "input.txt";
      variable current_read_line : line;
      variable current_read_field : string(1 to 4);
      variable current_read_data : std_logic;
      variable current_read_datal : std_logic_vector(7 downto 0);
      variable current_write_line : line;

      file fout : TEXT open WRITE_MODE is "output.txt"; 
      variable current_line :line; 

      begin 
      readFile : while (not endfile(Fin)) loop
       readline(fin, current_read_line);
       read(current_read_line, current_read_field);
       
       if (current_read_field(1 to 3) = string'("NEW")) then 
       wait for 200 ns;

         if (SIGNAL_RS = '0')  and (SIGNAL_EN = '1') then
           write(current_line, string'("instr("));
           write(current_line, to_integer(signed(DATA)));
           write(current_line, string'(");"));
           writeline(fout, current_line);

         elsif (SIGNAL_RS = '1') and (SIGNAL_EN = '1') then
            write(current_line, string'("data("));
            write(current_line, to_integer(signed(DATA)));
            write(current_line, string'(");"));  
            writeline(fout, current_line);

         end if;

       wait for 200 ns;

       else 
       if (current_read_field(1 to 3) = string'("DAT")) then 
          read(current_read_line, current_read_datal);

           DATA_INSTRUCTIONS <= current_read_datal;

       else 
           read(current_read_line, current_read_data);

           if (current_read_field(1 to 3) = string'("RES")) then  
              RESET <= current_read_data;
              elsif  (current_read_field(1 to 3) = string'("RWD"))  then
                  RWDATA <= current_read_data;
                   elsif  (current_read_field(1 to 2) = string'("RS"))  then
                       RS <= current_read_data;
               else null;           
            end if;
          end if;
      end if;
   
   end loop;

      wait;
      end process; 


 CLK_process :process
        begin
             CLK <= '0';
             wait for CLK_period/2;
             CLK <= '1';
             wait for CLK_period/2;
        end process;


END;
