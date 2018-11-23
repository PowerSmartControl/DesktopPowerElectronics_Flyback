-- ==============================================================
-- File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2016.1
-- Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
-- 
-- ==============================================================

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Dig_compensator_AXILiteS_s_axi is
generic (
    C_S_AXI_ADDR_WIDTH    : INTEGER := 7;
    C_S_AXI_DATA_WIDTH    : INTEGER := 32);
port (
    -- axi4 lite slave signals
    ACLK                  :in   STD_LOGIC;
    ARESET                :in   STD_LOGIC;
    ACLK_EN               :in   STD_LOGIC;
    AWADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    AWVALID               :in   STD_LOGIC;
    AWREADY               :out  STD_LOGIC;
    WDATA                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    WSTRB                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH/8-1 downto 0);
    WVALID                :in   STD_LOGIC;
    WREADY                :out  STD_LOGIC;
    BRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    BVALID                :out  STD_LOGIC;
    BREADY                :in   STD_LOGIC;
    ARADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    ARVALID               :in   STD_LOGIC;
    ARREADY               :out  STD_LOGIC;
    RDATA                 :out  STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    RRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    RVALID                :out  STD_LOGIC;
    RREADY                :in   STD_LOGIC;
    -- user signals
    params_vRef           :out  STD_LOGIC_VECTOR(31 downto 0);
    params_coef_address0  :in   STD_LOGIC_VECTOR(1 downto 0);
    params_coef_ce0       :in   STD_LOGIC;
    params_coef_q0        :out  STD_LOGIC_VECTOR(31 downto 0);
    params_y_max          :out  STD_LOGIC_VECTOR(31 downto 0);
    params_adcMask        :out  STD_LOGIC_VECTOR(31 downto 0);
    yVmeasDbg             :in   STD_LOGIC_VECTOR(31 downto 0);
    yVmeasDbg_ap_vld      :in   STD_LOGIC;
    yDbg                  :in   STD_LOGIC_VECTOR(31 downto 0);
    yDbg_ap_vld           :in   STD_LOGIC;
    eDbg                  :in   STD_LOGIC_VECTOR(31 downto 0);
    eDbg_ap_vld           :in   STD_LOGIC;
    uDbg                  :in   STD_LOGIC_VECTOR(9 downto 0);
    uDbg_ap_vld           :in   STD_LOGIC
);
end entity Dig_compensator_AXILiteS_s_axi;

