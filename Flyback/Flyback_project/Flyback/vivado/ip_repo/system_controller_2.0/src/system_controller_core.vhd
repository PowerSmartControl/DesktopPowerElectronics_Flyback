----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
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
use IEEE.NUMERIC_STD.ALL;

entity system_controller_core is
  port ( 
    CLK  : in STD_LOGIC;
    nRST : in STD_LOGIC;
    ADC_START     : out std_logic;
    ADC_DONE      : in std_logic;
    CTRL_START    : out std_logic;
    CTRL_DONE     : in std_logic;
    PWM_ENABLE    : out std_logic;
    RUN           : in STD_LOGIC;
    TRIGGER       : in STD_LOGIC_VECTOR(9 downto 0));
end system_controller_core;

architecture rtl of system_controller_core is
    type states is (Ready, Idle, ACQ_START, ACQ_WAIT, VCTRL);  
    signal current_state, next_state : states;
    
    signal run_counter : std_logic;
    signal clk_counter : unsigned (9 downto 0):= (others => '0');
    signal acq_sync: integer range 0 to 10 :=10;
    
begin 
  --------------------------------------------------------------------------------
  -- Sampling Period Counter
  --------------------------------------------------------------------------------        
  sampling_counter : process(nRST, CLK)
  begin
    if nRST = '0' then
      clk_counter <= (others => '0');
    elsif rising_edge(CLK) then
      if (clk_counter = to_unsigned(999, 10)) or (run_counter = '0') then 
        clk_counter <= (others => '0');
      else    
        clk_counter <= clk_counter + 1;
      end if;
    end if;
  end process;
    
  --------------------------------------------------------------------------------
  -- FSM
  --------------------------------------------------------------------------------       
  sync_proc : process(nRST, CLK)
  begin
    if nRST = '0' then
      current_state <= Ready;
    elsif rising_edge(CLK) then
      current_state <= next_state;     
    end if;
  end process;
    
  comb_proc: process (current_state, RUN, ADC_DONE, CTRL_DONE, clk_counter)
  begin
    next_state <= current_state;
    ADC_START <= '0'; CTRL_START <= '0'; PWM_ENABLE <= '1'; run_counter <= '1';
    case (current_state) is
      when Ready =>
        PWM_ENABLE  <= '0';
        run_counter <= '0';
        if RUN = '1' then
          next_state <= Idle;
        end if;
      when ACQ_START => -- Set ADC_START high until ADC_DONE signal goes low
        ADC_START <= '1';
        if ADC_DONE = '0' then  
          next_state <= ACQ_wait;
        end if;
      when ACQ_wait => -- Wait for ADC_DONE go high (acquisition completed): typ 1360ns
        if ADC_DONE = '1' then  
          next_state <= VCTRL;
        end if;
      when VCTRL  =>  -- Perform Voltage control calculation
        CTRL_START <= '1';
        if CTRL_DONE = '1' then  
          next_state <= Idle;
        end if;     
      when Idle  =>
        if clk_counter = unsigned (TRIGGER) then
          next_state <= ACQ_START;
        elsif RUN = '0' then
          next_state <= Ready;
        end if;
      end case;
    end process;

end rtl;