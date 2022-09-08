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
    
    Capteur_1 : in std_logic;
    Capteur_2 : in std_logic;
    
    Vitesse : out std_logic_vector( downto  );
    Flag_marche : out std_logic


 );
end Moteur;

architecture Behavioral of Moteur is
signal sens_moteur : std_logic;
signal s_vitesse : integer;
begin
divider <= divider_freq;
    process(clk_in)
    begin
        if(rising_edge(Capteur_1) then 
              sens_moteur 
        end if;
end Behavioral;
