-- ==============================================================
-- File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2015.4
-- Copyright (C) 2015 Xilinx Inc. All rights reserved.
-- 
-- ==============================================================

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity PI_compensator_AXILiteS_s_axi is
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
    v_ref                 :out  STD_LOGIC_VECTOR(31 downto 0);
    X_MAX                 :out  STD_LOGIC_VECTOR(9 downto 0);
    Kp                    :out  STD_LOGIC_VECTOR(31 downto 0);
    Ki2                   :out  STD_LOGIC_VECTOR(31 downto 0);
    yVmeasDbg             :in   STD_LOGIC_VECTOR(31 downto 0);
    yVmeasDbg_ap_vld      :in   STD_LOGIC;
    yDbg                  :in   STD_LOGIC_VECTOR(31 downto 0);
    yDbg_ap_vld           :in   STD_LOGIC;
    eDbg                  :in   STD_LOGIC_VECTOR(31 downto 0);
    eDbg_ap_vld           :in   STD_LOGIC;
    uDbg                  :in   STD_LOGIC_VECTOR(9 downto 0);
    uDbg_ap_vld           :in   STD_LOGIC
);
end entity PI_compensator_AXILiteS_s_axi;

-- ------------------------Address Info-------------------
-- 0x00 : reserved
-- 0x04 : reserved
-- 0x08 : reserved
-- 0x0c : reserved
-- 0x10 : Data signal of v_ref
--        bit 31~0 - v_ref[31:0] (Read/Write)
-- 0x14 : reserved
-- 0x18 : Data signal of X_MAX
--        bit 9~0 - X_MAX[9:0] (Read/Write)
--        others  - reserved
-- 0x1c : reserved
-- 0x20 : Data signal of Kp
--        bit 31~0 - Kp[31:0] (Read/Write)
-- 0x24 : reserved
-- 0x28 : Data signal of Ki2
--        bit 31~0 - Ki2[31:0] (Read/Write)
-- 0x2c : reserved
-- 0x30 : Data signal of yVmeasDbg
--        bit 31~0 - yVmeasDbg[31:0] (Read)
-- 0x34 : Control signal of yVmeasDbg
--        bit 0  - yVmeasDbg_ap_vld (Read/COR)
--        others - reserved
-- 0x38 : Data signal of yDbg
--        bit 31~0 - yDbg[31:0] (Read)
-- 0x3c : Control signal of yDbg
--        bit 0  - yDbg_ap_vld (Read/COR)
--        others - reserved
-- 0x40 : Data signal of eDbg
--        bit 31~0 - eDbg[31:0] (Read)
-- 0x44 : Control signal of eDbg
--        bit 0  - eDbg_ap_vld (Read/COR)
--        others - reserved
-- 0x48 : Data signal of uDbg
--        bit 9~0 - uDbg[9:0] (Read)
--        others  - reserved
-- 0x4c : Control signal of uDbg
--        bit 0  - uDbg_ap_vld (Read/COR)
--        others - reserved
-- (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

architecture behave of PI_compensator_AXILiteS_s_axi is
    type states is (wridle, wrdata, wrresp, rdidle, rddata);  -- read and write fsm states
    signal wstate, wnext, rstate, rnext: states;
    constant ADDR_V_REF_DATA_0     : INTEGER := 16#10#;
    constant ADDR_V_REF_CTRL       : INTEGER := 16#14#;
    constant ADDR_X_MAX_DATA_0     : INTEGER := 16#18#;
    constant ADDR_X_MAX_CTRL       : INTEGER := 16#1c#;
    constant ADDR_KP_DATA_0        : INTEGER := 16#20#;
    constant ADDR_KP_CTRL          : INTEGER := 16#24#;
    constant ADDR_KI2_DATA_0       : INTEGER := 16#28#;
    constant ADDR_KI2_CTRL         : INTEGER := 16#2c#;
    constant ADDR_YVMEASDBG_DATA_0 : INTEGER := 16#30#;
    constant ADDR_YVMEASDBG_CTRL   : INTEGER := 16#34#;
    constant ADDR_YDBG_DATA_0      : INTEGER := 16#38#;
    constant ADDR_YDBG_CTRL        : INTEGER := 16#3c#;
    constant ADDR_EDBG_DATA_0      : INTEGER := 16#40#;
    constant ADDR_EDBG_CTRL        : INTEGER := 16#44#;
    constant ADDR_UDBG_DATA_0      : INTEGER := 16#48#;
    constant ADDR_UDBG_CTRL        : INTEGER := 16#4c#;
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
    signal int_v_ref           : UNSIGNED(31 downto 0);
    signal int_X_MAX           : UNSIGNED(9 downto 0);
    signal int_Kp              : UNSIGNED(31 downto 0);
    signal int_Ki2             : UNSIGNED(31 downto 0);
    signal int_yVmeasDbg       : UNSIGNED(31 downto 0);
    signal int_yVmeasDbg_ap_vld : STD_LOGIC;
    signal int_yDbg            : UNSIGNED(31 downto 0);
    signal int_yDbg_ap_vld     : STD_LOGIC;
    signal int_eDbg            : UNSIGNED(31 downto 0);
    signal int_eDbg_ap_vld     : STD_LOGIC;
    signal int_uDbg            : UNSIGNED(9 downto 0);
    signal int_uDbg_ap_vld     : STD_LOGIC;


begin
-- ----------------------- Instantiation------------------

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
        if (ACLK'event and ACLK = '1') and ACLK_EN = '1' then
            if (aw_hs = '1') then
                waddr <= UNSIGNED(AWADDR(ADDR_BITS-1 downto 0));
            end if;
        end if;
    end process;

-- ----------------------- AXI READ ----------------------
    ARREADY_t <= '1' when (rstate = rdidle) else '0';
    ARREADY <= ARREADY_t;
    RDATA   <= STD_LOGIC_VECTOR(rdata_data);
    RRESP   <= "00";  -- OKAY
    RVALID_t  <= '1' when (rstate = rddata) else '0';
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
        if (ACLK'event and ACLK = '1') and ACLK_EN = '1' then
            if (ar_hs = '1') then
                case (TO_INTEGER(raddr)) is
                when ADDR_V_REF_DATA_0 =>
                    rdata_data <= RESIZE(int_v_ref(31 downto 0), 32);
                when ADDR_X_MAX_DATA_0 =>
                    rdata_data <= RESIZE(int_X_MAX(9 downto 0), 32);
                when ADDR_KP_DATA_0 =>
                    rdata_data <= RESIZE(int_Kp(31 downto 0), 32);
                when ADDR_KI2_DATA_0 =>
                    rdata_data <= RESIZE(int_Ki2(31 downto 0), 32);
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
            end if;
        end if;
    end process;

-- ----------------------- Register logic ----------------
    v_ref                <= STD_LOGIC_VECTOR(int_v_ref);
    X_MAX                <= STD_LOGIC_VECTOR(int_X_MAX);
    Kp                   <= STD_LOGIC_VECTOR(int_Kp);
    Ki2                  <= STD_LOGIC_VECTOR(int_Ki2);

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_V_REF_DATA_0) then
                    int_v_ref(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_v_ref(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_X_MAX_DATA_0) then
                    int_X_MAX(9 downto 0) <= (UNSIGNED(WDATA(9 downto 0)) and wmask(9 downto 0)) or ((not wmask(9 downto 0)) and int_X_MAX(9 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_KP_DATA_0) then
                    int_Kp(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_Kp(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_KI2_DATA_0) then
                    int_Ki2(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_Ki2(31 downto 0));
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

end architecture behave;
