----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.09.2022 20:24:17
-- Design Name: 
-- Module Name: Sensor - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- Update_vitesse pulse when new value
-- Flag_motor: 1 => marche avant / 0 marche arriere
-- Vitesse en mm/s : 12b => 4,095 m/s
-- Distance en mm max value : 12b => 4,095 m
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- non
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

entity Sensor is
generic(
    Vmax_size: integer :=1; -- in bit signed 
    Dmax_size : integer :=1; -- in bit signed 

    pi : integer:=3;
    freq : integer:=3;
    R : integer:=3
);
 Port ( 
    clk_in : in std_logic;
    Capteur_1 : in std_logic;
    Capteur_2 : in std_logic;
    
    Vitesse : out std_logic_vector(Vmax_size-1 downto 0);
    Distance : out std_logic_vector(Dmax_size-1 downto 0); 
    Update_sensor: out std_logic;
    Flag_motor : out std_logic
 );
end Sensor;

architecture Behavioral of Sensor is
constant V_max: integer:= 2**(Vmax_size-1) -1;
constant D_max: integer:= 2**(Dmax_size-1) -1;
constant npulse_tour :integer :=4; -- tour/mm
constant angle_pulse : integer :=0; -- angle d' une pluse sensor


signal pulse_counter_cap : integer range -1000 to 1000 :=0; -- recalculer recalculer val max
signal pulse_counter : integer range -1000 to 1000 :=0; -- recalculer val max
signal detection_sens : std_logic:='0';
signal sens_moteur : std_logic:='1';
signal s_vitesse : integer range -V_max to V_max:=0;
signal s_distance : integer range -D_max to D_max:=0;
signal s_Update_sensor : std_logic:='0';
signal delta_distance : integer range -D_max to D_max; -- refaire val max
begin

-- detection sens du moteur 
detection_sens <= Capteur_1 xor Capteur_2;
vitesse <= std_logic_vector((TO_SIGNED(s_vitesse,12)));
distance<=std_logic_vector((TO_SIGNED(s_distance,12)));
Update_sensor <= s_Update_sensor;
-- calcul -- distance  
    process(Capteur_1)
    begin
        if(rising_edge(Capteur_1)) then 
            s_Update_sensor <= '1';
            if detection_sens='1' then 
                s_distance <= s_distance + 2*pi*R*angle_pulse/npulse_tour;
                delta_distance<= 2*pi*R*angle_pulse/npulse_tour;
            else 
                 s_distance <= s_distance - 2*pi*R*angle_pulse/npulse_tour;
                 delta_distance<= - 2*pi*R*angle_pulse/npulse_tour;
            end if;
        end if;
    end process;
  -- calcul vitesse 
    process(clk_in)
    begin
        if(rising_edge(clk_in)) then
            if(Capteur_1='1') then 
                pulse_counter <= pulse_counter+1;
            end if;    
        end if;
        if(Capteur_1='0') then
            pulse_counter<=0;
            s_vitesse <= delta_distance*freq/(pulse_counter);
        end if; 
    end process;
end Behavioral;