-- ------------------------Address Info-------------------
-- 0x00 : reserved
-- 0x04 : reserved
-- 0x08 : reserved
-- 0x0c : reserved
-- 0x10 : Data signal of params_vRef
--        bit 31~0 - params_vRef[31:0] (Read/Write)
-- 0x14 : reserved
-- 0x30 : Data signal of params_y_max
--        bit 31~0 - params_y_max[31:0] (Read/Write)
-- 0x34 : reserved
-- 0x38 : Data signal of params_adcMask
--        bit 31~0 - params_adcMask[31:0] (Read/Write)
-- 0x3c : reserved
-- 0x40 : Data signal of yVmeasDbg
--        bit 31~0 - yVmeasDbg[31:0] (Read)
-- 0x44 : Control signal of yVmeasDbg
--        bit 0  - yVmeasDbg_ap_vld (Read/COR)
--        others - reserved
-- 0x48 : Data signal of yDbg
--        bit 31~0 - yDbg[31:0] (Read)
-- 0x4c : Control signal of yDbg
--        bit 0  - yDbg_ap_vld (Read/COR)
--        others - reserved
-- 0x50 : Data signal of eDbg
--        bit 31~0 - eDbg[31:0] (Read)
-- 0x54 : Control signal of eDbg
--        bit 0  - eDbg_ap_vld (Read/COR)
--        others - reserved
-- 0x58 : Data signal of uDbg
--        bit 9~0 - uDbg[9:0] (Read)
--        others  - reserved
-- 0x5c : Control signal of uDbg
--        bit 0  - uDbg_ap_vld (Read/COR)
--        others - reserved
-- 0x20 ~
-- 0x2f : Memory 'params_coef' (3 * 32b)
--        Word n : bit [31:0] - params_coef[n]
-- (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

architecture behave of Dig_compensator_AXILiteS_s_axi is
    type states is (wridle, wrdata, wrresp, rdidle, rddata);  -- read and write fsm states
    signal wstate, wnext, rstate, rnext: states;
    constant ADDR_PARAMS_VREF_DATA_0    : INTEGER := 16#10#;
    constant ADDR_PARAMS_VREF_CTRL      : INTEGER := 16#14#;
    constant ADDR_PARAMS_Y_MAX_DATA_0   : INTEGER := 16#30#;
    constant ADDR_PARAMS_Y_MAX_CTRL     : INTEGER := 16#34#;
    constant ADDR_PARAMS_ADCMASK_DATA_0 : INTEGER := 16#38#;
    constant ADDR_PARAMS_ADCMASK_CTRL   : INTEGER := 16#3c#;
    constant ADDR_YVMEASDBG_DATA_0      : INTEGER := 16#40#;
    constant ADDR_YVMEASDBG_CTRL        : INTEGER := 16#44#;
    constant ADDR_YDBG_DATA_0           : INTEGER := 16#48#;
    constant ADDR_YDBG_CTRL             : INTEGER := 16#4c#;
    constant ADDR_EDBG_DATA_0           : INTEGER := 16#50#;
    constant ADDR_EDBG_CTRL             : INTEGER := 16#54#;
    constant ADDR_UDBG_DATA_0           : INTEGER := 16#58#;
    constant ADDR_UDBG_CTRL             : INTEGER := 16#5c#;
    constant ADDR_PARAMS_COEF_BASE      : INTEGER := 16#20#;
    constant ADDR_PARAMS_COEF_HIGH      : INTEGER := 16#2f#;
    constant ADDR_BITS         : INTEGER := 7;

    signal waddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal wmask               : UNSIGNED(31 downto 0);
    signal aw_hs               : STD_LOGIC;
    signal w_hs                : STD_LOGIC;
    signal rdata_data          : UNSIGNED(31 downto 0);
    signal ar_hs               : STD_LOGIC;
    signal raddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal AWREADY_t           : STD_LOGIC;
    signal WREADY_t            : STD_LOGIC;
    signal ARREADY_t           : STD_LOGIC;
    signal RVALID_t            : STD_LOGIC;
    -- internal registers
    signal int_params_vRef     : UNSIGNED(31 downto 0);
    signal int_params_y_max    : UNSIGNED(31 downto 0);
    signal int_params_adcMask  : UNSIGNED(31 downto 0);
    signal int_yVmeasDbg       : UNSIGNED(31 downto 0);
    signal int_yVmeasDbg_ap_vld : STD_LOGIC;
    signal int_yDbg            : UNSIGNED(31 downto 0);
    signal int_yDbg_ap_vld     : STD_LOGIC;
    signal int_eDbg            : UNSIGNED(31 downto 0);
    signal int_eDbg_ap_vld     : STD_LOGIC;
    signal int_uDbg            : UNSIGNED(9 downto 0);
    signal int_uDbg_ap_vld     : STD_LOGIC;
    -- memory signals
    signal int_params_coef_address0 : UNSIGNED(1 downto 0);
    signal int_params_coef_ce0 : STD_LOGIC;
    signal int_params_coef_we0 : STD_LOGIC;
    signal int_params_coef_be0 : UNSIGNED(3 downto 0);
    signal int_params_coef_d0  : UNSIGNED(31 downto 0);
    signal int_params_coef_q0  : UNSIGNED(31 downto 0);
    signal int_params_coef_address1 : UNSIGNED(1 downto 0);
    signal int_params_coef_ce1 : STD_LOGIC;
    signal int_params_coef_we1 : STD_LOGIC;
    signal int_params_coef_be1 : UNSIGNED(3 downto 0);
    signal int_params_coef_d1  : UNSIGNED(31 downto 0);
    signal int_params_coef_q1  : UNSIGNED(31 downto 0);
    signal int_params_coef_read : STD_LOGIC;
    signal int_params_coef_write : STD_LOGIC;

    component Dig_compensator_AXILiteS_s_axi_ram is
        generic (
            BYTES   : INTEGER :=4;
            DEPTH   : INTEGER :=256;
            AWIDTH  : INTEGER :=8);
        port (
            clk0    : in  STD_LOGIC;
            address0: in  UNSIGNED(AWIDTH-1 downto 0);
            ce0     : in  STD_LOGIC;
            we0     : in  STD_LOGIC;
            be0     : in  UNSIGNED(BYTES-1 downto 0);
            d0      : in  UNSIGNED(BYTES*8-1 downto 0);
            q0      : out UNSIGNED(BYTES*8-1 downto 0);
            clk1    : in  STD_LOGIC;
            address1: in  UNSIGNED(AWIDTH-1 downto 0);
            ce1     : in  STD_LOGIC;
            we1     : in  STD_LOGIC;
            be1     : in  UNSIGNED(BYTES-1 downto 0);
            d1      : in  UNSIGNED(BYTES*8-1 downto 0);
            q1      : out UNSIGNED(BYTES*8-1 downto 0));
    end component Dig_compensator_AXILiteS_s_axi_ram;

    function log2 (x : INTEGER) return INTEGER is
        variable n, m : INTEGER;
    begin
        n := 1;
        m := 2;
        while m < x loop
            n := n + 1;
            m := m * 2;
        end loop;
        return n;
    end function log2;

begin
-- ----------------------- Instantiation------------------
-- int_params_coef
int_params_coef : Dig_compensator_AXILiteS_s_axi_ram
generic map (
     BYTES    => 4,
     DEPTH    => 3,
     AWIDTH   => log2(3))
port map (
     clk0     => ACLK,
     address0 => int_params_coef_address0,
     ce0      => int_params_coef_ce0,
     we0      => int_params_coef_we0,
     be0      => int_params_coef_be0,
     d0       => int_params_coef_d0,
     q0       => int_params_coef_q0,
     clk1     => ACLK,
     address1 => int_params_coef_address1,
     ce1      => int_params_coef_ce1,
     we1      => int_params_coef_we1,
     be1      => int_params_coef_be1,
     d1       => int_params_coef_d1,
     q1       => int_params_coef_q1);

-- ----------------------- AXI WRITE ---------------------
    AWREADY_t <=  '1' when wstate = wridle else '0';
    AWREADY   <=  AWREADY_t;
    WREADY_t  <=  '1' when wstate = wrdata else '0';
    WREADY    <=  WREADY_t;
    BRESP     <=  "00";  -- OKAY
    BVALID    <=  '1' when wstate = wrresp else '0';
    wmask     <=  (31 downto 24 => WSTRB(3), 23 downto 16 => WSTRB(2), 15 downto 8 => WSTRB(1), 7 downto 0 => WSTRB(0));
    aw_hs     <=  AWVALID and AWREADY_t;
    w_hs      <=  WVALID and WREADY_t;

    -- write FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                wstate <= wridle;
            elsif (ACLK_EN = '1') then
                wstate <= wnext;
            end if;
        end if;
    end process;

    process (wstate, AWVALID, WVALID, BREADY)
    begin
        case (wstate) is
        when wridle =>
            if (AWVALID = '1') then
                wnext <= wrdata;
            else
                wnext <= wridle;
            end if;
        when wrdata =>
            if (WVALID = '1') then
                wnext <= wrresp;
            else
                wnext <= wrdata;
            end if;
        when wrresp =>
            if (BREADY = '1') then
                wnext <= wridle;
            else
                wnext <= wrresp;
            end if;
        when others =>
            wnext <= wridle;
        end case;
    end process;

    waddr_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (aw_hs = '1') then
                    waddr <= UNSIGNED(AWADDR(ADDR_BITS-1 downto 0));
                end if;
            end if;
        end if;
    end process;

-- ----------------------- AXI READ ----------------------
    ARREADY_t <= '1' when (rstate = rdidle) else '0';
    ARREADY <= ARREADY_t;
    RDATA   <= STD_LOGIC_VECTOR(rdata_data);
    RRESP   <= "00";  -- OKAY
    RVALID_t  <= '1' when (rstate = rddata) and (int_params_coef_read = '0') else '0';
    RVALID    <= RVALID_t;
    ar_hs   <= ARVALID and ARREADY_t;
    raddr   <= UNSIGNED(ARADDR(ADDR_BITS-1 downto 0));

    -- read FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                rstate <= rdidle;
            elsif (ACLK_EN = '1') then
                rstate <= rnext;
            end if;
        end if;
    end process;

    process (rstate, ARVALID, RREADY, RVALID_t)
    begin
        case (rstate) is
        when rdidle =>
            if (ARVALID = '1') then
                rnext <= rddata;
            else
                rnext <= rdidle;
            end if;
        when rddata =>
            if (RREADY = '1' and RVALID_t = '1') then
                rnext <= rdidle;
            else
                rnext <= rddata;
            end if;
        when others =>
            rnext <= rdidle;
        end case;
    end process;

    rdata_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (ar_hs = '1') then
                    case (TO_INTEGER(raddr)) is
                    when ADDR_PARAMS_VREF_DATA_0 =>
                        rdata_data <= RESIZE(int_params_vRef(31 downto 0), 32);
                    when ADDR_PARAMS_Y_MAX_DATA_0 =>
                        rdata_data <= RESIZE(int_params_y_max(31 downto 0), 32);
                    when ADDR_PARAMS_ADCMASK_DATA_0 =>
                        rdata_data <= RESIZE(int_params_adcMask(31 downto 0), 32);
                    when ADDR_YVMEASDBG_DATA_0 =>
                        rdata_data <= RESIZE(int_yVmeasDbg(31 downto 0), 32);
                    when ADDR_YVMEASDBG_CTRL =>
                        rdata_data <= (0 => int_yVmeasDbg_ap_vld, others => '0');
                    when ADDR_YDBG_DATA_0 =>
                        rdata_data <= RESIZE(int_yDbg(31 downto 0), 32);
                    when ADDR_YDBG_CTRL =>
                        rdata_data <= (0 => int_yDbg_ap_vld, others => '0');
                    when ADDR_EDBG_DATA_0 =>
                        rdata_data <= RESIZE(int_eDbg(31 downto 0), 32);
                    when ADDR_EDBG_CTRL =>
                        rdata_data <= (0 => int_eDbg_ap_vld, others => '0');
                    when ADDR_UDBG_DATA_0 =>
                        rdata_data <= RESIZE(int_uDbg(9 downto 0), 32);
                    when ADDR_UDBG_CTRL =>
                        rdata_data <= (0 => int_uDbg_ap_vld, others => '0');
                    when others =>
                        rdata_data <= (others => '0');
                    end case;
                elsif (int_params_coef_read = '1') then
                    rdata_data <= int_params_coef_q1;
                end if;
            end if;
        end if;
    end process;

-- ----------------------- Register logic ----------------
    params_vRef          <= STD_LOGIC_VECTOR(int_params_vRef);
    params_y_max         <= STD_LOGIC_VECTOR(int_params_y_max);
    params_adcMask       <= STD_LOGIC_VECTOR(int_params_adcMask);

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_PARAMS_VREF_DATA_0) then
                    int_params_vRef(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_params_vRef(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_PARAMS_Y_MAX_DATA_0) then
                    int_params_y_max(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_params_y_max(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_PARAMS_ADCMASK_DATA_0) then
                    int_params_adcMask(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_params_adcMask(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_yVmeasDbg <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (yVmeasDbg_ap_vld = '1') then
                    int_yVmeasDbg <= UNSIGNED(yVmeasDbg); -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_yVmeasDbg_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (yVmeasDbg_ap_vld = '1') then
                    int_yVmeasDbg_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_YVMEASDBG_CTRL) then
                    int_yVmeasDbg_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_yDbg <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (yDbg_ap_vld = '1') then
                    int_yDbg <= UNSIGNED(yDbg); -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_yDbg_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (yDbg_ap_vld = '1') then
                    int_yDbg_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_YDBG_CTRL) then
                    int_yDbg_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_eDbg <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (eDbg_ap_vld = '1') then
                    int_eDbg <= UNSIGNED(eDbg); -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_eDbg_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (eDbg_ap_vld = '1') then
                    int_eDbg_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_EDBG_CTRL) then
                    int_eDbg_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_uDbg <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (uDbg_ap_vld = '1') then
                    int_uDbg <= UNSIGNED(uDbg); -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_uDbg_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (uDbg_ap_vld = '1') then
                    int_uDbg_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_UDBG_CTRL) then
                    int_uDbg_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;


