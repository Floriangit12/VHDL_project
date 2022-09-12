----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.09.2022 20:59:44
-- Design Name: 
-- Module Name: Draw_sqare - Behavioral
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

entity Draw_sqare is
    generic(
        Speed_motor_forward: integer :=0; -- range 0 to 100 %
        Speed_motor_back: integer :=0; -- range 0 to 100%
        Speed_motor_turn: integer := 0; -- range 0 to 100%
        R_milieu_chassi : integer :=1; -- in mm
        Vmax_size: integer :=0;
        Dmax_size : integer :=0
    );
    Port( 
        clk_in : std_logic;
        Distance : in std_logic_vector(Dmax_size-1 downto 0);
        
        Vitesse_motor_1 : out std_logic_vector(Vmax_size-1 downto 0);
        Sens_motor_1 : out std_logic;
        Vitesse_motor_2 : out std_logic_vector(Vmax_size-1 downto 0);
        Sens_motor_2 : out std_logic
    );
end Draw_sqare;

architecture Behavioral of Draw_sqare is
constant V_max: integer:= 2**(Vmax_size-1) -1;
constant D_max: integer:= 2**(Dmax_size-1) -1;

constant distance_requiere : integer :=R_milieu_chassi*(78/100); -- in mm   -- 78/100 = pi/4

signal s_distance : integer range -D_max to D_max :=0;
signal s_vitesse_mot1 : integer range -V_max to V_max :=0;
signal s_vitesse_mot2 : integer range -V_max to V_max :=0;

signal marche_avant : std_logic:='0';
signal marche_arriere : std_logic:='0';
signal left_dir : std_logic:='0';
signal flag_turn : std_logic:='0';
signal mode : integer range 0 to 4:=0; --0 stop, 1 marche avant, 2 left , 3 right 4 back 
signal currant_distance_min : integer range -D_max to D_max :=0;
signal currant_distance_max : integer range -D_max to D_max :=500;
signal next_distance : integer range -D_max to D_max :=500;
begin
s_distance <= to_integer(signed(Distance));
Vitesse_motor_1 <= std_logic_vector((TO_SIGNED(s_vitesse_mot1,Vmax_size-1)));
Vitesse_motor_2 <= std_logic_vector((TO_SIGNED(s_vitesse_mot2,Vmax_size-1)));
    main : process(clk_in) 
    begin
        if(rising_edge(clk_in)) then 
            if(s_distance>=currant_distance_max)then
                currant_distance_min<=currant_distance_max;
                currant_distance_max <= next_distance;
            end if;
            if(s_distance> currant_distance_min and s_distance<currant_distance_max) then  -- 1 ligne
                mode <= 1;
                next_distance <= currant_distance_max+distance_requiere;
            end if;
            if(s_distance>=currant_distance_min and s_distance < currant_distance_min) then  -- turn ligne
                mode<= 2;
                next_distance <= currant_distance_max+500;
            end if;
            if(s_distance>=500+distance_requiere and s_distance < distance_requiere+1000) then  -- 2 ligne
                mode<= 1;
                next_distance <= currant_distance_max+distance_requiere;
            end if;
            if(s_distance>=1000+distance_requiere and s_distance < distance_requiere+1000) then  -- turn ligne
                mode<= 2;
                next_distance <= currant_distance_max+500;
            end if;
            if(s_distance>=1000+distance_requiere and s_distance < distance_requiere+1000) then  -- 3 ligne
                mode<= 1;
                next_distance <= currant_distance_max+distance_requiere;
            end if;
            if(s_distance>=1000+distance_requiere and s_distance < distance_requiere+1000) then  -- turn ligne
                mode<= 2;
                next_distance <= currant_distance_max+500;
            end if;
            if(s_distance>=1000+distance_requiere and s_distance < distance_requiere+1000) then  -- 4 ligne
                mode<= 1;
                next_distance <= currant_distance_max+distance_requiere;
            end if;
            if(s_distance>next_distance) then  -- fin ligne
                mode<= 0;
            end if;            
        end if;
    end process main;
    
    -- Motor control 
    with mode select 
        s_vitesse_mot1 <= 0 when 0, 
        V_max*Speed_motor_forward/100 when 1, 
        -V_max*Speed_motor_turn/100 when 2, 
        V_max*Speed_motor_turn/100 when 3,
        -V_max*Speed_motor_back/100 when 4,
        0 when others;
        
    with mode select 
        s_vitesse_mot2 <= 0 when 0, 
        V_max*Speed_motor_forward/100 when 1, 
        V_max*Speed_motor_turn/100 when 2, 
        -V_max*Speed_motor_turn/100 when 3,
        -V_max*Speed_motor_back/100 when 4,
        0 when others;

end Behavioral;
