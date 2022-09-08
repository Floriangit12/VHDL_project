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
    clk_in : in std_logic;
    Capteur_1 : in std_logic;
    Capteur_2 : in std_logic;
    
    Vitesse : out std_logic_vector( downto  );
    Flag_marche : out std_logic


 );
end Moteur;

architecture Behavioral of Moteur is
signal sens_moteur : std_logic:='1';
signal detection_sens : std_logic:='1';
signal s_vitesse : integer:=0;
signal pulse_counter_cap : integer:=0;
signal pulse_counter : integer:=0;
begin
divider <= divider_freq;
    process(clk_in)
    begin
    detection_sens = Capteur_1 xor Capteur_2;
        if(rising_edge(Capteur_1) then 
              pulse_counter_cap=pulse_counter_cap +1;

              sens <== detection_sens;
        end if;
        if(rising_edge(clk_in) then            
          if(pulse_counter_cap=10) then
              s_vitesse= 2*pi*R*pulse_counter_cap*freq/(pulse_counter);
          elsif(pulse_counter_cap>10)
            pulse_counter= 0;
            pulse_counter_cap=0;
          end if;
        end if;
end Behavioral;