-- ----------------------- Memory logic ------------------
    -- params_coef
    int_params_coef_address0 <= UNSIGNED(params_coef_address0);
    int_params_coef_ce0  <= params_coef_ce0;
    int_params_coef_we0  <= '0';
    int_params_coef_be0  <= (others => '0');
    int_params_coef_d0   <= (others => '0');
    params_coef_q0       <= STD_LOGIC_VECTOR(RESIZE(int_params_coef_q0, 32));
    int_params_coef_address1 <= raddr(3 downto 2) when ar_hs = '1' else waddr(3 downto 2);
    int_params_coef_ce1  <= '1' when ar_hs = '1' or (int_params_coef_write = '1' and WVALID  = '1') else '0';
    int_params_coef_we1  <= '1' when int_params_coef_write = '1' and WVALID = '1' else '0';
    int_params_coef_be1  <= UNSIGNED(WSTRB);
    int_params_coef_d1   <= UNSIGNED(WDATA);

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_params_coef_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_PARAMS_COEF_BASE and raddr <= ADDR_PARAMS_COEF_HIGH) then
                    int_params_coef_read <= '1';
                else
                    int_params_coef_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_params_coef_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_PARAMS_COEF_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_PARAMS_COEF_HIGH) then
                    int_params_coef_write <= '1';
                elsif (WVALID = '1') then
                    int_params_coef_write <= '0';
                end if;
            end if;
        end if;
    end process;


