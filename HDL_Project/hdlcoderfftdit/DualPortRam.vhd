-- -------------------------------------------------------------
-- 
-- File Name: hdlsrc_16\hdlcoderfftdit\DualPortRam.vhd
-- Created: 2016-12-17 21:37:37
-- 
-- Generated by MATLAB 9.1 and HDL Coder 3.9
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: DualPortRam
-- Source Path: hdlcoderfftdit/HDLFFTDUT/HDL FFT
-- Hierarchy Level: 2
-- 
-- Instantiate a Dual Port RAM
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY DualPortRam IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        din_re                            :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
        din_im                            :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
        wraddr                            :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
        we                                :   IN    std_logic;
        rdaddr                            :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
        wout_re                           :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        wout_im                           :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        rout_re                           :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        rout_im                           :   OUT   std_logic_vector(15 DOWNTO 0)  -- int16
        );
END DualPortRam;


ARCHITECTURE rtl OF DualPortRam IS

  -- Component Declarations
  COMPONENT DualPortRam0
    PORT( clk                             :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          wr_din_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          wr_din_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
          wr_addr                         :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
          wr_en                           :   IN    std_logic;
          rd_addr                         :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
          wr_dout_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          wr_dout_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          rd_dout_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
          rd_dout_im                      :   OUT   std_logic_vector(15 DOWNTO 0)  -- int16
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : DualPortRam0
    USE ENTITY work.DualPortRam0(rtl);

  -- Signals
  SIGNAL wout_re_tmp                      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL wout_im_tmp                      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL rout_re_tmp                      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL rout_im_tmp                      : std_logic_vector(15 DOWNTO 0);  -- ufix16

BEGIN
  -- Dual Port RAM
  u_DualPortRam0 : DualPortRam0
    PORT MAP( clk => clk,
              clk_enable => enb,
              wr_din_re => din_re,  -- int16
              wr_din_im => din_im,  -- int16
              wr_addr => wraddr,  -- ufix3
              wr_en => we,
              rd_addr => rdaddr,  -- ufix3
              wr_dout_re => wout_re_tmp,  -- int16
              wr_dout_im => wout_im_tmp,  -- int16
              rd_dout_re => rout_re_tmp,  -- int16
              rd_dout_im => rout_im_tmp  -- int16
              );

  wout_re <= wout_re_tmp;

  wout_im <= wout_im_tmp;

  rout_re <= rout_re_tmp;

  rout_im <= rout_im_tmp;

END rtl;

