-- (c) Copyright 1995-2016 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: gfb:ip_cores:ad7476_IF:1.0
-- IP Revision: 22

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY top_design_ad7476_IF_0_0 IS
  PORT (
    CLK : IN STD_LOGIC;
    nRST : IN STD_LOGIC;
    SDATA : IN STD_LOGIC;
    SCLK : OUT STD_LOGIC;
    nCS : OUT STD_LOGIC;
    DATA : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
    START : IN STD_LOGIC;
    DONE : OUT STD_LOGIC
  );
END top_design_ad7476_IF_0_0;

ARCHITECTURE top_design_ad7476_IF_0_0_arch OF top_design_ad7476_IF_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF top_design_ad7476_IF_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT ad7476_IF IS
    PORT (
      CLK : IN STD_LOGIC;
      nRST : IN STD_LOGIC;
      SDATA : IN STD_LOGIC;
      SCLK : OUT STD_LOGIC;
      nCS : OUT STD_LOGIC;
      DATA : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
      START : IN STD_LOGIC;
      DONE : OUT STD_LOGIC
    );
  END COMPONENT ad7476_IF;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF top_design_ad7476_IF_0_0_arch: ARCHITECTURE IS "ad7476_IF,Vivado 2016.1";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF top_design_ad7476_IF_0_0_arch : ARCHITECTURE IS "top_design_ad7476_IF_0_0,ad7476_IF,{}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF CLK: SIGNAL IS "xilinx.com:signal:clock:1.0 CLK CLK";
  ATTRIBUTE X_INTERFACE_INFO OF nRST: SIGNAL IS "xilinx.com:signal:reset:1.0 nRST RST";
BEGIN
  U0 : ad7476_IF
    PORT MAP (
      CLK => CLK,
      nRST => nRST,
      SDATA => SDATA,
      SCLK => SCLK,
      nCS => nCS,
      DATA => DATA,
      START => START,
      DONE => DONE
    );
END top_design_ad7476_IF_0_0_arch;
