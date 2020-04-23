LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Digitos_test IS
END  Digitos_test;
 
ARCHITECTURE behavior OF  Digitos_test IS 
	
    COMPONENT DigitosA7Seg
    Port ( clk : in  STD_LOGIC;
    BCD1 : in STD_LOGIC_VECTOR (3 downto 0);
    BCD2 : in STD_LOGIC_VECTOR (3 downto 0);
    BCD3 : in STD_LOGIC_VECTOR (3 downto 0);
    BCD4 : in STD_LOGIC_VECTOR (3 downto 0);

    D1 : out STD_LOGIC_VECTOR (6 downto 0);
    D2 : out STD_LOGIC_VECTOR (6 downto 0);
    D3 : out STD_LOGIC_VECTOR (6 downto 0);
    D4 : out STD_LOGIC_VECTOR (6 downto 0));
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal BCD1 : STD_LOGIC_VECTOR (3 downto 0):= (others => '0');
   signal BCD2 : STD_LOGIC_VECTOR (3 downto 0):= (others => '0');
   signal BCD3 : STD_LOGIC_VECTOR (3 downto 0):= (others => '0');
   signal BCD4 : STD_LOGIC_VECTOR (3 downto 0):= (others => '0');

     --Outputs
    signal D1 : STD_LOGIC_VECTOR (6 downto 0):= (others => '0');
    signal D2 : STD_LOGIC_VECTOR (6 downto 0):= (others => '0');
    signal D3 : STD_LOGIC_VECTOR (6 downto 0):= (others => '0');
    signal D4 : STD_LOGIC_VECTOR (6 downto 0):= (others => '0');

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DigitosA7Seg PORT MAP (
          clk => clk,
          BCD1 => BCD1,
          BCD2 => BCD2,
          BCD3 => BCD3,
          BCD4 => BCD4,
          D1 => D1,
          D2 => D2,
          D3 => D3,
          D4 => D4
        );

    CLK_process :process
        begin
             CLK <= '0';
             wait for CLK_period/2;
             CLK <= '1';
             wait for CLK_period/2;
        end process;

        BCD1 <= "1001";
        BCD2 <= "0001";
        BCD3 <= "0010";
        BCD4 <= "0100";
END;
