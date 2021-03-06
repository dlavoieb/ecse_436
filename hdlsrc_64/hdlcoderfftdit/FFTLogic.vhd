-- -------------------------------------------------------------
-- 
-- File Name: hdlsrc_64\hdlcoderfftdit\FFTLogic.vhd
-- Created: 2016-12-14 11:11:15
-- 
-- Generated by MATLAB 9.1 and HDL Coder 3.9
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: FFTLogic
-- Source Path: hdlcoderfftdit/HDLFFTDUT/HDL FFT
-- Hierarchy Level: 2
-- 
-- Instantiate a FFT Logic Component
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.HDLFFTDUT_pkg.ALL;

ENTITY FFTLogic IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        din_re                            :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        din_im                            :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        wout_m1b1_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        wout_m1b1_im                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        rout_m1b1_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        rout_m1b1_im                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        wout_m1b2_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        wout_m1b2_im                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        rout_m1b2_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        rout_m1b2_im                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        wout_m2b1_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        wout_m2b1_im                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        rout_m2b1_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        rout_m2b1_im                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        wout_m2b2_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        wout_m2b2_im                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        rout_m2b2_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        rout_m2b2_im                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dbfout1_re                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dbfout1_im                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dbfout_2_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dbfout_2_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        start                             :   IN    std_logic;
        dout_re                           :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dout_im                           :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        wdatab1_re                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        wdatab1_im                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        wdatab2_re                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        wdatab2_im                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        waddrm1                           :   OUT   std_logic_vector(4 DOWNTO 0);  -- ufix5
        waddrm2                           :   OUT   std_logic_vector(4 DOWNTO 0);  -- ufix5
        m1b1wr_en                         :   OUT   std_logic;
        m1b2wr_en                         :   OUT   std_logic;
        m2wr_en                           :   OUT   std_logic;
        addrbf                            :   OUT   std_logic_vector(4 DOWNTO 0);  -- ufix5
        twindex                           :   OUT   std_logic_vector(5 DOWNTO 0);  -- ufix6
        multin_re                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        multin_im                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dmultin_re                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dmultin_im                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        bfin2sel                          :   OUT   std_logic;
        bfin1_re                          :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        bfin1_im                          :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dvalid                            :   OUT   std_logic;
        ready                             :   OUT   std_logic
        );
END FFTLogic;