end architecture behave;

library IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity Dig_compensator_AXILiteS_s_axi_ram is
    generic (
        BYTES   : INTEGER :=4;
        DEPTH   : INTEGER :=256;
        AWIDTH  : INTEGER :=8);
    port (
        clk0    : in  STD_LOGIC;
        address0: in  UNSIGNED(AWIDTH-1 downto 0);
        ce0     : in  STD_LOGIC;
        we0     : in  STD_LOGIC;
        be0     : in  UNSIGNED(BYTES-1 downto 0);
        d0      : in  UNSIGNED(BYTES*8-1 downto 0);
        q0      : out UNSIGNED(BYTES*8-1 downto 0);
        clk1    : in  STD_LOGIC;
        address1: in  UNSIGNED(AWIDTH-1 downto 0);
        ce1     : in  STD_LOGIC;
        we1     : in  STD_LOGIC;
        be1     : in  UNSIGNED(BYTES-1 downto 0);
        d1      : in  UNSIGNED(BYTES*8-1 downto 0);
        q1      : out UNSIGNED(BYTES*8-1 downto 0));

end entity Dig_compensator_AXILiteS_s_axi_ram;

architecture behave of Dig_compensator_AXILiteS_s_axi_ram is
    signal address0_tmp : UNSIGNED(AWIDTH-1 downto 0);
    signal address1_tmp : UNSIGNED(AWIDTH-1 downto 0);
    type RAM_T is array (0 to DEPTH - 1) of UNSIGNED(BYTES*8 - 1 downto 0);
    shared variable mem : RAM_T := (others => (others => '0'));
