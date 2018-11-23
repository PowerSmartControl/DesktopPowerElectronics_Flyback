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
END testbench;

ARCHITECTURE testbench_arch OF testbench IS
-- DUT component declaration
  COMPONENT system_controller_core is
  PORT ( 
    CLK  : in STD_LOGIC;
    nRST : in STD_LOGIC;
    ADC_START     : out std_logic;
    ADC_DONE      : in std_logic;
    CTRL_START    : out std_logic;
    CTRL_DONE     : in std_logic;
    PWM_ENABLE    : out std_logic;
    RUN           : in STD_LOGIC;
    TRIGGER       : in STD_LOGIC_VECTOR(9 downto 0));
  END COMPONENT system_controller_core;

  signal clk, nRst : std_logic := '0';
  signal adc_start, adc_done: std_logic;
  signal ctrl_start, ctrl_done: std_logic;
  signal pwm_enable: std_logic;
  signal run: std_logic;
  signal trigger: STD_LOGIC_VECTOR(9 downto 0);
  
  -- Clock period definitions
  constant clk_period   : time := 10 ns;

begin

  UUT : system_controller_core
  PORT MAP (
    CLK => clk,
    nRST => nRst,
    ADC_START => adc_start,
    ADC_DONE  => adc_done,
    CTRL_START => ctrl_start,
    CTRL_DONE  => ctrl_done,
    PWM_ENABLE => pwm_enable,
    RUN => run,
    TRIGGER => trigger);
    
  -- Clock process definition
  clk_process : process
  begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
  end process;
  
  -- ADC Done signal generation
  adc_done_gen : process
  begin
    adc_done <= '1';
    wait until adc_start = '1';
    wait for 4*clk_period;    --  Delay could be up to 8*clk_period (80ns, one ADC clk)
    adc_done <= '0';
    wait for 1360 ns;         --  Acquisition delay 1280+80 ns
  end process;
  
  -- Voltage control done signal generation
  ctrl_done_gen : process
  begin
    ctrl_done <= '0';
    wait until ctrl_start = '1';
    wait for 400 ns;    --  V control Delay 400ns
    ctrl_done <= '1';
    wait for clk_period; -- Signal stays high 1clk
  end process;

  stimulus: process
  begin
    nRst <= '0';
    trigger <= "1010111100";
  wait for 30 ns;
    nRst <= '1';
  wait for 970 ns;
    run <= '1';
  wait;
end process stimulus;

end testbench_arch;
