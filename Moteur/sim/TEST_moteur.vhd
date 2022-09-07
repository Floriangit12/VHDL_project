----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.09.2022 21:25:01
-- Design Name: 
-- Module Name: TEST_moteur - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TEST_moteur is
--  Port ( );
end TEST_moteur;

architecture Behavioral of TEST_moteur is
    signal clk_in : std_logic:='0';
    signal duty_cycle : std_logic_vector(7 downto 0):="00000000";
    signal PWM_dir_in :  std_logic;  
    
    signal PWM_dir_out :  std_logic;   
    signal PWM_out :  std_logic;
--component Moteur
--    port();
--    end component;
begin
    UUT : entity work.Moteur port map(clk_in, duty_cycle, PWM_dir_in, PWM_dir_out, PWM_out);
clk : process 
begin 
    clk_in <= '1';
    wait for 4 ns;
    clk_in <= '0';
    wait for 4 ns;
end process clk;

main : process 
begin 
    duty_cycle<="00000000";
    PWM_dir_in<='1';
    wait for 1000 ns;
    duty_cycle<= "00000011";
    wait for 1000 ns;
    PWM_dir_in<='0';
    duty_cycle<= "00000111";
    wait for 1000 ns;
    PWM_dir_in<='1';
    duty_cycle<= "00001111";
    wait for 1000 ns;
    PWM_dir_in<='1';
    duty_cycle<= "00011111";
    wait for 1000 ns;
    PWM_dir_in<='1';
    duty_cycle<= "00111111";     
    wait for 1000 ns;
    PWM_dir_in<='0';
    duty_cycle<= "01111111";       
    wait for 1000 ns;
end process main;

end Behavioral;
