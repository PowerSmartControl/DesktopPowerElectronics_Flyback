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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity system_controller_core is
    port ( 
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
end system_controller_core;

architecture Behavioral of system_controller_core is
    type states is (Ready, Idle, Acquisition, Control_R, Control_D);  
    signal current_state, next_state : states;
    --signal tSample : std_logic;
    signal run_counter : std_logic;
    signal clk_counter : integer:= 0;
    signal acq_sync: integer range 0 to 10 :=10;
    
begin 
    --------------------------------------------------------------------------------
    -- Sampling Period Counter
    --------------------------------------------------------------------------------        
    sampling_counter : process(rstn,clk)
    begin
      if rstn = '0' then
        clk_counter <= 0;
        --tSample <= '0';
      elsif (clk = '1' and clk'event) then
        if (clk_counter = 999) then 
          clk_counter <= 0;
          --tSample <= '1';
        elsif run_counter = '1' then
          clk_counter <= clk_counter + 1;
          --tSample <= '0';
        else    -- run_counter = '0', disabled
          clk_counter <= 0; 
        end if;
      end if;
    end process;
    
    --------------------------------------------------------------------------------
    -- FSM
    --------------------------------------------------------------------------------       
    sync_proc : process(rstn, clk)
    begin
      if (rstn = '0') then
        current_state <= Ready;
      elsif (clk'event and clk = '1') then
          current_state <= next_state;     
      end if;
    end process;
    
    state_output_decode: process (current_state, RUN, ADC_DONE, CTRL_READY, CTRL_DONE, clk_counter)
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
        when Acquisition =>
          ADC_START  <= '1';
          if acq_sync = 0 then  -- Wait 10clks to allow the ADC controller to put down DONE flag
            if ADC_DONE = '1' then
              next_state <= Control_R;
            end if;
          else
            acq_sync <= acq_sync - 1;
          end if;      
        when Control_R  =>  -- Wait for READY flag to go high to deassert START flag
          CTRL_START <= '1';
          --if CTRL_DONE = '1' then   -- It is possible that DONE and READY go high at the same moment
            --next_state <= Idle;
          if CTRL_READY = '1' then
            next_state <= Control_D;
          end if;
        when Control_D  =>  -- Wait for DONE flag
          if CTRL_DONE = '1' then
            next_state <= Idle;
          end if;          
        when Idle  =>
          if clk_counter = unsigned (TRIGGER) then
            acq_sync <= 10;
            next_state <= Acquisition;
          elsif RUN = '0' then
            next_state <= Ready;
          end if;
      end case;
    end process;

end Behavioral;