begin

    process (address0)
    begin
    address0_tmp <= address0;
    --synthesis translate_off
          if (address0 > DEPTH-1) then
              address0_tmp <= (others => '0');
          else
              address0_tmp <= address0;
          end if;
    --synthesis translate_on
    end process;

    process (address1)
    begin
    address1_tmp <= address1;
    --synthesis translate_off
          if (address1 > DEPTH-1) then
              address1_tmp <= (others => '0');
          else
              address1_tmp <= address1;
          end if;
    --synthesis translate_on
    end process;

    --read port 0
    process (clk0) begin
        if (clk0'event and clk0 = '1') then
            if (ce0 = '1') then
                q0 <= mem(to_integer(address0_tmp));
            end if;
        end if;
    end process;

    --read port 1
    process (clk1) begin
        if (clk1'event and clk1 = '1') then
            if (ce1 = '1') then
                q1 <= mem(to_integer(address1_tmp));
            end if;
        end if;
    end process;

    gen_write : for i in 0 to BYTES - 1 generate
    begin
        --write port 0
        process (clk0)
        begin
            if (clk0'event and clk0 = '1') then
                if (ce0 = '1' and we0 = '1' and be0(i) = '1') then
                    mem(to_integer(address0_tmp))(8*i+7 downto 8*i) := d0(8*i+7 downto 8*i);
                end if;
            end if;
        end process;

        --write port 1
        process (clk1)
        begin
            if (clk1'event and clk1 = '1') then
                if (ce1 = '1' and we1 = '1' and be1(i) = '1') then
                    mem(to_integer(address1_tmp))(8*i+7 downto 8*i) := d1(8*i+7 downto 8*i);
                end if;
            end if;
        end process;

    end generate;

end architecture behave;