ARCHITECTURE rtl OF FFTLogic IS

  -- Constants
  CONSTANT constOne                       : unsigned(4 DOWNTO 0) := 
    to_unsigned(1, 5);  -- ufix5
  CONSTANT constZero                      : unsigned(1 DOWNTO 0) := 
    to_unsigned(0, 2);  -- ufix2
  CONSTANT constTwo                       : unsigned(1 DOWNTO 0) := 
    to_unsigned(2, 2);  -- ufix2
  CONSTANT inistep                        : unsigned(5 DOWNTO 0) := 
    to_unsigned(16, 6);  -- ufix6
  CONSTANT ComplexZero_re                 : signed(15 DOWNTO 0) := 
    to_signed(0, 16);  -- sfix16_En14
  CONSTANT ComplexZero_im                 : signed(15 DOWNTO 0) := 
    to_signed(0, 16);  -- sfix16_En14

  -- Signals
  SIGNAL din_re_signed                    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL din_im_signed                    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL wout_m1b1_re_signed              : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL wout_m1b1_im_signed              : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL rout_m1b1_re_signed              : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL rout_m1b1_im_signed              : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL wout_m1b2_re_signed              : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL wout_m1b2_im_signed              : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL rout_m1b2_re_signed              : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL rout_m1b2_im_signed              : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL wout_m2b1_re_signed              : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL wout_m2b1_im_signed              : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL rout_m2b1_re_signed              : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL rout_m2b1_im_signed              : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL wout_m2b2_re_signed              : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL wout_m2b2_im_signed              : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL rout_m2b2_re_signed              : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL rout_m2b2_im_signed              : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL dbfout1_re_signed                : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL dbfout1_im_signed                : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL dbfout_2_re_signed               : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL dbfout_2_im_signed               : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL dout_re_tmp                      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL dout_im_tmp                      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL wdatab1_re_tmp                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL wdatab1_im_tmp                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL wdatab2_re_tmp                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL wdatab2_im_tmp                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL waddrm1_tmp                      : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL waddrm2_tmp                      : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL addrbf_tmp                       : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL twindex_tmp                      : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL multin_re_tmp                    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL multin_im_tmp                    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL dmultin_re_tmp                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL dmultin_im_tmp                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL bfin1_re_tmp                     : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL bfin1_im_tmp                     : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL sclock                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL sclock_next                      : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL dsclock_next                     : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL sclock_ini                       : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL sclock_overflow                  : std_logic;
  SIGNAL enb_sclock                       : std_logic;
  SIGNAL add_cast                         : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL add_cast_1                       : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL add_temp                         : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL dvalidcnd1                       : std_logic;
  SIGNAL dvalidcnd2                       : std_logic;
  SIGNAL dvalid_1                         : std_logic;
  SIGNAL ready_last                       : std_logic;
  SIGNAL triggle                          : std_logic;
  SIGNAL dtriggle                         : std_logic;
  SIGNAL ready_upd                        : std_logic;
  SIGNAL dready_upd                       : std_logic;
  SIGNAL ready_1                          : std_logic;
  SIGNAL cnt                              : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL cntadd                           : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL dcnt                             : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL dcnt_ahead                       : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL dcnt_short                       : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL dcnt_ahead_short                 : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL add_cast_2                       : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL add_cast_3                       : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL add_temp_1                       : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL cnt_reset1                       : std_logic;
  SIGNAL cnt_reset2                       : std_logic;
  SIGNAL cnt_reset3                       : std_logic;
  SIGNAL cnt_reset                        : std_logic;
  SIGNAL ex_constZero                     : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL br_idx                           : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL brmuxin1                         : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL sub_cast                         : signed(6 DOWNTO 0);  -- sfix7
  SIGNAL sub_cast_1                       : signed(6 DOWNTO 0);  -- sfix7
  SIGNAL sub_temp                         : signed(7 DOWNTO 0);  -- sfix8
  SIGNAL brmuxsel                         : std_logic;
  SIGNAL brmuxout                         : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL index                            : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL readin                           : std_logic;
  SIGNAL notmuxsel                        : std_logic;
  SIGNAL m1b1_en                          : std_logic;
  SIGNAL m1b2_en                          : std_logic;
  SIGNAL br_done                          : std_logic;
  SIGNAL startbf                          : std_logic;
  SIGNAL cstagedone                       : std_logic;
  SIGNAL ex_cstagedone                    : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL sgtriger                         : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL add_temp_2                       : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL add_cast_4                       : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL stage                            : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL stage_ahead                      : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL sgaccu                           : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL dsgaccu                          : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL add_cast_5                       : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL add_cast_6                       : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL add_temp_3                       : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL stagechange                      : std_logic;
  SIGNAL stagechange_ahead                : std_logic;
  SIGNAL egstage                          : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL int_delay_pipe                   : vector_of_unsigned6(0 TO 2);  -- ufix6 [3]
  SIGNAL egstagecheck                     : std_logic;
  SIGNAL egand3in1                        : std_logic;
  SIGNAL egand3in2                        : std_logic;
  SIGNAL egand3in3                        : std_logic;
  SIGNAL egorin1                          : std_logic;
  SIGNAL egcnt                            : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL segcnt                           : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL int_delay_pipe_1                 : vector_of_unsigned6(0 TO 2);  -- ufix6 [3]
  SIGNAL bitclrdcnt                       : vector_of_unsigned5(0 TO 4);  -- ufix5 [5]
  SIGNAL bitslicedcnt                     : std_logic_vector(0 TO 4);  -- boolean [5]
  SIGNAL km2                              : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL am4                              : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL indexj                           : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL indexi                           : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL idxmult                          : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL M4                               : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL bankm1                           : std_logic;
  SIGNAL add_cast_7                       : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL add_cast_8                       : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL add_temp_4                       : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL sub_cast_2                       : signed(5 DOWNTO 0);  -- sfix6
  SIGNAL sub_cast_3                       : signed(5 DOWNTO 0);  -- sfix6
  SIGNAL sub_temp_1                       : signed(6 DOWNTO 0);  -- sfix7
  SIGNAL add_cast_9                       : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL add_cast_10                      : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL add_temp_5                       : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL stage3N                          : std_logic;
  SIGNAL ramux1sel                        : std_logic;
  SIGNAL M4update                         : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL M4inc                            : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL dM4                              : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL idxbf                            : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL sub_cast_4                       : signed(5 DOWNTO 0);  -- sfix6
  SIGNAL sub_cast_5                       : signed(5 DOWNTO 0);  -- sfix6
  SIGNAL sub_temp_2                       : signed(6 DOWNTO 0);  -- sfix7
  SIGNAL bankm2                           : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL add_temp_6                       : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL add_cast_11                      : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL stageeven                        : std_logic;
  SIGNAL mbank                            : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL tbankm1                          : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL addrmult                         : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL bank                             : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL addrbf_1                         : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL wadmux1out                       : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL stage2N                          : std_logic;
  SIGNAL wadmux2sel                       : std_logic;
  SIGNAL iniout                           : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL shiftinistep                     : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL basestep                         : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL dbasestep                        : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL twindex_1                        : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL dtwindex                         : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL adjuststep                       : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL exconstzero                      : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL stepoverflow                     : std_logic;
  SIGNAL stepreset                        : std_logic;
  SIGNAL add_cast_12                      : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL add_cast_13                      : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL add_temp_7                       : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL convertin_re                     : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL convertin_im                     : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL multin_re_1                      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL multin_im_1                      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL directmultin_re                  : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL directmultin_im                  : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL addin_re                         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL addin_im                         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL dbank                            : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL twindexNZ                        : std_logic;
  SIGNAL tbfin2Sel                        : std_logic;
  SIGNAL fftout_re                        : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL fftout_im                        : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL fftlogicout_re                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL fftlogicout_im                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL fftregout_re                     : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL fftregout_im                     : signed(15 DOWNTO 0);  -- sfix16_En14

