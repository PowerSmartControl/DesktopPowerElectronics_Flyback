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
COMPONENT system_controller_DL_core is
PORT ( 
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC;
    ADC_START     : out std_logic;
    ADC_DONE      : in std_logic;
    CTRL_V_START    : out std_logic;
    CTRL_I_START    : out std_logic;        
    CTRL_V_DONE     : in std_logic;
    CTRL_I_DONE     : in std_logic;
    PWM_ENABLE    : out std_logic;
    RUN           : in STD_LOGIC;
    TRIGGER       : in STD_LOGIC_VECTOR(9 downto 0));
END COMPONENT system_controller_DL_core;

SIGNAL CLK : STD_LOGIC;
SIGNAL nRESET : STD_LOGIC;
SIGNAL adc_start: std_logic;
SIGNAL adc_done: std_logic;
SIGNAL ctrl_v_start: std_logic;
SIGNAL ctrl_i_start: std_logic;
SIGNAL ctrl_v_done: std_logic;
SIGNAL ctrl_i_done: std_logic;
SIGNAL pwm_enable: std_logic;
SIGNAL run: std_logic;
SIGNAL trigger: STD_LOGIC_VECTOR(9 downto 0);
constant ClockPeriod : Time := 10 ns;

begin

UUT : system_controller_DL_core
PORT MAP (
    clk => CLK,
    rstn => nRESET,
    ADC_START => adc_start,
    ADC_DONE => adc_done,
    CTRL_V_START => ctrl_v_start,
    CTRL_I_START => ctrl_i_start,
    CTRL_V_DONE => ctrl_v_done,
    CTRL_I_DONE => ctrl_i_done,
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
    nRESET <= '0';
    adc_done <= '0';
    ctrl_v_done <= '0';
    ctrl_i_done <= '0';
    run <= '0';
    trigger <= "0111110100";
  wait for 30 ns;
    nRESET <= '1';
  wait for 970 ns;
    run <= '1';
  wait for 6.3 us;
    adc_done <= '1';
  wait for 80 ns;
    adc_done <= '0';
  wait for 1 us;
    ctrl_v_done <= '1';
  wait for 10 ns;
    ctrl_v_done <= '0';
  wait for 1 us;
    ctrl_i_done <= '1';
  wait for 10 ns;
    ctrl_i_done <= '0';
  wait for 8 us;
    adc_done <= '1';
  wait for 80 ns;
    adc_done <= '0';
  wait for 2 us;
    ctrl_v_done <= '1';
  wait for 10 ns;
    ctrl_v_done <= '0';
  wait for 8 us;
    run <= '1';
  wait for 2 us;
    adc_done <= '1';
  wait for 80 ns;
    adc_done <= '0';
  wait for 2 us;
    ctrl_v_done <= '1';
  wait for 10 ns;
    ctrl_v_done <= '0';
  wait for 2 us;
    run <= '1';
  wait;
end process stimulus;

end testbench_arch;
