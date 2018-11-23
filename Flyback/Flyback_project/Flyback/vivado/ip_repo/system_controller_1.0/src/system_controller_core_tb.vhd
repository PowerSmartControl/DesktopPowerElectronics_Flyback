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
COMPONENT system_controller_core is
PORT ( 
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC;
    ADC_START     : out std_logic;
    ADC_DONE      : in std_logic;
    CTRL_START    : out std_logic;
    CTRL_READY    : in std_logic;
    CTRL_DONE     : in std_logic;
    PWM_ENABLE    : out std_logic;
    RUN           : in STD_LOGIC;
    TRIGGER       : in STD_LOGIC_VECTOR(9 downto 0));
END COMPONENT system_controller_core;

SIGNAL CLK : STD_LOGIC;
SIGNAL nRESET : STD_LOGIC;
SIGNAL adc_start, adc_done: std_logic;
SIGNAL ctrl_start, ctrl_done, ready: std_logic;
SIGNAL pwm_enable: std_logic;
SIGNAL run: std_logic;
SIGNAL trigger: STD_LOGIC_VECTOR(9 downto 0);
constant ClockPeriod : Time := 10 ns;

begin

UUT : system_controller_core
PORT MAP (
    clk => CLK,
    rstn => nRESET,
    ADC_START => adc_start,
    ADC_DONE => adc_done,
    CTRL_START => ctrl_start,
    CTRL_READY => ctrl_ready,
    CTRL_DONE => ctrl_done,
    PWM_ENABLE => pwm_enable,
    RUN => run,
    TRIGGER => trigger);
    
clock: process
begin
    CLK <= '1';
    loop
      wait for (ClockPeriod / 2);
      CLK <= not CLK;
    end loop;
end process clock;

stimulus: process
begin
    adc_done <= '1';
    ctrl_ready <= '1';
    ctrl_done <= '1';
    nRESET <= '0';
    trigger <= "1010111100";
  wait for 30 ns;
    nRESET <= '1';
  wait for 970 ns;
    run <= '1';
  wait for 7080 ns;
    adc_done <= '0';
  wait for 1280 ns;
    adc_done <= '1';
  wait for 2 us;
    ctrl_ready <= '1';
    ctrl_done <= '1';
  wait for 10 ns;
    ctrl_done <= '0';
  wait for 6.67 us;
    adc_done <= '0';
  wait for 1280 ns;
    adc_done <= '1';
  wait for 2 us;
    ctrl_done <= '1';
  wait for 10 ns;
    ctrl_done <= '0';
  wait for 8 us;
    run <= '1';
  wait for 2 us;
    adc_done <= '1';
  wait for 80 ns;
    adc_done <= '0';
  wait for 2 us;
    ctrl_done <= '1';
  wait for 10 ns;
    ctrl_done <= '0';
  wait for 2 us;
    run <= '1';
  wait;
end process stimulus;

end testbench_arch;
