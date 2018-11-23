----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.02.2016 11:42:45
-- Design Name: 
-- Module Name: ad7476_IF - Behavioral
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

entity ad7476_IF is
  port (    
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
end ad7476_IF ;

architecture rtl of ad7476_IF is
  type states is (Idle, ShiftIn, SyncData);  
  signal current_state : states;
  signal next_state    : states;
                        
  signal clk_div       : std_logic;      
  signal clk_counter   : unsigned(2 downto 0);    
  signal shiftCounter  : unsigned(4 downto 0):= (others => '0');
  signal enShiftCounter: std_logic;
  signal enParalelLoad : std_logic;
  signal temp          : std_logic_vector(15 downto 0);

begin
  --------------------------------------------------------------------------------
  -- Clock divider process
  --------------------------------------------------------------------------------        
  clock_divide: process(nRST, CLK)
  begin
   if nRST = '0' then
      clk_counter <= "000";
   elsif (CLK'event and CLK = '1') then
      clk_counter <= clk_counter + 1;
    end if;
  end process; 
  clk_div <= clk_counter(2);
  SCLK <=  not clk_counter(2);

  --------------------------------------------------------------------------------
  -- Data shifter
  --------------------------------------------------------------------------------    
  counter : process(nRST, clk_div, enParalelLoad, enShiftCounter)
  begin
    if nRST = '0' then
      shiftCounter <= (others => '0');  
    elsif (clk_div'event and clk_div = '1') then
      if (enShiftCounter = '1') then 
        temp <= temp(14 downto 0) & SDATA;  
        shiftCounter <= shiftCounter + 1;
      elsif (enParalelLoad = '1') then
        shiftCounter <= (others => '0');
        DATA <= temp(11 downto 0);
      end if;
    end if;
  end process;
   
  --------------------------------------------------------------------------------
  -- FSM
  --------------------------------------------------------------------------------              
  sync_proc : process (nRST, clk_div)
  begin
    if (nRST = '0') then
      current_state <= Idle;
    elsif (clk_div'event and clk_div = '1') then
      current_state <= next_state;
    end if;        
  end process;

  next_state_output_decode: process (current_state, START, shiftCounter)
  begin
    next_state <= current_state;  -- default is to stay in current state
    enShiftCounter <='0'; nCS <='1'; enParalelLoad <= '0'; DONE <='0'; 
    case (current_state) is
      when Idle =>
        DONE <='1';
        if START = '1' then
          next_state <= ShiftIn;
        end if;
      when ShiftIn =>
        enShiftCounter <='1';
        nCS <='0';
        if shiftCounter = 15 then
          next_state <= SyncData;
        end if;
      when SyncData =>
        enParalelLoad <= '1';
        next_state <= Idle;
      when others =>
        next_state <= Idle;
      end case;      
  end process;

end rtl;