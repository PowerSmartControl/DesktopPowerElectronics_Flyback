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

entity testbench IS
end testbench;

architecture testbench_arch OF testbench IS
-- DUT component declaration
  component ad7476_IF is
    Port    (    
    CLK      : in std_logic;         
    nRST     : in std_logic;
    -- Pmod interface signals
    SDATA    : in std_logic;
    SCLK     : out std_logic;
    nCS      : out std_logic;   
    -- User interface signals
    DATA     : out std_logic_vector(11 downto 0);
    START    : in std_logic; 
    DONE     : out std_logic);
  end component ad7476_IF;

  signal CLK : STD_LOGIC;
  signal nRST : STD_LOGIC;
  signal SDATA: std_logic;
  signal SCLK: std_logic;
  signal nCS: std_logic;
  signal DATA: STD_LOGIC_VECTOR(11 downto 0);
  signal START: std_logic;
  signal DONE: std_logic;

  constant clk_period   : time := 10 ns;
  constant acq_period   : time := 10 us;
  constant acq_duration : time := 100 ns;

begin

  UUT : ad7476_IF
  PORT MAP (
    CLK => CLK,
    nRST => nRST,
    SDATA => SDATA,
    SCLK => SCLK,
    nCS => nCS,
    DATA => DATA,
    START => START,
    DONE => DONE);
    
  -- Clock process definition
  clk_process : process
  begin
    CLK <= '0';
    wait for clk_period/2;
    CLK <= '1';
    wait for clk_period/2;
  end process;
  
  -- Acquisition generation
  acq_launch : process
  begin
    START <= '0';
    wait for acq_period;
    START <= '1';
    wait until done = '0';    -- START signal must wait for DONE gone low
    wait for clk_period;      -- Plus one clk dealy
  end process;

  stimulus: process
  begin
    nRST <= '0';
    SDATA <= '1';
    wait for 30 ns;
    nRST <= '1';
    wait;
  end process stimulus;

end testbench_arch;
