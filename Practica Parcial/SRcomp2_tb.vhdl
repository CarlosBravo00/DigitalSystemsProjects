LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
  
    COMPONENT addsub
    PORT(
        A : IN BIT_VECTOR(7 DOWNTO 0);
        B : IN BIT_VECTOR(7 DOWNTO 0); 
        T : IN BIT;
        C_FLAG : OUT BIT;
        OV_FLAG : OUT BIT;
        R : OUT BIT_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;

   --Inputs
   signal A : BIT_VECTOR(7 DOWNTO 0):= (others => '0');
   signal B : BIT_VECTOR(7 DOWNTO 0):= (others => '0');
   signal T : BIT := '0';

 	--Outputs
    signal C_FLAG : BIT:= '0';
    signal OV_FLAG : BIT:= '0';
    signal R : BIT_VECTOR(7 DOWNTO 0):= (others => '0');
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: addsub PORT MAP (
            A => A,
            B => B,
            T => T,
            C_FLAG => C_FLAG,
            OV_FLAG => OV_FLAG,
            R => R
        );

   -- Stimulus process
   stim_proc: process
   begin		
   A <= "00000000";
   B <= "00000000";
   T <= '0';

   -- 2 casos de suma de números positivos
        wait for 10 ns;
        A <= "00101000"; --40
        B <= "00110100"; --52
        T <= '0';	

        wait for 100 ns;	
        A <= "01010010"; --82
        B <= "00001111"; --15
        T <= '0';
               
    -- 2 casos de suma de número positivo y número negativo
        wait for 100 ns;	
        A <= "00101000"; -- 40
        B <= "11001011"; --(-53)
        T <= '0';

        wait for 100 ns;	
        A <= "01000000"; -- 64
        B <= "10000000"; -- (-128)
        T <= '0';

    -- 2 casos de suma de número negativo y número positivo
        wait for 100 ns;	
        A <= "10111011"; --(-69)
        B <= "00000011"; -- 3
        T <= '0';
        
        wait for 100 ns;	
        A <= "10011100"; --(-100)
        B <= "00110010"; -- 50
        T <= '0';

    -- 2 casos de overflow suma
        wait for 100 ns;	
        A <= "01000000"; --64
        B <= "01000000"; --64
        T <= '0';
        
        wait for 100 ns;	
        A <= "01100100"; --100
        B <= "00110010"; --50
        T <= '0';

    -- 2 casos de overflow resta
        wait for 100 ns;	
        A <= "10011100"; --(-100)
        B <= "00110010"; --50
        T <= '1';

        wait for 100 ns;	
        A <= "01100010"; --98
        B <= "11100001"; --(-31)
        T <= '1';
        
    -- 2 casos con carry out suma    
        wait for 100 ns;	
        A <= "01001001"; -- 73
        B <= "11110011"; -- (-13)
        T <= '0';

        wait for 100 ns;
        A <= "01011111"; -- 95 
        B <= "11111010"; -- (-6)
        T <= '0';

    -- 2 casos con carry out resta
        wait for 100 ns;	
        A <= "01000000"; --64
        B <= "00100000"; --32
        T <= '1';

        wait for 100 ns;	
        A <= "00011110"; -- 30
        B <= "00010100"; -- 20
        T <= '1'; 

        wait for 100 ns;
        A <= "00000000";
        B <= "00000000";
        T <= '0';
        wait;
   end process;
END;
