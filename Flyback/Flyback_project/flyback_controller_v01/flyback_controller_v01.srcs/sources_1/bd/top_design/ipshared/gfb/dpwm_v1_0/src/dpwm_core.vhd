----------------------------------------------------------------------------------
-- Company: 
-- Engineer: gfb
-- 
-- Create Date: 20.07.2015 15:23:37
-- Design Name: 
-- Module Name: dpwm_core - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dpwm_core is
    generic (
           width : integer := 999); -- Resolution
    port ( clk : in STD_LOGIC;
           rstn : in STD_LOGIC;
           enable : in STD_LOGIC;
           ref_val : in STD_LOGIC_VECTOR (9 downto 0);
           pwm : out STD_LOGIC);
end dpwm_core;

architecture Behavioral of dpwm_core is
    signal ramp : unsigned (15 downto 0);
    signal reg_ref_val : std_logic_vector (9 downto 0);
begin 
    counter: process (clk, rstn)
    begin
      if rstn = '0' then
        ramp <= (others => '0');
        reg_ref_val <=  (others => '0');
      elsif rising_edge(clk)then
        if enable = '0' then
			ramp <= (others => '0');
			reg_ref_val <=  (others => '0');
		else 
			if ramp < width then
				ramp <= ramp + 1;
			else
				ramp <= (others => '0');
				reg_ref_val <= ref_val; --Load the new reference value
			end if;
		end if;
      end if;
    end process;
    pwm <= '1' when ((ramp < unsigned (ref_val)) AND (enable = '1')) else '0';
    
end Behavioral;