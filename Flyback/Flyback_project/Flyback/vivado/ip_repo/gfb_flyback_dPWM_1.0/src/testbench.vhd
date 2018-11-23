----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.07.2015 08:38:06
-- Design Name: 
-- Module Name: testbench - Behavioral
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

ENTITY testbench IS
--  Port ( );
END testbench;

ARCHITECTURE testbench_arch OF testbench IS
-- DUT component declaration
COMPONENT dpwm_core is
    generic (
       width : integer := 999); -- Resolution
    port ( clk : in STD_LOGIC;
       rstn : in STD_LOGIC;
       enable : in STD_LOGIC;
       ref_val : in STD_LOGIC_VECTOR (9 downto 0);
       pwm : out STD_LOGIC);
END COMPONENT dpwm_core;

SIGNAL CLK : STD_LOGIC;
SIGNAL nRESET : STD_LOGIC;
SIGNAL REF: STD_LOGIC_VECTOR (9 DOWNTO 0);
SIGNAL ENABLE : STD_LOGIC;
SIGNAL PWM : STD_LOGIC;
constant ClockPeriod : Time := 10 ns;

begin

UUT : dpwm_core
PORT MAP (
    clk => CLK,
    RSTN => nRESET,
    ref_val => REF,
    enable => ENABLE,
    pwm => PWM);
    
clock: process
begin
    CLK <= '1';
    wait for 100 ns;
    loop
      wait for (ClockPeriod / 2);
      CLK <= not CLK;
    end loop;
end process clock;

stimulus: process
begin
    nRESET <= '0';
    ENABLE <= '0';
    REF <= (others => '0');
  wait for 200 ns;
    nRESET <= '1';
    ENABLE <= '1';
    REF <= "0111110100";  -- 500d
  wait for 50 us;
    REF <= "0000000001";  -- 1d
  wait for 50 us;
    REF <= "0000000001";
  wait for 50 us;
    ENABLE <= '0';
  wait;    
end process stimulus;

end testbench_arch;
