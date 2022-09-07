----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.09.2022 21:15:16
-- Design Name: 
-- Module Name: Moteur - Behavioral
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
use IEEE.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- duty_cycle 0 100 0 marche 100% arriere ; 100 => marche avant 100 ; 50 rien 
-- 0 a 200
entity Moteur is
generic(
    divider_freq : integer range 128 to 32716 :=200
);
 Port ( 
    
    duty_cycle : in std_logic_vector(7 downto 0);
    PWM_dir_in : in std_logic;  
    clk_in : in std_logic;
    
    PWM_dir_out : out std_logic;   
    PWM_out : out std_logic
 );
end Moteur;

architecture Behavioral of Moteur is
signal divider : integer :=0;
signal counter_freq_div : integer :=0;
signal buf_PWM_out : std_logic;
signal buf_duty_cycle : integer:=0;
signal buf_PWM_dir_in : integer:=0;
signal  buf_PWM_dir_out : std_logic;
signal buf_duty_cycle_save : integer:=0;
begin
divider <= divider_freq;
    process(clk_in)
    begin
        if(rising_edge(clk_in)) then 
            buf_PWM_out <= '0';
            counter_freq_div <= counter_freq_div +1;
            if(counter_freq_div>divider) then 
                counter_freq_div <= 0;
            end if;
            if(counter_freq_div<(buf_duty_cycle_save*divider/100)) then 
                buf_PWM_out <= '1';
            end if;
        end if;    
    if(buf_duty_cycle > 100) then 
        buf_PWM_dir_out <= '1';
        buf_duty_cycle_save<=buf_duty_cycle-100;
    elsif(buf_duty_cycle > 200) then 
         buf_duty_cycle_save<=0;
    else 
        buf_PWM_dir_out <= '0';
        buf_duty_cycle_save<=100-buf_duty_cycle;
    end if;
    end process;
    -- 1 marche avant ; 0 marche arriere

buf_duty_cycle <= to_integer(unsigned(duty_cycle));
buf_duty_cycle_save <= to_integer(unsigned(duty_cycle));
PWM_out <= buf_PWM_out;
PWM_dir_out<=buf_PWM_dir_out;
end Behavioral;