BEGIN
  din_re_signed <= signed(din_re);

  din_im_signed <= signed(din_im);

  wout_m1b1_re_signed <= signed(wout_m1b1_re);

  wout_m1b1_im_signed <= signed(wout_m1b1_im);

  rout_m1b1_re_signed <= signed(rout_m1b1_re);

  rout_m1b1_im_signed <= signed(rout_m1b1_im);

  wout_m1b2_re_signed <= signed(wout_m1b2_re);

  wout_m1b2_im_signed <= signed(wout_m1b2_im);

  rout_m1b2_re_signed <= signed(rout_m1b2_re);

  rout_m1b2_im_signed <= signed(rout_m1b2_im);

  wout_m2b1_re_signed <= signed(wout_m2b1_re);

  wout_m2b1_im_signed <= signed(wout_m2b1_im);

  rout_m2b1_re_signed <= signed(rout_m2b1_re);

  rout_m2b1_im_signed <= signed(rout_m2b1_im);

  wout_m2b2_re_signed <= signed(wout_m2b2_re);

  wout_m2b2_im_signed <= signed(wout_m2b2_im);

  rout_m2b2_re_signed <= signed(rout_m2b2_re);

  rout_m2b2_im_signed <= signed(rout_m2b2_im);

  dbfout1_re_signed <= signed(dbfout1_re);

  dbfout1_im_signed <= signed(dbfout1_im);

  dbfout_2_re_signed <= signed(dbfout_2_re);

  dbfout_2_im_signed <= signed(dbfout_2_im);

  -- Instantiate a FFT Logic Component
  -- System Counter with Enable
  add_cast <= resize(constOne, 9);
  add_cast_1 <= sclock;
  add_temp <= resize(add_cast, 10) + resize(add_cast_1, 10);
  sclock_next <= (OTHERS => '1') WHEN add_temp(9) /= '0' OR add_temp(8 DOWNTO 0) = "111111111" -- special case1
      ELSE add_temp(8 DOWNTO 0);

  temp_process1_UnitDelayEnable_Sclock : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dsclock_next <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF enb = '1' AND enb_sclock = '1' THEN
        dsclock_next <= sclock_next;
      END IF;
    END IF;
  END PROCESS temp_process1_UnitDelayEnable_Sclock;

  sclock_ini <= resize(constZero, 9);

  sclock_overflow <= '1' WHEN ( dsclock_next >= to_unsigned(304, 9) ) ELSE '0';
  sclock <= sclock_ini WHEN ( sclock_overflow = '1' ) ELSE
            dsclock_next;

  -- Output Control Signals
  dvalidcnd1 <= '1' WHEN ( sclock >= to_unsigned(239, 9) ) ELSE '0';
  dvalidcnd2 <= '1' WHEN ( sclock < to_unsigned(303, 9) ) ELSE '0';
  dvalid_1 <=  dvalidcnd1 AND dvalidcnd2;

  temp_process2_dvalid : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dvalid <= '0';
    ELSIF clk'event AND clk = '1' THEN
      IF enb = '1' THEN
        dvalid <= dvalid_1;
      END IF;
    END IF; 
  END PROCESS temp_process2_dvalid;

  ready_last <= '1' WHEN ( sclock = to_unsigned(0, 9) ) ELSE '0';
  triggle <=  ready_last AND start;

  temp_process3_Delay_triggle : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dtriggle <= '0';
    ELSIF clk'event AND clk = '1' THEN
      IF enb = '1' THEN
        dtriggle <= triggle;
      END IF;
    END IF; 
  END PROCESS temp_process3_Delay_triggle;

  ready_upd <= NOT(ready_last);

  temp_process4_Delay_ready_update : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dready_upd <= '0';
    ELSIF clk'event AND clk = '1' THEN
      IF enb = '1' THEN
        dready_upd <= ready_upd;
      END IF;
    END IF; 
  END PROCESS temp_process4_Delay_ready_update;

  ready_1 <= dready_upd WHEN ( dtriggle = '1' ) ELSE
             ready_last;

  enb_sclock <= NOT(ready_1);

  ready <= ready_1;

  -- Resettable Stage Step Counter
  add_cast_2 <= resize(constOne, 6);
  add_cast_3 <= dcnt_ahead;
  add_temp_1 <= resize(add_cast_2, 7) + resize(add_cast_3, 7);
  cntadd <= (OTHERS => '1') WHEN add_temp_1(6) /= '0' OR add_temp_1(5 DOWNTO 0) = "111111" -- special case1
      ELSE add_temp_1(5 DOWNTO 0);

  temp_process5_Delay_cnt : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      cnt <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF enb = '1' THEN
        cnt <= cntadd;
      END IF;
    END IF; 
  END PROCESS temp_process5_Delay_cnt;

  cnt_reset1 <= '1' WHEN ( cnt >= to_unsigned(35, 6) ) ELSE '0';
  cnt_reset2 <= '1' WHEN ( sclock >= to_unsigned(303, 9) ) ELSE '0';
  cnt_reset3 <= '1' WHEN ( sclock <= to_unsigned(60, 9) ) ELSE '0';
  cnt_reset <=  cnt_reset1 OR cnt_reset2 OR cnt_reset3;

  ex_constZero <= resize(constZero, 6);

  dcnt_ahead <= ex_constZero WHEN ( cnt_reset = '1' ) ELSE
                cnt;

  temp_process6_Delay_cnt : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dcnt <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF enb = '1' THEN
        dcnt <= dcnt_ahead;
      END IF;
    END IF; 
  END PROCESS temp_process6_Delay_cnt;

  dcnt_short <= (OTHERS => '1') WHEN dcnt(5) /= '0' OR dcnt(4 DOWNTO 0) = "11111" -- special case1
      ELSE dcnt(4 DOWNTO 0);

  dcnt_ahead_short <= (OTHERS => '1') WHEN dcnt_ahead(5) /= '0' OR dcnt_ahead(4 DOWNTO 0) = "11111" -- special case1
      ELSE dcnt_ahead(4 DOWNTO 0);

  -- Bit Reverse
  br_idx <= sclock(0) & sclock(1) & sclock(2) & sclock(3) & sclock(4) & sclock(5);

  sub_cast <= signed(resize(br_idx, 7));
  sub_cast_1 <= signed(resize(constOne, 7));
  sub_temp <= resize(sub_cast, 8) - resize(sub_cast_1, 8);
  brmuxin1 <= (OTHERS => '1') WHEN sub_temp(7) = '0' AND sub_temp(6) /= '0'
      ELSE to_unsigned(0, 6) WHEN sub_temp(7) = '1' 
      ELSE (unsigned(sub_temp(5 DOWNTO 0)));

  brmuxsel <= br_idx(0);

  brmuxout <= brmuxin1 WHEN ( brmuxsel = '1' ) ELSE
              br_idx;

  index <= brmuxout(5 DOWNTO 1);

  readin <= '1' WHEN ( sclock < to_unsigned(64, 9) ) ELSE '0';
  notmuxsel <= NOT(brmuxsel);

  m1b1_en <=  notmuxsel AND readin;

  m1b2_en <=  brmuxsel AND readin;

  br_done <= NOT(readin);

  -- Stage Counter
  startbf <= '1' WHEN ( sclock = to_unsigned(59, 9) ) ELSE '0';
  cstagedone <= '1' WHEN ( dcnt_ahead = to_unsigned(34, 6) ) ELSE '0';
  ex_cstagedone <= resize("0" & cstagedone, 2);

  add_cast_4 <= ex_cstagedone;

  add_temp_2 <= resize(add_cast_4, 3) + unsigned'("001") WHEN startbf = '1' ELSE
                resize(add_cast_4, 3);

  sgtriger <= (OTHERS => '1') WHEN add_temp_2(2) /= '0' OR add_temp_2(1 DOWNTO 0) = "11" -- special case1
      ELSE add_temp_2(1 DOWNTO 0);

  temp_process7_Delay_stage_accu : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dsgaccu <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF enb = '1' THEN
        dsgaccu <= sgaccu;
      END IF;
    END IF; 
  END PROCESS temp_process7_Delay_stage_accu;

  stage_ahead <= ex_constZero WHEN ( dsgaccu > to_unsigned(6, 6) ) ELSE
                 dsgaccu;

  add_cast_5 <= resize(sgtriger, 6);
  add_cast_6 <= stage_ahead;
  add_temp_3 <= resize(add_cast_5, 7) + resize(add_cast_6, 7);
  sgaccu <= (OTHERS => '1') WHEN add_temp_3(6) /= '0' OR add_temp_3(5 DOWNTO 0) = "111111" -- special case1
      ELSE add_temp_3(5 DOWNTO 0);

  temp_process8_Delay_stage : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      stage <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF enb = '1' THEN
        stage <= stage_ahead;
      END IF;
    END IF; 
  END PROCESS temp_process8_Delay_stage;

  temp_process9_Delay_stagechanget : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      stagechange_ahead <= '0';
    ELSIF clk'event AND clk = '1' THEN
      IF enb = '1' THEN
        stagechange_ahead <= cstagedone;
      END IF;
    END IF; 
  END PROCESS temp_process9_Delay_stagechanget;

  temp_process10_Delay_stagechange : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      stagechange <= '0';
    ELSIF clk'event AND clk = '1' THEN
      IF enb = '1' THEN
        stagechange <= stagechange_ahead;
      END IF;
    END IF; 
  END PROCESS temp_process10_Delay_stagechange;

  -- RAM Write Enable Generation

  temp_process11_Delay_stage : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      int_delay_pipe(0 TO 2) <= (OTHERS => (OTHERS => '0'));
    ELSIF clk'event AND clk = '1' THEN 
      IF enb = '1' THEN
        int_delay_pipe(0) <= stage;
        int_delay_pipe(1 TO 2) <= int_delay_pipe(0 TO 1);
      END IF;
    END IF; 
  END PROCESS temp_process11_Delay_stage;

  egstage <= int_delay_pipe(2);

  egstagecheck <= egstage(0);

  egand3in1 <= NOT(egstagecheck);

  egand3in2 <= '1' WHEN ( egstage > to_unsigned(1, 6) ) ELSE '0';

  temp_process12_Delay_stepcnt : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      int_delay_pipe_1(0 TO 2) <= (OTHERS => (OTHERS => '0'));
    ELSIF clk'event AND clk = '1' THEN 
      IF enb = '1' THEN
        int_delay_pipe_1(0) <= dcnt;
        int_delay_pipe_1(1 TO 2) <= int_delay_pipe_1(0 TO 1);
      END IF;
    END IF; 
  END PROCESS temp_process12_Delay_stepcnt;

  egcnt <= int_delay_pipe_1(2);

  egand3in3 <= '1' WHEN ( egcnt < to_unsigned(32, 6) ) ELSE '0';
  segcnt <= (OTHERS => '1') WHEN egcnt(5) /= '0' OR egcnt(4 DOWNTO 0) = "11111" -- special case1
      ELSE egcnt(4 DOWNTO 0);

  egorin1 <=  egand3in1 AND egand3in2 AND egand3in3;

  m1b1wr_en <=  m1b1_en OR egorin1;

  m1b2wr_en <=  m1b2_en OR egorin1;

  m2wr_en <=  egstagecheck AND egand3in3;

  -- RAM Read Address Generation
   -- Address Generation for stages 2 to N
    -- Calculate the Address for Elements that Multiply with Twiddle Factor
  bitclrdcnt(0)(4 DOWNTO 1) <= dcnt_short(4 DOWNTO 1);
  bitclrdcnt(0)(0) <= '0';

  bitslicedcnt(0) <= dcnt_short(0);

  bitclrdcnt(1)(4 DOWNTO 2) <= bitclrdcnt(0)(4 DOWNTO 2);
  bitclrdcnt(1)(1) <= '0';
  bitclrdcnt(1)(0) <= bitclrdcnt(0)(0);

  bitslicedcnt(1) <= dcnt_short(1);

  bitclrdcnt(2)(4 DOWNTO 3) <= bitclrdcnt(1)(4 DOWNTO 3);
  bitclrdcnt(2)(2) <= '0';
  bitclrdcnt(2)(1 DOWNTO 0) <= bitclrdcnt(1)(1 DOWNTO 0);

  bitslicedcnt(2) <= dcnt_short(2);

  bitclrdcnt(3)(4) <= bitclrdcnt(2)(4);
  bitclrdcnt(3)(3) <= '0';
  bitclrdcnt(3)(2 DOWNTO 0) <= bitclrdcnt(2)(2 DOWNTO 0);

  bitslicedcnt(3) <= dcnt_short(3);

  bitclrdcnt(4)(4) <= '0';
  bitclrdcnt(4)(3 DOWNTO 0) <= bitclrdcnt(3)(3 DOWNTO 0);

  bitslicedcnt(4) <= dcnt_short(4);

  km2 <= bitclrdcnt(4) WHEN ( stage = to_unsigned(6, 6) ) ELSE
              bitclrdcnt(3) WHEN ( stage = to_unsigned(5, 6) ) ELSE
              bitclrdcnt(2) WHEN ( stage = to_unsigned(4, 6) ) ELSE
              bitclrdcnt(1) WHEN ( stage = to_unsigned(3, 6) ) ELSE
              bitclrdcnt(0);

  am4 <= bitclrdcnt(3) WHEN ( stage = to_unsigned(6, 6) ) ELSE
              bitclrdcnt(2) WHEN ( stage = to_unsigned(5, 6) ) ELSE
              bitclrdcnt(1) WHEN ( stage = to_unsigned(4, 6) ) ELSE
              bitclrdcnt(0) WHEN ( stage = to_unsigned(3, 6) ) ELSE
              dcnt_short;

  bankm1 <= bitslicedcnt(4) WHEN ( stage = to_unsigned(6, 6) ) ELSE
                 bitslicedcnt(3) WHEN ( stage = to_unsigned(5, 6) ) ELSE
                 bitslicedcnt(2) WHEN ( stage = to_unsigned(4, 6) ) ELSE
                 bitslicedcnt(1) WHEN ( stage = to_unsigned(3, 6) ) ELSE
                 bitslicedcnt(0);

  add_cast_7 <= M4;
  add_cast_8 <= km2;
  add_temp_4 <= resize(add_cast_7, 6) + resize(add_cast_8, 6);
  indexi <= (OTHERS => '1') WHEN add_temp_4(5) /= '0' OR add_temp_4(4 DOWNTO 0) = "11111" -- special case1
      ELSE add_temp_4(4 DOWNTO 0);

  sub_cast_2 <= signed(resize(dcnt_short, 6));
  sub_cast_3 <= signed(resize(am4, 6));
  sub_temp_1 <= resize(sub_cast_2, 7) - resize(sub_cast_3, 7);
  indexj <= (OTHERS => '1') WHEN sub_temp_1(6) = '0' AND sub_temp_1(5) /= '0'
      ELSE to_unsigned(0, 5) WHEN sub_temp_1(6) = '1' 
      ELSE (unsigned(sub_temp_1(4 DOWNTO 0)));

  add_cast_9 <= indexj;
  add_cast_10 <= indexi;
  add_temp_5 <= resize(add_cast_9, 6) + resize(add_cast_10, 6);
  idxmult <= (OTHERS => '1') WHEN add_temp_5(5) /= '0' OR add_temp_5(4 DOWNTO 0) = "11111" -- special case1
      ELSE add_temp_5(4 DOWNTO 0);

    -- Calculate the Address for the other butterfly input
  stage3N <= '1' WHEN ( stage > to_unsigned(2, 6) ) ELSE '0';
  ramux1sel <=  stage3N AND stagechange;

  temp_process13_Delay_M4 : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dM4 <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF enb = '1' THEN
        dM4 <= M4;
      END IF;
    END IF; 
  END PROCESS temp_process13_Delay_M4;

  M4update <= dM4 WHEN ( stage3N = '1' ) ELSE
              constOne;

  M4inc <= resize(M4update(3 DOWNTO 0) & '0', 5);

  M4 <= M4inc WHEN ( ramux1sel = '1' ) ELSE
        M4update;

  sub_cast_4 <= signed(resize(idxmult, 6));
  sub_cast_5 <= signed(resize(M4, 6));
  sub_temp_2 <= resize(sub_cast_4, 7) - resize(sub_cast_5, 7);
  idxbf <= (OTHERS => '1') WHEN sub_temp_2(6) = '0' AND sub_temp_2(5) /= '0'
      ELSE to_unsigned(0, 5) WHEN sub_temp_2(6) = '1' 
      ELSE (unsigned(sub_temp_2(4 DOWNTO 0)));

  add_cast_11 <= constTwo;

  add_temp_6 <= resize(add_cast_11, 3) + unsigned'("001") WHEN bankm1 = '1' ELSE
                resize(add_cast_11, 3);

  bankm2 <= (OTHERS => '1') WHEN add_temp_6(2) /= '0' OR add_temp_6(1 DOWNTO 0) = "11" -- special case1
      ELSE add_temp_6(1 DOWNTO 0);

  stageeven <= stage(0);

  tbankm1 <= resize("0" & bankm1, 2);

  mbank <= tbankm1 WHEN ( stageeven = '1' ) ELSE
           bankm2;

   -- Combine the RAM Read Address for all stages
  addrmult <= idxmult WHEN ( stage > to_unsigned(1, 6) ) ELSE
              dcnt_short;

  addrbf_1 <= idxbf WHEN ( stage > to_unsigned(1, 6) ) ELSE
              dcnt_short;

  bank <= mbank WHEN ( stage > to_unsigned(1, 6) ) ELSE
          constZero;

  addrbf_tmp <= addrbf_1 WHEN ( stage_ahead > to_unsigned(0, 6) ) ELSE
                dcnt_ahead_short;

  -- RAM Write Address Generation
  wadmux1out <= segcnt WHEN ( stage >= to_unsigned(2, 6) ) ELSE
                index;

  stage2N <= '1' WHEN ( stage > to_unsigned(1, 6) ) ELSE '0';
  wadmux2sel <=  stage2N AND stageeven;

  waddrm1_tmp <= addrmult WHEN ( wadmux2sel = '1' ) ELSE
                 wadmux1out;

  waddrm2_tmp <= segcnt WHEN ( stageeven = '1' ) ELSE
                 addrmult;

  -- Twiddle Factor Index Generation
  iniout <= dbasestep WHEN ( stage_ahead > to_unsigned(2, 6) ) ELSE
            inistep;

  shiftinistep <= resize(iniout(5 DOWNTO 1), 6);

  basestep <= shiftinistep WHEN ( stagechange_ahead = '1' ) ELSE
              iniout;

  temp_process14_Delay_basestep : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dbasestep <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF enb = '1' THEN
        dbasestep <= basestep;
      END IF;
    END IF; 
  END PROCESS temp_process14_Delay_basestep;

  stepoverflow <= '1' WHEN ( adjuststep >= to_unsigned(32, 6) ) ELSE '0';
  stepreset <=  stepoverflow OR stagechange;

  temp_process15_Delay_twindex : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dtwindex <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF enb = '1' THEN
        dtwindex <= twindex_1;
      END IF;
    END IF; 
  END PROCESS temp_process15_Delay_twindex;

  add_cast_12 <= basestep;
  add_cast_13 <= dtwindex;
  add_temp_7 <= resize(add_cast_12, 7) + resize(add_cast_13, 7);
  adjuststep <= (OTHERS => '1') WHEN add_temp_7(6) /= '0' OR add_temp_7(5 DOWNTO 0) = "111111" -- special case1
      ELSE add_temp_7(5 DOWNTO 0);

  exconstzero <= resize(constZero, 6);

  twindex_1 <= exconstzero WHEN ( stepreset > '0' ) ELSE
               adjuststep;

  twindex_tmp <= twindex_1;

  -- RAM Write Data Generation
  convertin_re <= din_re_signed;
  convertin_im <= din_im_signed;

  wdatab1_re_tmp <= dbfout1_re_signed WHEN ( br_done > '0' ) ELSE
                    convertin_re;
  wdatab1_im_tmp <= dbfout1_im_signed WHEN ( br_done > '0' ) ELSE
                    convertin_im;

  wdatab2_re_tmp <= dbfout_2_re_signed WHEN ( br_done > '0' ) ELSE
                    convertin_re;
  wdatab2_im_tmp <= dbfout_2_im_signed WHEN ( br_done > '0' ) ELSE
                    convertin_im;

  -- Connect with RAM outputs
  temp_process16_Delay_bank : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dbank <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF enb = '1' THEN
        dbank <= bank;
      END IF;
    END IF; 
  END PROCESS temp_process16_Delay_bank;

  multin_re_1 <= wout_m1b1_re_signed WHEN ( dbank = to_unsigned(0, 2) ) ELSE
                      wout_m1b2_re_signed WHEN ( dbank = to_unsigned(1, 2) ) ELSE
                      wout_m2b1_re_signed WHEN ( dbank = to_unsigned(2, 2) ) ELSE
                      wout_m2b2_re_signed;
  multin_im_1 <= wout_m1b1_im_signed WHEN ( dbank = to_unsigned(0, 2) ) ELSE
                      wout_m1b2_im_signed WHEN ( dbank = to_unsigned(1, 2) ) ELSE
                      wout_m2b1_im_signed WHEN ( dbank = to_unsigned(2, 2) ) ELSE
                      wout_m2b2_im_signed;

  multin_re_tmp <= multin_re_1;
  multin_im_tmp <= multin_im_1;

  directmultin_re <= multin_re_1 WHEN ( stage2N > '0' ) ELSE
                     rout_m1b2_re_signed;
  directmultin_im <= multin_im_1 WHEN ( stage2N > '0' ) ELSE
                     rout_m1b2_im_signed;

  temp_process17_Delay_multin : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dmultin_re_tmp <= (OTHERS => '0');
      dmultin_im_tmp <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF enb = '1' THEN
        dmultin_re_tmp <= directmultin_re;
        dmultin_im_tmp <= directmultin_im;
      END IF;
    END IF;
  END PROCESS temp_process17_Delay_multin;

  twindexNZ <= '1' WHEN ( dtwindex > to_unsigned(0, 6) ) ELSE '0';
  tbfin2Sel <=  stage2N AND twindexNZ;

  temp_process18_Delay_bfin1 : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      bfin2sel <= '0';
    ELSIF clk'event AND clk = '1' THEN
      IF enb = '1' THEN
        bfin2sel <= tbfin2Sel;
      END IF;
    END IF;
  END PROCESS temp_process18_Delay_bfin1;

  addin_re <= rout_m1b1_re_signed WHEN ( dbank = to_unsigned(0, 2) ) ELSE
                   rout_m1b2_re_signed WHEN ( dbank = to_unsigned(1, 2) ) ELSE
                   rout_m2b1_re_signed WHEN ( dbank = to_unsigned(2, 2) ) ELSE
                   rout_m2b2_re_signed;
  addin_im <= rout_m1b1_im_signed WHEN ( dbank = to_unsigned(0, 2) ) ELSE
                   rout_m1b2_im_signed WHEN ( dbank = to_unsigned(1, 2) ) ELSE
                   rout_m2b1_im_signed WHEN ( dbank = to_unsigned(2, 2) ) ELSE
                   rout_m2b2_im_signed;

  temp_process19_Delay_bfin1 : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      bfin1_re_tmp <= (OTHERS => '0');
      bfin1_im_tmp <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF enb = '1' THEN
        bfin1_re_tmp <= addin_re;
        bfin1_im_tmp <= addin_im;
      END IF;
    END IF;
  END PROCESS temp_process19_Delay_bfin1;

  fftout_re <= dbfout1_re_signed WHEN ( stage > to_unsigned(0, 6) ) ELSE
               rout_m1b2_re_signed;
  fftout_im <= dbfout1_im_signed WHEN ( stage > to_unsigned(0, 6) ) ELSE
               rout_m1b2_im_signed;

  fftlogicout_re <= fftout_re WHEN ( dvalid_1 > '0' ) ELSE
                    ComplexZero_re;
  fftlogicout_im <= fftout_im WHEN ( dvalid_1 > '0' ) ELSE
                    ComplexZero_im;

  temp_process20_output_register : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      fftregout_re <= (OTHERS => '0');
      fftregout_im <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF enb = '1' THEN
        fftregout_re <= fftlogicout_re;
        fftregout_im <= fftlogicout_im;
      END IF;
    END IF;
  END PROCESS temp_process20_output_register;

  dout_re_tmp <= fftregout_re;
  dout_im_tmp <= fftregout_im;


  dout_re <= std_logic_vector(dout_re_tmp);

  dout_im <= std_logic_vector(dout_im_tmp);

  wdatab1_re <= std_logic_vector(wdatab1_re_tmp);

  wdatab1_im <= std_logic_vector(wdatab1_im_tmp);

  wdatab2_re <= std_logic_vector(wdatab2_re_tmp);

  wdatab2_im <= std_logic_vector(wdatab2_im_tmp);

  waddrm1 <= std_logic_vector(waddrm1_tmp);

  waddrm2 <= std_logic_vector(waddrm2_tmp);

  addrbf <= std_logic_vector(addrbf_tmp);

  twindex <= std_logic_vector(twindex_tmp);

  multin_re <= std_logic_vector(multin_re_tmp);

  multin_im <= std_logic_vector(multin_im_tmp);

  dmultin_re <= std_logic_vector(dmultin_re_tmp);

  dmultin_im <= std_logic_vector(dmultin_im_tmp);

  bfin1_re <= std_logic_vector(bfin1_re_tmp);

  bfin1_im <= std_logic_vector(bfin1_im_tmp);

END rtl;

