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
--  Vitesse en mm/s 12b -2047 to 2047   
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
    Vmax_size: integer :=0;
    Dmax_size : integer :=0;
    divider_freq : integer range 128 to 32716 :=200
);
 Port ( 
    Vitesse : in std_logic_vector(Vmax_size-1 downto 0);
    
    PWM_dir_out : out std_logic;   
    PWM_out : out std_logic;
    clk_in : in std_logic
 );
end Moteur;

architecture Behavioral of Moteur is
constant V_max: integer:= 2**(Vmax_size-1) -1;
constant D_max: integer:= 2**(Dmax_size-1) -1;
signal divider : integer :=0;
signal counter_freq_div : integer :=0;
signal s_Vitesse_abs : integer range 0 to 2048 :=0;
signal buf_PWM_out : std_logic;
begin
divider <= divider_freq;

s_Vitesse_abs <= abs( to_integer(signed(Vitesse)));
--buf_duty_cycle_save <= to_integer(unsigned(duty_cycle));
PWM_out <= buf_PWM_out;
--PWM_dir_out<=buf_PWM_dir_out;
    process(clk_in)
    begin
        if(rising_edge(clk_in)) then 
            buf_PWM_out <= '0';
            counter_freq_div <= counter_freq_div +1;
            if(counter_freq_div>divider) then 
                counter_freq_div <= 0;
            end if;
            if(counter_freq_div<(s_Vitesse_abs*divider/V_max)) then 
                buf_PWM_out <= '1';
            end if;
        end if; 
    end process;
    -- a voir le sens du motor
    with Vitesse(11) select 
        PWM_dir_out <= '0' when '1',
        '1' when others;
end Behavioral;
