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

entity system_controller_DL_core is
    port ( 
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
end system_controller_DL_core;

architecture Behavioral of system_controller_DL_core is
    type states is (Ready, Idle, Acquisition, Control_V, Control_I);  
    signal current_state, next_state : states;
    --signal tSample : std_logic;
    signal run_counter : std_logic;
    signal clk_counter : integer:= 0;
    
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
    
    state_output_decode: process (current_state, RUN, ADC_DONE, CTRL_V_DONE, CTRL_I_DONE, clk_counter)
    begin
      next_state <= current_state;
      ADC_START <= '0'; CTRL_V_START <= '0'; CTRL_I_START <= '0'; PWM_ENABLE <= '1'; run_counter <= '1';
      case (current_state) is
        when Ready =>
          PWM_ENABLE  <= '0';
          run_counter <= '0';
          if RUN = '1' then
            next_state <= Idle;
          end if;
        when Acquisition =>
          ADC_START  <= '1';
          if ADC_DONE = '1' then
            CTRL_V_START <= '1';
            next_state <= Control_V;
          end if;
        when Control_V  =>
          if CTRL_V_DONE = '1' then
            CTRL_I_START <= '1';
            next_state <= Control_I;
          end if;
        when Control_I  =>
            if CTRL_I_DONE = '1' then
              next_state <= Idle;
            end if;       
        when Idle  =>
          if clk_counter = unsigned (TRIGGER) then
            ADC_START <= '1';
            next_state <= Acquisition;
          elsif RUN = '0' then
            next_state <= Ready;
          end if;
      end case;
    end process;

end Behavioral;