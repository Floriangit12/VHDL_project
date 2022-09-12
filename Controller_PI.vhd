----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.09.2022 21:52:47
-- Design Name: 
-- Module Name: Controller_PI - Behavioral
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

entity Controller_PI is
    generic(
        Vmax_size: integer :=1;
        Dmax_size : integer :=1;
        
        Pcoeff : integer:=1;
        Icoeff : integer:=1
    );
    Port (
    Vconsign : in std_logic_vector(Vmax_size-1 downto 0);
    Vitesse : in std_logic_vector(Vmax_size-1 downto 0);
    Update_vitesse_in : in std_logic;
    reset : in std_logic;
    
    Update_vitesse_out : out std_logic;
    Vitesse_out : out std_logic_vector(Vmax_size-1 downto 0)
    
    );
end Controller_PI;

architecture Behavioral of Controller_PI is
constant V_max: integer:= 2**(Vmax_size-1) -1;
constant D_max: integer:= 2**(Dmax_size-1) -1;
signal s_Vconsign : integer range -V_max to V_max:=0;
signal output_vitesse : integer range -V_max to V_max:=0;
signal current_vitesse : integer range -V_max to V_max:=0;
signal diff_vitesse : integer range -32000 to 32000 :=0;
signal integral_error : integer range -32000 to 32000:=0;

begin
    process(Update_vitesse_in)
    begin 
    if(reset = '1') then 
        output_vitesse <= 0;
        integral_error <= 0;
        diff_vitesse <= 0;
    end if;
    if(rising_edge(Update_vitesse_in)) then
        diff_vitesse <= s_Vconsign-current_vitesse;
        integral_error<=integral_error+diff_vitesse; 
        output_vitesse <= Pcoeff*diff_vitesse/4 + integral_error*Icoeff/4;
    end if;
    end process;

    s_Vconsign <= to_integer(signed(Vconsign));
    current_vitesse <= to_integer(signed(Vitesse));
    Update_vitesse_out <= Update_vitesse_in;
    Vitesse_out <= std_logic_vector((TO_SIGNED(output_vitesse,Vmax_size-1)));
end Behavioral;
