-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Full Version"

-- DATE "04/27/2020 17:54:17"

-- 
-- Device: Altera EP4CE10F17C8 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	phase_test2 IS
    PORT (
	sys_clk : IN std_logic;
	sys_rst_n : IN std_logic;
	key : IN std_logic;
	locked : OUT std_logic;
	o_phase_ok : OUT std_logic;
	o_phase_fup_flag : OUT std_logic;
	uart_txd : OUT std_logic
	);
END phase_test2;

-- Design Ports Information
-- locked	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_phase_ok	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_phase_fup_flag	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- uart_txd	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sys_rst_n	=>  Location: PIN_M1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sys_clk	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- key	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF phase_test2 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_sys_clk : std_logic;
SIGNAL ww_sys_rst_n : std_logic;
SIGNAL ww_key : std_logic;
SIGNAL ww_locked : std_logic;
SIGNAL ww_o_phase_ok : std_logic;
SIGNAL ww_o_phase_fup_flag : std_logic;
SIGNAL ww_uart_txd : std_logic;
SIGNAL \u_pll_clk|altpll_component|auto_generated|pll1_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \u_pll_clk|altpll_component|auto_generated|pll1_CLK_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \u_pll_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \sys_rst_n~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_pll_clk|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \sys_clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \sys_rst_n~input_o\ : std_logic;
SIGNAL \sys_rst_n~inputclkctrl_outclk\ : std_logic;
SIGNAL \sys_clk~input_o\ : std_logic;
SIGNAL \u_pll_clk|altpll_component|auto_generated|wire_pll1_fbout\ : std_logic;
SIGNAL \u_pll_clk|altpll_component|auto_generated|wire_pll1_locked\ : std_logic;
SIGNAL \u_pll_clk|altpll_component|auto_generated|pll_lock_sync~feeder_combout\ : std_logic;
SIGNAL \u_pll_clk|altpll_component|auto_generated|pll_lock_sync~q\ : std_logic;
SIGNAL \u_pll_clk|altpll_component|auto_generated|locked~combout\ : std_logic;
SIGNAL \sys_clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \u_pll_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\ : std_logic;
SIGNAL \u_phase_diff_detect|r_sig2~0_combout\ : std_logic;
SIGNAL \u_phase_diff_detect|r_sig2~q\ : std_logic;
SIGNAL \u_phase_diff_detect|r_rstn~feeder_combout\ : std_logic;
SIGNAL \u_phase_diff_detect|r_rstn~q\ : std_logic;
SIGNAL \u_phase_diff_detect|r_start2~0_combout\ : std_logic;
SIGNAL \u_phase_diff_detect|r_start2~q\ : std_logic;
SIGNAL \u_phase_diff_detect|r_detect_avail~0_combout\ : std_logic;
SIGNAL \u_phase_diff_detect|r_data[0]~8_combout\ : std_logic;
SIGNAL \u_phase_diff_detect|r_data[0]~9\ : std_logic;
SIGNAL \u_phase_diff_detect|r_data[1]~10_combout\ : std_logic;
SIGNAL \u_phase_diff_detect|r_data[1]~11\ : std_logic;
SIGNAL \u_phase_diff_detect|r_data[2]~12_combout\ : std_logic;
SIGNAL \u_phase_diff_detect|r_data[2]~13\ : std_logic;
SIGNAL \u_phase_diff_detect|r_data[3]~14_combout\ : std_logic;
SIGNAL \u_phase_diff_detect|r_data[3]~15\ : std_logic;
SIGNAL \u_phase_diff_detect|r_data[4]~16_combout\ : std_logic;
SIGNAL \u_phase_diff_detect|r_data[4]~17\ : std_logic;
SIGNAL \u_phase_diff_detect|r_data[5]~18_combout\ : std_logic;
SIGNAL \u_phase_diff_detect|r_data[5]~19\ : std_logic;
SIGNAL \u_phase_diff_detect|r_data[6]~20_combout\ : std_logic;
SIGNAL \u_phase_diff_detect|always5~1_combout\ : std_logic;
SIGNAL \u_phase_diff_detect|r_data[6]~21\ : std_logic;
SIGNAL \u_phase_diff_detect|r_data[7]~22_combout\ : std_logic;
SIGNAL \u_pll_clk|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\ : std_logic;
SIGNAL \u_phase_diff_detect|r_sig1~0_combout\ : std_logic;
SIGNAL \u_phase_diff_detect|r_sig1~q\ : std_logic;
SIGNAL \u_phase_diff_detect|r_start1~0_combout\ : std_logic;
SIGNAL \u_phase_diff_detect|r_start1~q\ : std_logic;
SIGNAL \u_phase_diff_detect|always5~0_combout\ : std_logic;
SIGNAL \u_phase_diff_detect|r_detect_avail~1_combout\ : std_logic;
SIGNAL \u_phase_diff_detect|r_detect_avail~q\ : std_logic;
SIGNAL \u_phase_diff_detect|clk_ref_prv~q\ : std_logic;
SIGNAL \u_phase_diff_detect|clk_fb_prv~q\ : std_logic;
SIGNAL \u_phase_diff_detect|have_flag~1_combout\ : std_logic;
SIGNAL \u_phase_diff_detect|have_flag~2_combout\ : std_logic;
SIGNAL \u_phase_diff_detect|flag_ok~q\ : std_logic;
SIGNAL \u_phase_diff_detect|have_flag~0_combout\ : std_logic;
SIGNAL \u_phase_diff_detect|have_flag~feeder_combout\ : std_logic;
SIGNAL \u_phase_diff_detect|have_flag~q\ : std_logic;
SIGNAL \key~input_o\ : std_logic;
SIGNAL \u_uart_send|uart_en_d0~q\ : std_logic;
SIGNAL \u_uart_send|uart_en_d1~feeder_combout\ : std_logic;
SIGNAL \u_uart_send|uart_en_d1~q\ : std_logic;
SIGNAL \u_uart_send|tx_data~2_combout\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[0]~16_combout\ : std_logic;
SIGNAL \u_uart_send|tx_flag~0_combout\ : std_logic;
SIGNAL \u_uart_send|tx_flag~q\ : std_logic;
SIGNAL \u_uart_send|LessThan0~0_combout\ : std_logic;
SIGNAL \u_uart_send|LessThan0~1_combout\ : std_logic;
SIGNAL \u_uart_send|LessThan0~2_combout\ : std_logic;
SIGNAL \u_uart_send|tx_cnt[3]~3_combout\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[0]~17\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[1]~18_combout\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[1]~19\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[2]~20_combout\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[2]~21\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[3]~22_combout\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[3]~23\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[4]~24_combout\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[4]~25\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[5]~26_combout\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[5]~27\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[6]~28_combout\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[6]~29\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[7]~30_combout\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[7]~31\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[8]~32_combout\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[8]~33\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[9]~34_combout\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[9]~35\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[10]~36_combout\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[10]~37\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[11]~38_combout\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[11]~39\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[12]~40_combout\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[12]~41\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[13]~42_combout\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[13]~43\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[14]~44_combout\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[14]~45\ : std_logic;
SIGNAL \u_uart_send|clk_cnt[15]~46_combout\ : std_logic;
SIGNAL \u_uart_send|tx_cnt[3]~0_combout\ : std_logic;
SIGNAL \u_uart_send|tx_cnt[3]~1_combout\ : std_logic;
SIGNAL \u_uart_send|tx_cnt~2_combout\ : std_logic;
SIGNAL \u_uart_send|tx_cnt~4_combout\ : std_logic;
SIGNAL \u_uart_send|always1~1_combout\ : std_logic;
SIGNAL \u_uart_send|always1~2_combout\ : std_logic;
SIGNAL \u_uart_send|always1~3_combout\ : std_logic;
SIGNAL \u_uart_send|tx_cnt~6_combout\ : std_logic;
SIGNAL \u_uart_send|Add1~0_combout\ : std_logic;
SIGNAL \u_uart_send|tx_cnt~5_combout\ : std_logic;
SIGNAL \u_uart_send|always1~0_combout\ : std_logic;
SIGNAL \u_uart_send|always1~4_combout\ : std_logic;
SIGNAL \u_uart_send|tx_data[4]~1_combout\ : std_logic;
SIGNAL \u_uart_send|tx_data~5_combout\ : std_logic;
SIGNAL \u_uart_send|tx_data~3_combout\ : std_logic;
SIGNAL \u_uart_send|tx_data~4_combout\ : std_logic;
SIGNAL \u_uart_send|Mux0~1_combout\ : std_logic;
SIGNAL \u_uart_send|Mux0~2_combout\ : std_logic;
SIGNAL \u_uart_send|tx_data~8_combout\ : std_logic;
SIGNAL \u_uart_send|tx_data~6_combout\ : std_logic;
SIGNAL \u_uart_send|tx_data~7_combout\ : std_logic;
SIGNAL \u_uart_send|Mux0~3_combout\ : std_logic;
SIGNAL \u_uart_send|Mux0~4_combout\ : std_logic;
SIGNAL \u_uart_send|Mux0~5_combout\ : std_logic;
SIGNAL \u_uart_send|tx_data~0_combout\ : std_logic;
SIGNAL \u_uart_send|Mux0~0_combout\ : std_logic;
SIGNAL \u_uart_send|Mux0~6_combout\ : std_logic;
SIGNAL \u_uart_send|uart_txd~0_combout\ : std_logic;
SIGNAL \u_uart_send|uart_txd~q\ : std_logic;
SIGNAL \u_pll_clk|altpll_component|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \u_phase_diff_detect|r_data\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_uart_send|tx_data\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_uart_send|tx_cnt\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_uart_send|clk_cnt\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ALT_INV_sys_rst_n~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_sys_rst_n~input_o\ : std_logic;
SIGNAL \u_uart_send|ALT_INV_uart_txd~q\ : std_logic;
SIGNAL \u_phase_diff_detect|ALT_INV_r_detect_avail~q\ : std_logic;

BEGIN

ww_sys_clk <= sys_clk;
ww_sys_rst_n <= sys_rst_n;
ww_key <= key;
locked <= ww_locked;
o_phase_ok <= ww_o_phase_ok;
o_phase_fup_flag <= ww_o_phase_fup_flag;
uart_txd <= ww_uart_txd;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\u_pll_clk|altpll_component|auto_generated|pll1_INCLK_bus\ <= (gnd & \sys_clk~input_o\);

\u_pll_clk|altpll_component|auto_generated|wire_pll1_clk\(0) <= \u_pll_clk|altpll_component|auto_generated|pll1_CLK_bus\(0);
\u_pll_clk|altpll_component|auto_generated|wire_pll1_clk\(1) <= \u_pll_clk|altpll_component|auto_generated|pll1_CLK_bus\(1);
\u_pll_clk|altpll_component|auto_generated|wire_pll1_clk\(2) <= \u_pll_clk|altpll_component|auto_generated|pll1_CLK_bus\(2);
\u_pll_clk|altpll_component|auto_generated|wire_pll1_clk\(3) <= \u_pll_clk|altpll_component|auto_generated|pll1_CLK_bus\(3);
\u_pll_clk|altpll_component|auto_generated|wire_pll1_clk\(4) <= \u_pll_clk|altpll_component|auto_generated|pll1_CLK_bus\(4);

\u_pll_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \u_pll_clk|altpll_component|auto_generated|wire_pll1_clk\(1));

\sys_rst_n~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \sys_rst_n~input_o\);

\u_pll_clk|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \u_pll_clk|altpll_component|auto_generated|wire_pll1_clk\(0));

\sys_clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \sys_clk~input_o\);
\ALT_INV_sys_rst_n~inputclkctrl_outclk\ <= NOT \sys_rst_n~inputclkctrl_outclk\;
\ALT_INV_sys_rst_n~input_o\ <= NOT \sys_rst_n~input_o\;
\u_uart_send|ALT_INV_uart_txd~q\ <= NOT \u_uart_send|uart_txd~q\;
\u_phase_diff_detect|ALT_INV_r_detect_avail~q\ <= NOT \u_phase_diff_detect|r_detect_avail~q\;

-- Location: IOOBUF_X23_Y24_N2
\locked~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_pll_clk|altpll_component|auto_generated|locked~combout\,
	devoe => ww_devoe,
	o => ww_locked);

-- Location: IOOBUF_X28_Y24_N23
\o_phase_ok~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_phase_diff_detect|ALT_INV_r_detect_avail~q\,
	devoe => ww_devoe,
	o => ww_o_phase_ok);

-- Location: IOOBUF_X23_Y24_N16
\o_phase_fup_flag~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_phase_diff_detect|have_flag~q\,
	devoe => ww_devoe,
	o => ww_o_phase_fup_flag);

-- Location: IOOBUF_X9_Y0_N23
\uart_txd~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_uart_send|ALT_INV_uart_txd~q\,
	devoe => ww_devoe,
	o => ww_uart_txd);

-- Location: IOIBUF_X0_Y11_N22
\sys_rst_n~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sys_rst_n,
	o => \sys_rst_n~input_o\);

-- Location: CLKCTRL_G0
\sys_rst_n~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \sys_rst_n~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \sys_rst_n~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y11_N8
\sys_clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sys_clk,
	o => \sys_clk~input_o\);

-- Location: PLL_1
\u_pll_clk|altpll_component|auto_generated|pll1\ : cycloneive_pll
-- pragma translate_off
GENERIC MAP (
	auto_settings => "false",
	bandwidth_type => "medium",
	c0_high => 120,
	c0_initial => 1,
	c0_low => 120,
	c0_mode => "even",
	c0_ph => 0,
	c1_high => 250,
	c1_initial => 1,
	c1_low => 250,
	c1_mode => "even",
	c1_ph => 0,
	c1_use_casc_in => "on",
	c2_high => 120,
	c2_initial => 241,
	c2_low => 120,
	c2_mode => "even",
	c2_ph => 0,
	c2_use_casc_in => "off",
	c3_high => 250,
	c3_initial => 125,
	c3_low => 250,
	c3_mode => "even",
	c3_ph => 0,
	c3_use_casc_in => "on",
	c4_high => 0,
	c4_initial => 0,
	c4_low => 0,
	c4_mode => "bypass",
	c4_ph => 0,
	c4_use_casc_in => "off",
	charge_pump_current_bits => 1,
	clk0_counter => "c1",
	clk0_divide_by => 10000,
	clk0_duty_cycle => 50,
	clk0_multiply_by => 1,
	clk0_phase_shift => "0",
	clk1_counter => "c3",
	clk1_divide_by => 10000,
	clk1_duty_cycle => 50,
	clk1_multiply_by => 1,
	clk1_phase_shift => "50000000",
	clk2_counter => "unused",
	clk2_divide_by => 0,
	clk2_duty_cycle => 50,
	clk2_multiply_by => 0,
	clk2_phase_shift => "0",
	clk3_counter => "unused",
	clk3_divide_by => 0,
	clk3_duty_cycle => 50,
	clk3_multiply_by => 0,
	clk3_phase_shift => "0",
	clk4_counter => "unused",
	clk4_divide_by => 0,
	clk4_duty_cycle => 50,
	clk4_multiply_by => 0,
	clk4_phase_shift => "0",
	compensate_clock => "clock0",
	inclk0_input_frequency => 20000,
	inclk1_input_frequency => 0,
	loop_filter_c_bits => 0,
	loop_filter_r_bits => 27,
	m => 12,
	m_initial => 1,
	m_ph => 0,
	n => 1,
	operation_mode => "normal",
	pfd_max => 200000,
	pfd_min => 3076,
	pll_compensation_delay => 5891,
	self_reset_on_loss_lock => "off",
	simulation_type => "timing",
	switch_over_type => "auto",
	vco_center => 1538,
	vco_divide_by => 0,
	vco_frequency_control => "auto",
	vco_max => 3333,
	vco_min => 1538,
	vco_multiply_by => 0,
	vco_phase_shift_step => 208,
	vco_post_scale => 2)
-- pragma translate_on
PORT MAP (
	areset => \ALT_INV_sys_rst_n~inputclkctrl_outclk\,
	fbin => \u_pll_clk|altpll_component|auto_generated|wire_pll1_fbout\,
	inclk => \u_pll_clk|altpll_component|auto_generated|pll1_INCLK_bus\,
	locked => \u_pll_clk|altpll_component|auto_generated|wire_pll1_locked\,
	fbout => \u_pll_clk|altpll_component|auto_generated|wire_pll1_fbout\,
	clk => \u_pll_clk|altpll_component|auto_generated|pll1_CLK_bus\);

-- Location: LCCOMB_X1_Y7_N0
\u_pll_clk|altpll_component|auto_generated|pll_lock_sync~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_pll_clk|altpll_component|auto_generated|pll_lock_sync~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \u_pll_clk|altpll_component|auto_generated|pll_lock_sync~feeder_combout\);

-- Location: FF_X1_Y7_N1
\u_pll_clk|altpll_component|auto_generated|pll_lock_sync\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_pll_clk|altpll_component|auto_generated|wire_pll1_locked\,
	d => \u_pll_clk|altpll_component|auto_generated|pll_lock_sync~feeder_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pll_clk|altpll_component|auto_generated|pll_lock_sync~q\);

-- Location: LCCOMB_X1_Y7_N18
\u_pll_clk|altpll_component|auto_generated|locked\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_pll_clk|altpll_component|auto_generated|locked~combout\ = (\u_pll_clk|altpll_component|auto_generated|wire_pll1_locked\ & \u_pll_clk|altpll_component|auto_generated|pll_lock_sync~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_pll_clk|altpll_component|auto_generated|wire_pll1_locked\,
	datad => \u_pll_clk|altpll_component|auto_generated|pll_lock_sync~q\,
	combout => \u_pll_clk|altpll_component|auto_generated|locked~combout\);

-- Location: CLKCTRL_G2
\sys_clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \sys_clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \sys_clk~inputclkctrl_outclk\);

-- Location: CLKCTRL_G3
\u_pll_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \u_pll_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \u_pll_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\);

-- Location: LCCOMB_X3_Y5_N26
\u_phase_diff_detect|r_sig2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_phase_diff_detect|r_sig2~0_combout\ = (\sys_rst_n~input_o\ & GLOBAL(\u_pll_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sys_rst_n~input_o\,
	datac => \u_pll_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	combout => \u_phase_diff_detect|r_sig2~0_combout\);

-- Location: FF_X3_Y5_N27
\u_phase_diff_detect|r_sig2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_phase_diff_detect|r_sig2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_phase_diff_detect|r_sig2~q\);

-- Location: LCCOMB_X3_Y5_N24
\u_phase_diff_detect|r_rstn~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_phase_diff_detect|r_rstn~feeder_combout\ = \sys_rst_n~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sys_rst_n~input_o\,
	combout => \u_phase_diff_detect|r_rstn~feeder_combout\);

-- Location: FF_X3_Y5_N25
\u_phase_diff_detect|r_rstn\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_phase_diff_detect|r_rstn~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_phase_diff_detect|r_rstn~q\);

-- Location: LCCOMB_X1_Y5_N26
\u_phase_diff_detect|r_start2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_phase_diff_detect|r_start2~0_combout\ = (!\u_phase_diff_detect|r_sig2~q\ & (GLOBAL(\u_pll_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\) & \u_phase_diff_detect|r_rstn~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_phase_diff_detect|r_sig2~q\,
	datac => \u_pll_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	datad => \u_phase_diff_detect|r_rstn~q\,
	combout => \u_phase_diff_detect|r_start2~0_combout\);

-- Location: FF_X1_Y5_N27
\u_phase_diff_detect|r_start2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_phase_diff_detect|r_start2~0_combout\,
	sclr => \ALT_INV_sys_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_phase_diff_detect|r_start2~q\);

-- Location: LCCOMB_X1_Y5_N6
\u_phase_diff_detect|r_detect_avail~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_phase_diff_detect|r_detect_avail~0_combout\ = (!\u_phase_diff_detect|r_start2~q\ & \u_phase_diff_detect|r_detect_avail~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_phase_diff_detect|r_start2~q\,
	datad => \u_phase_diff_detect|r_detect_avail~q\,
	combout => \u_phase_diff_detect|r_detect_avail~0_combout\);

-- Location: LCCOMB_X1_Y5_N8
\u_phase_diff_detect|r_data[0]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_phase_diff_detect|r_data[0]~8_combout\ = (\u_phase_diff_detect|r_data\(0) & (\u_phase_diff_detect|r_detect_avail~q\ $ (VCC))) # (!\u_phase_diff_detect|r_data\(0) & (\u_phase_diff_detect|r_detect_avail~q\ & VCC))
-- \u_phase_diff_detect|r_data[0]~9\ = CARRY((\u_phase_diff_detect|r_data\(0) & \u_phase_diff_detect|r_detect_avail~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_phase_diff_detect|r_data\(0),
	datab => \u_phase_diff_detect|r_detect_avail~q\,
	datad => VCC,
	combout => \u_phase_diff_detect|r_data[0]~8_combout\,
	cout => \u_phase_diff_detect|r_data[0]~9\);

-- Location: FF_X1_Y5_N9
\u_phase_diff_detect|r_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_phase_diff_detect|r_data[0]~8_combout\,
	sclr => \ALT_INV_sys_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_phase_diff_detect|r_data\(0));

-- Location: LCCOMB_X1_Y5_N10
\u_phase_diff_detect|r_data[1]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_phase_diff_detect|r_data[1]~10_combout\ = (\u_phase_diff_detect|r_data\(1) & (!\u_phase_diff_detect|r_data[0]~9\)) # (!\u_phase_diff_detect|r_data\(1) & ((\u_phase_diff_detect|r_data[0]~9\) # (GND)))
-- \u_phase_diff_detect|r_data[1]~11\ = CARRY((!\u_phase_diff_detect|r_data[0]~9\) # (!\u_phase_diff_detect|r_data\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_phase_diff_detect|r_data\(1),
	datad => VCC,
	cin => \u_phase_diff_detect|r_data[0]~9\,
	combout => \u_phase_diff_detect|r_data[1]~10_combout\,
	cout => \u_phase_diff_detect|r_data[1]~11\);

-- Location: FF_X1_Y5_N11
\u_phase_diff_detect|r_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_phase_diff_detect|r_data[1]~10_combout\,
	sclr => \ALT_INV_sys_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_phase_diff_detect|r_data\(1));

-- Location: LCCOMB_X1_Y5_N12
\u_phase_diff_detect|r_data[2]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_phase_diff_detect|r_data[2]~12_combout\ = (\u_phase_diff_detect|r_data\(2) & (\u_phase_diff_detect|r_data[1]~11\ $ (GND))) # (!\u_phase_diff_detect|r_data\(2) & (!\u_phase_diff_detect|r_data[1]~11\ & VCC))
-- \u_phase_diff_detect|r_data[2]~13\ = CARRY((\u_phase_diff_detect|r_data\(2) & !\u_phase_diff_detect|r_data[1]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_phase_diff_detect|r_data\(2),
	datad => VCC,
	cin => \u_phase_diff_detect|r_data[1]~11\,
	combout => \u_phase_diff_detect|r_data[2]~12_combout\,
	cout => \u_phase_diff_detect|r_data[2]~13\);

-- Location: FF_X1_Y5_N13
\u_phase_diff_detect|r_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_phase_diff_detect|r_data[2]~12_combout\,
	sclr => \ALT_INV_sys_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_phase_diff_detect|r_data\(2));

-- Location: LCCOMB_X1_Y5_N14
\u_phase_diff_detect|r_data[3]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_phase_diff_detect|r_data[3]~14_combout\ = (\u_phase_diff_detect|r_data\(3) & (!\u_phase_diff_detect|r_data[2]~13\)) # (!\u_phase_diff_detect|r_data\(3) & ((\u_phase_diff_detect|r_data[2]~13\) # (GND)))
-- \u_phase_diff_detect|r_data[3]~15\ = CARRY((!\u_phase_diff_detect|r_data[2]~13\) # (!\u_phase_diff_detect|r_data\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_phase_diff_detect|r_data\(3),
	datad => VCC,
	cin => \u_phase_diff_detect|r_data[2]~13\,
	combout => \u_phase_diff_detect|r_data[3]~14_combout\,
	cout => \u_phase_diff_detect|r_data[3]~15\);

-- Location: FF_X1_Y5_N15
\u_phase_diff_detect|r_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_phase_diff_detect|r_data[3]~14_combout\,
	sclr => \ALT_INV_sys_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_phase_diff_detect|r_data\(3));

-- Location: LCCOMB_X1_Y5_N16
\u_phase_diff_detect|r_data[4]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_phase_diff_detect|r_data[4]~16_combout\ = (\u_phase_diff_detect|r_data\(4) & (\u_phase_diff_detect|r_data[3]~15\ $ (GND))) # (!\u_phase_diff_detect|r_data\(4) & (!\u_phase_diff_detect|r_data[3]~15\ & VCC))
-- \u_phase_diff_detect|r_data[4]~17\ = CARRY((\u_phase_diff_detect|r_data\(4) & !\u_phase_diff_detect|r_data[3]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_phase_diff_detect|r_data\(4),
	datad => VCC,
	cin => \u_phase_diff_detect|r_data[3]~15\,
	combout => \u_phase_diff_detect|r_data[4]~16_combout\,
	cout => \u_phase_diff_detect|r_data[4]~17\);

-- Location: FF_X1_Y5_N17
\u_phase_diff_detect|r_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_phase_diff_detect|r_data[4]~16_combout\,
	sclr => \ALT_INV_sys_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_phase_diff_detect|r_data\(4));

-- Location: LCCOMB_X1_Y5_N18
\u_phase_diff_detect|r_data[5]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_phase_diff_detect|r_data[5]~18_combout\ = (\u_phase_diff_detect|r_data\(5) & (!\u_phase_diff_detect|r_data[4]~17\)) # (!\u_phase_diff_detect|r_data\(5) & ((\u_phase_diff_detect|r_data[4]~17\) # (GND)))
-- \u_phase_diff_detect|r_data[5]~19\ = CARRY((!\u_phase_diff_detect|r_data[4]~17\) # (!\u_phase_diff_detect|r_data\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_phase_diff_detect|r_data\(5),
	datad => VCC,
	cin => \u_phase_diff_detect|r_data[4]~17\,
	combout => \u_phase_diff_detect|r_data[5]~18_combout\,
	cout => \u_phase_diff_detect|r_data[5]~19\);

-- Location: FF_X1_Y5_N19
\u_phase_diff_detect|r_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_phase_diff_detect|r_data[5]~18_combout\,
	sclr => \ALT_INV_sys_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_phase_diff_detect|r_data\(5));

-- Location: LCCOMB_X1_Y5_N20
\u_phase_diff_detect|r_data[6]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_phase_diff_detect|r_data[6]~20_combout\ = (\u_phase_diff_detect|r_data\(6) & (\u_phase_diff_detect|r_data[5]~19\ $ (GND))) # (!\u_phase_diff_detect|r_data\(6) & (!\u_phase_diff_detect|r_data[5]~19\ & VCC))
-- \u_phase_diff_detect|r_data[6]~21\ = CARRY((\u_phase_diff_detect|r_data\(6) & !\u_phase_diff_detect|r_data[5]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_phase_diff_detect|r_data\(6),
	datad => VCC,
	cin => \u_phase_diff_detect|r_data[5]~19\,
	combout => \u_phase_diff_detect|r_data[6]~20_combout\,
	cout => \u_phase_diff_detect|r_data[6]~21\);

-- Location: FF_X1_Y5_N21
\u_phase_diff_detect|r_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_phase_diff_detect|r_data[6]~20_combout\,
	sclr => \ALT_INV_sys_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_phase_diff_detect|r_data\(6));

-- Location: LCCOMB_X1_Y5_N0
\u_phase_diff_detect|always5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_phase_diff_detect|always5~1_combout\ = (!\u_phase_diff_detect|r_data\(5) & (!\u_phase_diff_detect|r_data\(6) & (!\u_phase_diff_detect|r_data\(3) & !\u_phase_diff_detect|r_data\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_phase_diff_detect|r_data\(5),
	datab => \u_phase_diff_detect|r_data\(6),
	datac => \u_phase_diff_detect|r_data\(3),
	datad => \u_phase_diff_detect|r_data\(4),
	combout => \u_phase_diff_detect|always5~1_combout\);

-- Location: LCCOMB_X1_Y5_N22
\u_phase_diff_detect|r_data[7]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_phase_diff_detect|r_data[7]~22_combout\ = \u_phase_diff_detect|r_data\(7) $ (\u_phase_diff_detect|r_data[6]~21\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_phase_diff_detect|r_data\(7),
	cin => \u_phase_diff_detect|r_data[6]~21\,
	combout => \u_phase_diff_detect|r_data[7]~22_combout\);

-- Location: FF_X1_Y5_N23
\u_phase_diff_detect|r_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_phase_diff_detect|r_data[7]~22_combout\,
	sclr => \ALT_INV_sys_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_phase_diff_detect|r_data\(7));

-- Location: CLKCTRL_G4
\u_pll_clk|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \u_pll_clk|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \u_pll_clk|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\);

-- Location: LCCOMB_X3_Y5_N14
\u_phase_diff_detect|r_sig1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_phase_diff_detect|r_sig1~0_combout\ = (\sys_rst_n~input_o\ & GLOBAL(\u_pll_clk|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sys_rst_n~input_o\,
	datac => \u_pll_clk|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	combout => \u_phase_diff_detect|r_sig1~0_combout\);

-- Location: FF_X3_Y5_N29
\u_phase_diff_detect|r_sig1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	asdata => \u_phase_diff_detect|r_sig1~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_phase_diff_detect|r_sig1~q\);

-- Location: LCCOMB_X3_Y5_N28
\u_phase_diff_detect|r_start1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_phase_diff_detect|r_start1~0_combout\ = (GLOBAL(\u_pll_clk|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\) & (!\u_phase_diff_detect|r_sig1~q\ & \u_phase_diff_detect|r_rstn~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_pll_clk|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	datac => \u_phase_diff_detect|r_sig1~q\,
	datad => \u_phase_diff_detect|r_rstn~q\,
	combout => \u_phase_diff_detect|r_start1~0_combout\);

-- Location: FF_X2_Y5_N25
\u_phase_diff_detect|r_start1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	asdata => \u_phase_diff_detect|r_start1~0_combout\,
	sclr => \ALT_INV_sys_rst_n~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_phase_diff_detect|r_start1~q\);

-- Location: LCCOMB_X2_Y5_N24
\u_phase_diff_detect|always5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_phase_diff_detect|always5~0_combout\ = (!\u_phase_diff_detect|r_data\(1) & (!\u_phase_diff_detect|r_data\(2) & (\u_phase_diff_detect|r_start1~q\ & !\u_phase_diff_detect|r_data\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_phase_diff_detect|r_data\(1),
	datab => \u_phase_diff_detect|r_data\(2),
	datac => \u_phase_diff_detect|r_start1~q\,
	datad => \u_phase_diff_detect|r_data\(0),
	combout => \u_phase_diff_detect|always5~0_combout\);

-- Location: LCCOMB_X1_Y5_N24
\u_phase_diff_detect|r_detect_avail~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_phase_diff_detect|r_detect_avail~1_combout\ = (\u_phase_diff_detect|r_detect_avail~0_combout\) # ((\u_phase_diff_detect|always5~1_combout\ & (!\u_phase_diff_detect|r_data\(7) & \u_phase_diff_detect|always5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_phase_diff_detect|r_detect_avail~0_combout\,
	datab => \u_phase_diff_detect|always5~1_combout\,
	datac => \u_phase_diff_detect|r_data\(7),
	datad => \u_phase_diff_detect|always5~0_combout\,
	combout => \u_phase_diff_detect|r_detect_avail~1_combout\);

-- Location: FF_X1_Y5_N25
\u_phase_diff_detect|r_detect_avail\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_phase_diff_detect|r_detect_avail~1_combout\,
	sclr => \ALT_INV_sys_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_phase_diff_detect|r_detect_avail~q\);

-- Location: FF_X3_Y5_N31
\u_phase_diff_detect|clk_ref_prv\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	asdata => \u_pll_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_phase_diff_detect|clk_ref_prv~q\);

-- Location: FF_X3_Y5_N13
\u_phase_diff_detect|clk_fb_prv\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	asdata => \u_pll_clk|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_phase_diff_detect|clk_fb_prv~q\);

-- Location: LCCOMB_X3_Y5_N12
\u_phase_diff_detect|have_flag~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_phase_diff_detect|have_flag~1_combout\ = (\sys_rst_n~input_o\ & (((\u_phase_diff_detect|clk_fb_prv~q\) # (\u_phase_diff_detect|flag_ok~q\)) # (!GLOBAL(\u_pll_clk|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sys_rst_n~input_o\,
	datab => \u_pll_clk|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	datac => \u_phase_diff_detect|clk_fb_prv~q\,
	datad => \u_phase_diff_detect|flag_ok~q\,
	combout => \u_phase_diff_detect|have_flag~1_combout\);

-- Location: LCCOMB_X3_Y5_N30
\u_phase_diff_detect|have_flag~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_phase_diff_detect|have_flag~2_combout\ = ((GLOBAL(\u_pll_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\) & (!\u_phase_diff_detect|flag_ok~q\ & !\u_phase_diff_detect|clk_ref_prv~q\))) # (!\u_phase_diff_detect|have_flag~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_pll_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	datab => \u_phase_diff_detect|flag_ok~q\,
	datac => \u_phase_diff_detect|clk_ref_prv~q\,
	datad => \u_phase_diff_detect|have_flag~1_combout\,
	combout => \u_phase_diff_detect|have_flag~2_combout\);

-- Location: FF_X3_Y5_N3
\u_phase_diff_detect|flag_ok\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	asdata => \sys_rst_n~input_o\,
	sload => VCC,
	ena => \u_phase_diff_detect|have_flag~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_phase_diff_detect|flag_ok~q\);

-- Location: LCCOMB_X3_Y5_N2
\u_phase_diff_detect|have_flag~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_phase_diff_detect|have_flag~0_combout\ = (GLOBAL(\u_pll_clk|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\) & (\sys_rst_n~input_o\ & (!\u_phase_diff_detect|flag_ok~q\ & !\u_phase_diff_detect|clk_fb_prv~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_pll_clk|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	datab => \sys_rst_n~input_o\,
	datac => \u_phase_diff_detect|flag_ok~q\,
	datad => \u_phase_diff_detect|clk_fb_prv~q\,
	combout => \u_phase_diff_detect|have_flag~0_combout\);

-- Location: LCCOMB_X3_Y5_N16
\u_phase_diff_detect|have_flag~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_phase_diff_detect|have_flag~feeder_combout\ = \u_phase_diff_detect|have_flag~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_phase_diff_detect|have_flag~0_combout\,
	combout => \u_phase_diff_detect|have_flag~feeder_combout\);

-- Location: FF_X3_Y5_N17
\u_phase_diff_detect|have_flag\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_phase_diff_detect|have_flag~feeder_combout\,
	ena => \u_phase_diff_detect|have_flag~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_phase_diff_detect|have_flag~q\);

-- Location: IOIBUF_X34_Y12_N8
\key~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_key,
	o => \key~input_o\);

-- Location: FF_X2_Y2_N29
\u_uart_send|uart_en_d0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	asdata => \key~input_o\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|uart_en_d0~q\);

-- Location: LCCOMB_X2_Y2_N14
\u_uart_send|uart_en_d1~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|uart_en_d1~feeder_combout\ = \u_uart_send|uart_en_d0~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_uart_send|uart_en_d0~q\,
	combout => \u_uart_send|uart_en_d1~feeder_combout\);

-- Location: FF_X2_Y2_N15
\u_uart_send|uart_en_d1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|uart_en_d1~feeder_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|uart_en_d1~q\);

-- Location: LCCOMB_X2_Y2_N12
\u_uart_send|tx_data~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|tx_data~2_combout\ = (\u_phase_diff_detect|r_data\(5) & (!\u_uart_send|uart_en_d1~q\ & \u_uart_send|uart_en_d0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_phase_diff_detect|r_data\(5),
	datac => \u_uart_send|uart_en_d1~q\,
	datad => \u_uart_send|uart_en_d0~q\,
	combout => \u_uart_send|tx_data~2_combout\);

-- Location: LCCOMB_X9_Y11_N0
\u_uart_send|clk_cnt[0]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|clk_cnt[0]~16_combout\ = \u_uart_send|clk_cnt\(0) $ (VCC)
-- \u_uart_send|clk_cnt[0]~17\ = CARRY(\u_uart_send|clk_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_uart_send|clk_cnt\(0),
	datad => VCC,
	combout => \u_uart_send|clk_cnt[0]~16_combout\,
	cout => \u_uart_send|clk_cnt[0]~17\);

-- Location: LCCOMB_X2_Y2_N26
\u_uart_send|tx_flag~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|tx_flag~0_combout\ = (\u_uart_send|uart_en_d1~q\ & (((\u_uart_send|tx_flag~q\ & \u_uart_send|always1~4_combout\)))) # (!\u_uart_send|uart_en_d1~q\ & ((\u_uart_send|uart_en_d0~q\) # ((\u_uart_send|tx_flag~q\ & 
-- \u_uart_send|always1~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|uart_en_d1~q\,
	datab => \u_uart_send|uart_en_d0~q\,
	datac => \u_uart_send|tx_flag~q\,
	datad => \u_uart_send|always1~4_combout\,
	combout => \u_uart_send|tx_flag~0_combout\);

-- Location: FF_X2_Y2_N27
\u_uart_send|tx_flag\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|tx_flag~0_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|tx_flag~q\);

-- Location: LCCOMB_X10_Y10_N30
\u_uart_send|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|LessThan0~0_combout\ = (!\u_uart_send|clk_cnt\(2) & (!\u_uart_send|clk_cnt\(3) & (!\u_uart_send|clk_cnt\(0) & !\u_uart_send|clk_cnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|clk_cnt\(2),
	datab => \u_uart_send|clk_cnt\(3),
	datac => \u_uart_send|clk_cnt\(0),
	datad => \u_uart_send|clk_cnt\(1),
	combout => \u_uart_send|LessThan0~0_combout\);

-- Location: LCCOMB_X10_Y10_N16
\u_uart_send|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|LessThan0~1_combout\ = (!\u_uart_send|clk_cnt\(6) & (((\u_uart_send|LessThan0~0_combout\) # (!\u_uart_send|clk_cnt\(4))) # (!\u_uart_send|clk_cnt\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|clk_cnt\(5),
	datab => \u_uart_send|clk_cnt\(6),
	datac => \u_uart_send|clk_cnt\(4),
	datad => \u_uart_send|LessThan0~0_combout\,
	combout => \u_uart_send|LessThan0~1_combout\);

-- Location: LCCOMB_X10_Y10_N10
\u_uart_send|LessThan0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|LessThan0~2_combout\ = (!\u_uart_send|clk_cnt\(7)) # (!\u_uart_send|clk_cnt\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|clk_cnt\(8),
	datad => \u_uart_send|clk_cnt\(7),
	combout => \u_uart_send|LessThan0~2_combout\);

-- Location: LCCOMB_X10_Y10_N4
\u_uart_send|tx_cnt[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|tx_cnt[3]~3_combout\ = (((!\u_uart_send|LessThan0~1_combout\ & !\u_uart_send|LessThan0~2_combout\)) # (!\u_uart_send|tx_cnt[3]~1_combout\)) # (!\u_uart_send|tx_flag~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|tx_flag~q\,
	datab => \u_uart_send|LessThan0~1_combout\,
	datac => \u_uart_send|tx_cnt[3]~1_combout\,
	datad => \u_uart_send|LessThan0~2_combout\,
	combout => \u_uart_send|tx_cnt[3]~3_combout\);

-- Location: FF_X9_Y11_N1
\u_uart_send|clk_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|clk_cnt[0]~16_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	sclr => \u_uart_send|tx_cnt[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|clk_cnt\(0));

-- Location: LCCOMB_X9_Y11_N2
\u_uart_send|clk_cnt[1]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|clk_cnt[1]~18_combout\ = (\u_uart_send|clk_cnt\(1) & (!\u_uart_send|clk_cnt[0]~17\)) # (!\u_uart_send|clk_cnt\(1) & ((\u_uart_send|clk_cnt[0]~17\) # (GND)))
-- \u_uart_send|clk_cnt[1]~19\ = CARRY((!\u_uart_send|clk_cnt[0]~17\) # (!\u_uart_send|clk_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_uart_send|clk_cnt\(1),
	datad => VCC,
	cin => \u_uart_send|clk_cnt[0]~17\,
	combout => \u_uart_send|clk_cnt[1]~18_combout\,
	cout => \u_uart_send|clk_cnt[1]~19\);

-- Location: FF_X9_Y11_N3
\u_uart_send|clk_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|clk_cnt[1]~18_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	sclr => \u_uart_send|tx_cnt[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|clk_cnt\(1));

-- Location: LCCOMB_X9_Y11_N4
\u_uart_send|clk_cnt[2]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|clk_cnt[2]~20_combout\ = (\u_uart_send|clk_cnt\(2) & (\u_uart_send|clk_cnt[1]~19\ $ (GND))) # (!\u_uart_send|clk_cnt\(2) & (!\u_uart_send|clk_cnt[1]~19\ & VCC))
-- \u_uart_send|clk_cnt[2]~21\ = CARRY((\u_uart_send|clk_cnt\(2) & !\u_uart_send|clk_cnt[1]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_uart_send|clk_cnt\(2),
	datad => VCC,
	cin => \u_uart_send|clk_cnt[1]~19\,
	combout => \u_uart_send|clk_cnt[2]~20_combout\,
	cout => \u_uart_send|clk_cnt[2]~21\);

-- Location: FF_X9_Y11_N5
\u_uart_send|clk_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|clk_cnt[2]~20_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	sclr => \u_uart_send|tx_cnt[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|clk_cnt\(2));

-- Location: LCCOMB_X9_Y11_N6
\u_uart_send|clk_cnt[3]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|clk_cnt[3]~22_combout\ = (\u_uart_send|clk_cnt\(3) & (!\u_uart_send|clk_cnt[2]~21\)) # (!\u_uart_send|clk_cnt\(3) & ((\u_uart_send|clk_cnt[2]~21\) # (GND)))
-- \u_uart_send|clk_cnt[3]~23\ = CARRY((!\u_uart_send|clk_cnt[2]~21\) # (!\u_uart_send|clk_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|clk_cnt\(3),
	datad => VCC,
	cin => \u_uart_send|clk_cnt[2]~21\,
	combout => \u_uart_send|clk_cnt[3]~22_combout\,
	cout => \u_uart_send|clk_cnt[3]~23\);

-- Location: FF_X9_Y11_N7
\u_uart_send|clk_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|clk_cnt[3]~22_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	sclr => \u_uart_send|tx_cnt[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|clk_cnt\(3));

-- Location: LCCOMB_X9_Y11_N8
\u_uart_send|clk_cnt[4]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|clk_cnt[4]~24_combout\ = (\u_uart_send|clk_cnt\(4) & (\u_uart_send|clk_cnt[3]~23\ $ (GND))) # (!\u_uart_send|clk_cnt\(4) & (!\u_uart_send|clk_cnt[3]~23\ & VCC))
-- \u_uart_send|clk_cnt[4]~25\ = CARRY((\u_uart_send|clk_cnt\(4) & !\u_uart_send|clk_cnt[3]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_uart_send|clk_cnt\(4),
	datad => VCC,
	cin => \u_uart_send|clk_cnt[3]~23\,
	combout => \u_uart_send|clk_cnt[4]~24_combout\,
	cout => \u_uart_send|clk_cnt[4]~25\);

-- Location: FF_X9_Y11_N9
\u_uart_send|clk_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|clk_cnt[4]~24_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	sclr => \u_uart_send|tx_cnt[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|clk_cnt\(4));

-- Location: LCCOMB_X9_Y11_N10
\u_uart_send|clk_cnt[5]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|clk_cnt[5]~26_combout\ = (\u_uart_send|clk_cnt\(5) & (!\u_uart_send|clk_cnt[4]~25\)) # (!\u_uart_send|clk_cnt\(5) & ((\u_uart_send|clk_cnt[4]~25\) # (GND)))
-- \u_uart_send|clk_cnt[5]~27\ = CARRY((!\u_uart_send|clk_cnt[4]~25\) # (!\u_uart_send|clk_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|clk_cnt\(5),
	datad => VCC,
	cin => \u_uart_send|clk_cnt[4]~25\,
	combout => \u_uart_send|clk_cnt[5]~26_combout\,
	cout => \u_uart_send|clk_cnt[5]~27\);

-- Location: FF_X9_Y11_N11
\u_uart_send|clk_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|clk_cnt[5]~26_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	sclr => \u_uart_send|tx_cnt[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|clk_cnt\(5));

-- Location: LCCOMB_X9_Y11_N12
\u_uart_send|clk_cnt[6]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|clk_cnt[6]~28_combout\ = (\u_uart_send|clk_cnt\(6) & (\u_uart_send|clk_cnt[5]~27\ $ (GND))) # (!\u_uart_send|clk_cnt\(6) & (!\u_uart_send|clk_cnt[5]~27\ & VCC))
-- \u_uart_send|clk_cnt[6]~29\ = CARRY((\u_uart_send|clk_cnt\(6) & !\u_uart_send|clk_cnt[5]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|clk_cnt\(6),
	datad => VCC,
	cin => \u_uart_send|clk_cnt[5]~27\,
	combout => \u_uart_send|clk_cnt[6]~28_combout\,
	cout => \u_uart_send|clk_cnt[6]~29\);

-- Location: FF_X9_Y11_N13
\u_uart_send|clk_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|clk_cnt[6]~28_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	sclr => \u_uart_send|tx_cnt[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|clk_cnt\(6));

-- Location: LCCOMB_X9_Y11_N14
\u_uart_send|clk_cnt[7]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|clk_cnt[7]~30_combout\ = (\u_uart_send|clk_cnt\(7) & (!\u_uart_send|clk_cnt[6]~29\)) # (!\u_uart_send|clk_cnt\(7) & ((\u_uart_send|clk_cnt[6]~29\) # (GND)))
-- \u_uart_send|clk_cnt[7]~31\ = CARRY((!\u_uart_send|clk_cnt[6]~29\) # (!\u_uart_send|clk_cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_uart_send|clk_cnt\(7),
	datad => VCC,
	cin => \u_uart_send|clk_cnt[6]~29\,
	combout => \u_uart_send|clk_cnt[7]~30_combout\,
	cout => \u_uart_send|clk_cnt[7]~31\);

-- Location: FF_X9_Y11_N15
\u_uart_send|clk_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|clk_cnt[7]~30_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	sclr => \u_uart_send|tx_cnt[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|clk_cnt\(7));

-- Location: LCCOMB_X9_Y11_N16
\u_uart_send|clk_cnt[8]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|clk_cnt[8]~32_combout\ = (\u_uart_send|clk_cnt\(8) & (\u_uart_send|clk_cnt[7]~31\ $ (GND))) # (!\u_uart_send|clk_cnt\(8) & (!\u_uart_send|clk_cnt[7]~31\ & VCC))
-- \u_uart_send|clk_cnt[8]~33\ = CARRY((\u_uart_send|clk_cnt\(8) & !\u_uart_send|clk_cnt[7]~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_uart_send|clk_cnt\(8),
	datad => VCC,
	cin => \u_uart_send|clk_cnt[7]~31\,
	combout => \u_uart_send|clk_cnt[8]~32_combout\,
	cout => \u_uart_send|clk_cnt[8]~33\);

-- Location: FF_X9_Y11_N17
\u_uart_send|clk_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|clk_cnt[8]~32_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	sclr => \u_uart_send|tx_cnt[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|clk_cnt\(8));

-- Location: LCCOMB_X9_Y11_N18
\u_uart_send|clk_cnt[9]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|clk_cnt[9]~34_combout\ = (\u_uart_send|clk_cnt\(9) & (!\u_uart_send|clk_cnt[8]~33\)) # (!\u_uart_send|clk_cnt\(9) & ((\u_uart_send|clk_cnt[8]~33\) # (GND)))
-- \u_uart_send|clk_cnt[9]~35\ = CARRY((!\u_uart_send|clk_cnt[8]~33\) # (!\u_uart_send|clk_cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_uart_send|clk_cnt\(9),
	datad => VCC,
	cin => \u_uart_send|clk_cnt[8]~33\,
	combout => \u_uart_send|clk_cnt[9]~34_combout\,
	cout => \u_uart_send|clk_cnt[9]~35\);

-- Location: FF_X9_Y11_N19
\u_uart_send|clk_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|clk_cnt[9]~34_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	sclr => \u_uart_send|tx_cnt[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|clk_cnt\(9));

-- Location: LCCOMB_X9_Y11_N20
\u_uart_send|clk_cnt[10]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|clk_cnt[10]~36_combout\ = (\u_uart_send|clk_cnt\(10) & (\u_uart_send|clk_cnt[9]~35\ $ (GND))) # (!\u_uart_send|clk_cnt\(10) & (!\u_uart_send|clk_cnt[9]~35\ & VCC))
-- \u_uart_send|clk_cnt[10]~37\ = CARRY((\u_uart_send|clk_cnt\(10) & !\u_uart_send|clk_cnt[9]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_uart_send|clk_cnt\(10),
	datad => VCC,
	cin => \u_uart_send|clk_cnt[9]~35\,
	combout => \u_uart_send|clk_cnt[10]~36_combout\,
	cout => \u_uart_send|clk_cnt[10]~37\);

-- Location: FF_X9_Y11_N21
\u_uart_send|clk_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|clk_cnt[10]~36_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	sclr => \u_uart_send|tx_cnt[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|clk_cnt\(10));

-- Location: LCCOMB_X9_Y11_N22
\u_uart_send|clk_cnt[11]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|clk_cnt[11]~38_combout\ = (\u_uart_send|clk_cnt\(11) & (!\u_uart_send|clk_cnt[10]~37\)) # (!\u_uart_send|clk_cnt\(11) & ((\u_uart_send|clk_cnt[10]~37\) # (GND)))
-- \u_uart_send|clk_cnt[11]~39\ = CARRY((!\u_uart_send|clk_cnt[10]~37\) # (!\u_uart_send|clk_cnt\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|clk_cnt\(11),
	datad => VCC,
	cin => \u_uart_send|clk_cnt[10]~37\,
	combout => \u_uart_send|clk_cnt[11]~38_combout\,
	cout => \u_uart_send|clk_cnt[11]~39\);

-- Location: FF_X9_Y11_N23
\u_uart_send|clk_cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|clk_cnt[11]~38_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	sclr => \u_uart_send|tx_cnt[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|clk_cnt\(11));

-- Location: LCCOMB_X9_Y11_N24
\u_uart_send|clk_cnt[12]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|clk_cnt[12]~40_combout\ = (\u_uart_send|clk_cnt\(12) & (\u_uart_send|clk_cnt[11]~39\ $ (GND))) # (!\u_uart_send|clk_cnt\(12) & (!\u_uart_send|clk_cnt[11]~39\ & VCC))
-- \u_uart_send|clk_cnt[12]~41\ = CARRY((\u_uart_send|clk_cnt\(12) & !\u_uart_send|clk_cnt[11]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_uart_send|clk_cnt\(12),
	datad => VCC,
	cin => \u_uart_send|clk_cnt[11]~39\,
	combout => \u_uart_send|clk_cnt[12]~40_combout\,
	cout => \u_uart_send|clk_cnt[12]~41\);

-- Location: FF_X9_Y11_N25
\u_uart_send|clk_cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|clk_cnt[12]~40_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	sclr => \u_uart_send|tx_cnt[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|clk_cnt\(12));

-- Location: LCCOMB_X9_Y11_N26
\u_uart_send|clk_cnt[13]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|clk_cnt[13]~42_combout\ = (\u_uart_send|clk_cnt\(13) & (!\u_uart_send|clk_cnt[12]~41\)) # (!\u_uart_send|clk_cnt\(13) & ((\u_uart_send|clk_cnt[12]~41\) # (GND)))
-- \u_uart_send|clk_cnt[13]~43\ = CARRY((!\u_uart_send|clk_cnt[12]~41\) # (!\u_uart_send|clk_cnt\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|clk_cnt\(13),
	datad => VCC,
	cin => \u_uart_send|clk_cnt[12]~41\,
	combout => \u_uart_send|clk_cnt[13]~42_combout\,
	cout => \u_uart_send|clk_cnt[13]~43\);

-- Location: FF_X9_Y11_N27
\u_uart_send|clk_cnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|clk_cnt[13]~42_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	sclr => \u_uart_send|tx_cnt[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|clk_cnt\(13));

-- Location: LCCOMB_X9_Y11_N28
\u_uart_send|clk_cnt[14]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|clk_cnt[14]~44_combout\ = (\u_uart_send|clk_cnt\(14) & (\u_uart_send|clk_cnt[13]~43\ $ (GND))) # (!\u_uart_send|clk_cnt\(14) & (!\u_uart_send|clk_cnt[13]~43\ & VCC))
-- \u_uart_send|clk_cnt[14]~45\ = CARRY((\u_uart_send|clk_cnt\(14) & !\u_uart_send|clk_cnt[13]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_uart_send|clk_cnt\(14),
	datad => VCC,
	cin => \u_uart_send|clk_cnt[13]~43\,
	combout => \u_uart_send|clk_cnt[14]~44_combout\,
	cout => \u_uart_send|clk_cnt[14]~45\);

-- Location: FF_X9_Y11_N29
\u_uart_send|clk_cnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|clk_cnt[14]~44_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	sclr => \u_uart_send|tx_cnt[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|clk_cnt\(14));

-- Location: LCCOMB_X9_Y11_N30
\u_uart_send|clk_cnt[15]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|clk_cnt[15]~46_combout\ = \u_uart_send|clk_cnt\(15) $ (\u_uart_send|clk_cnt[14]~45\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|clk_cnt\(15),
	cin => \u_uart_send|clk_cnt[14]~45\,
	combout => \u_uart_send|clk_cnt[15]~46_combout\);

-- Location: FF_X9_Y11_N31
\u_uart_send|clk_cnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|clk_cnt[15]~46_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	sclr => \u_uart_send|tx_cnt[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|clk_cnt\(15));

-- Location: LCCOMB_X10_Y10_N24
\u_uart_send|tx_cnt[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|tx_cnt[3]~0_combout\ = (!\u_uart_send|clk_cnt\(11) & (!\u_uart_send|clk_cnt\(12) & (!\u_uart_send|clk_cnt\(9) & !\u_uart_send|clk_cnt\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|clk_cnt\(11),
	datab => \u_uart_send|clk_cnt\(12),
	datac => \u_uart_send|clk_cnt\(9),
	datad => \u_uart_send|clk_cnt\(10),
	combout => \u_uart_send|tx_cnt[3]~0_combout\);

-- Location: LCCOMB_X10_Y10_N26
\u_uart_send|tx_cnt[3]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|tx_cnt[3]~1_combout\ = (!\u_uart_send|clk_cnt\(15) & (!\u_uart_send|clk_cnt\(14) & (!\u_uart_send|clk_cnt\(13) & \u_uart_send|tx_cnt[3]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|clk_cnt\(15),
	datab => \u_uart_send|clk_cnt\(14),
	datac => \u_uart_send|clk_cnt\(13),
	datad => \u_uart_send|tx_cnt[3]~0_combout\,
	combout => \u_uart_send|tx_cnt[3]~1_combout\);

-- Location: LCCOMB_X10_Y10_N8
\u_uart_send|tx_cnt~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|tx_cnt~2_combout\ = (\u_uart_send|tx_flag~q\ & !\u_uart_send|tx_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|tx_flag~q\,
	datac => \u_uart_send|tx_cnt\(0),
	combout => \u_uart_send|tx_cnt~2_combout\);

-- Location: FF_X10_Y10_N9
\u_uart_send|tx_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|tx_cnt~2_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	ena => \u_uart_send|tx_cnt[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|tx_cnt\(0));

-- Location: LCCOMB_X10_Y10_N2
\u_uart_send|tx_cnt~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|tx_cnt~4_combout\ = (\u_uart_send|tx_flag~q\ & (\u_uart_send|tx_cnt\(1) $ (\u_uart_send|tx_cnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|tx_flag~q\,
	datac => \u_uart_send|tx_cnt\(1),
	datad => \u_uart_send|tx_cnt\(0),
	combout => \u_uart_send|tx_cnt~4_combout\);

-- Location: FF_X10_Y10_N3
\u_uart_send|tx_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|tx_cnt~4_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	ena => \u_uart_send|tx_cnt[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|tx_cnt\(1));

-- Location: LCCOMB_X10_Y10_N18
\u_uart_send|always1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|always1~1_combout\ = ((\u_uart_send|tx_cnt\(1)) # ((!\u_uart_send|tx_cnt\(0)) # (!\u_uart_send|clk_cnt\(0)))) # (!\u_uart_send|clk_cnt\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|clk_cnt\(3),
	datab => \u_uart_send|tx_cnt\(1),
	datac => \u_uart_send|clk_cnt\(0),
	datad => \u_uart_send|tx_cnt\(0),
	combout => \u_uart_send|always1~1_combout\);

-- Location: LCCOMB_X10_Y10_N12
\u_uart_send|always1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|always1~2_combout\ = (((\u_uart_send|clk_cnt\(5)) # (!\u_uart_send|clk_cnt\(6))) # (!\u_uart_send|clk_cnt\(7))) # (!\u_uart_send|clk_cnt\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|clk_cnt\(4),
	datab => \u_uart_send|clk_cnt\(7),
	datac => \u_uart_send|clk_cnt\(5),
	datad => \u_uart_send|clk_cnt\(6),
	combout => \u_uart_send|always1~2_combout\);

-- Location: LCCOMB_X10_Y10_N22
\u_uart_send|always1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|always1~3_combout\ = (\u_uart_send|clk_cnt\(8)) # (\u_uart_send|always1~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|clk_cnt\(8),
	datad => \u_uart_send|always1~2_combout\,
	combout => \u_uart_send|always1~3_combout\);

-- Location: LCCOMB_X10_Y10_N6
\u_uart_send|tx_cnt~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|tx_cnt~6_combout\ = (\u_uart_send|tx_flag~q\ & (\u_uart_send|tx_cnt\(2) $ (((\u_uart_send|tx_cnt\(1) & \u_uart_send|tx_cnt\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|tx_flag~q\,
	datab => \u_uart_send|tx_cnt\(1),
	datac => \u_uart_send|tx_cnt\(2),
	datad => \u_uart_send|tx_cnt\(0),
	combout => \u_uart_send|tx_cnt~6_combout\);

-- Location: FF_X10_Y10_N7
\u_uart_send|tx_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|tx_cnt~6_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	ena => \u_uart_send|tx_cnt[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|tx_cnt\(2));

-- Location: LCCOMB_X10_Y10_N14
\u_uart_send|Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|Add1~0_combout\ = \u_uart_send|tx_cnt\(3) $ (((\u_uart_send|tx_cnt\(2) & (\u_uart_send|tx_cnt\(1) & \u_uart_send|tx_cnt\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|tx_cnt\(2),
	datab => \u_uart_send|tx_cnt\(3),
	datac => \u_uart_send|tx_cnt\(1),
	datad => \u_uart_send|tx_cnt\(0),
	combout => \u_uart_send|Add1~0_combout\);

-- Location: LCCOMB_X10_Y10_N20
\u_uart_send|tx_cnt~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|tx_cnt~5_combout\ = (\u_uart_send|Add1~0_combout\ & \u_uart_send|tx_flag~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_uart_send|Add1~0_combout\,
	datac => \u_uart_send|tx_flag~q\,
	combout => \u_uart_send|tx_cnt~5_combout\);

-- Location: FF_X10_Y10_N21
\u_uart_send|tx_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|tx_cnt~5_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	ena => \u_uart_send|tx_cnt[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|tx_cnt\(3));

-- Location: LCCOMB_X10_Y10_N0
\u_uart_send|always1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|always1~0_combout\ = (\u_uart_send|tx_cnt\(2)) # ((\u_uart_send|clk_cnt\(1)) # ((\u_uart_send|clk_cnt\(2)) # (!\u_uart_send|tx_cnt\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|tx_cnt\(2),
	datab => \u_uart_send|clk_cnt\(1),
	datac => \u_uart_send|clk_cnt\(2),
	datad => \u_uart_send|tx_cnt\(3),
	combout => \u_uart_send|always1~0_combout\);

-- Location: LCCOMB_X10_Y10_N28
\u_uart_send|always1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|always1~4_combout\ = ((\u_uart_send|always1~1_combout\) # ((\u_uart_send|always1~3_combout\) # (\u_uart_send|always1~0_combout\))) # (!\u_uart_send|tx_cnt[3]~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|tx_cnt[3]~1_combout\,
	datab => \u_uart_send|always1~1_combout\,
	datac => \u_uart_send|always1~3_combout\,
	datad => \u_uart_send|always1~0_combout\,
	combout => \u_uart_send|always1~4_combout\);

-- Location: LCCOMB_X2_Y2_N28
\u_uart_send|tx_data[4]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|tx_data[4]~1_combout\ = ((!\u_uart_send|uart_en_d1~q\ & \u_uart_send|uart_en_d0~q\)) # (!\u_uart_send|always1~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_uart_send|uart_en_d1~q\,
	datac => \u_uart_send|uart_en_d0~q\,
	datad => \u_uart_send|always1~4_combout\,
	combout => \u_uart_send|tx_data[4]~1_combout\);

-- Location: FF_X2_Y2_N13
\u_uart_send|tx_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|tx_data~2_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	ena => \u_uart_send|tx_data[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|tx_data\(5));

-- Location: LCCOMB_X2_Y2_N20
\u_uart_send|tx_data~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|tx_data~5_combout\ = (\u_phase_diff_detect|r_data\(6) & (!\u_uart_send|uart_en_d1~q\ & \u_uart_send|uart_en_d0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_phase_diff_detect|r_data\(6),
	datac => \u_uart_send|uart_en_d1~q\,
	datad => \u_uart_send|uart_en_d0~q\,
	combout => \u_uart_send|tx_data~5_combout\);

-- Location: FF_X2_Y2_N21
\u_uart_send|tx_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|tx_data~5_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	ena => \u_uart_send|tx_data[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|tx_data\(6));

-- Location: LCCOMB_X2_Y2_N6
\u_uart_send|tx_data~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|tx_data~3_combout\ = (!\u_uart_send|uart_en_d1~q\ & (\u_phase_diff_detect|r_data\(4) & \u_uart_send|uart_en_d0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_uart_send|uart_en_d1~q\,
	datac => \u_phase_diff_detect|r_data\(4),
	datad => \u_uart_send|uart_en_d0~q\,
	combout => \u_uart_send|tx_data~3_combout\);

-- Location: FF_X2_Y2_N7
\u_uart_send|tx_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|tx_data~3_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	ena => \u_uart_send|tx_data[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|tx_data\(4));

-- Location: LCCOMB_X2_Y2_N24
\u_uart_send|tx_data~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|tx_data~4_combout\ = (\u_phase_diff_detect|r_data\(3) & (!\u_uart_send|uart_en_d1~q\ & \u_uart_send|uart_en_d0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_phase_diff_detect|r_data\(3),
	datac => \u_uart_send|uart_en_d1~q\,
	datad => \u_uart_send|uart_en_d0~q\,
	combout => \u_uart_send|tx_data~4_combout\);

-- Location: FF_X2_Y2_N25
\u_uart_send|tx_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|tx_data~4_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	ena => \u_uart_send|tx_data[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|tx_data\(3));

-- Location: LCCOMB_X2_Y2_N10
\u_uart_send|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|Mux0~1_combout\ = (\u_uart_send|tx_cnt\(0) & ((\u_uart_send|tx_data\(4)) # ((\u_uart_send|tx_cnt\(1))))) # (!\u_uart_send|tx_cnt\(0) & (((\u_uart_send|tx_data\(3) & !\u_uart_send|tx_cnt\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|tx_data\(4),
	datab => \u_uart_send|tx_data\(3),
	datac => \u_uart_send|tx_cnt\(0),
	datad => \u_uart_send|tx_cnt\(1),
	combout => \u_uart_send|Mux0~1_combout\);

-- Location: LCCOMB_X2_Y2_N30
\u_uart_send|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|Mux0~2_combout\ = (\u_uart_send|Mux0~1_combout\ & (((\u_uart_send|tx_data\(6)) # (!\u_uart_send|tx_cnt\(1))))) # (!\u_uart_send|Mux0~1_combout\ & (\u_uart_send|tx_data\(5) & ((\u_uart_send|tx_cnt\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|tx_data\(5),
	datab => \u_uart_send|tx_data\(6),
	datac => \u_uart_send|Mux0~1_combout\,
	datad => \u_uart_send|tx_cnt\(1),
	combout => \u_uart_send|Mux0~2_combout\);

-- Location: LCCOMB_X2_Y2_N4
\u_uart_send|tx_data~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|tx_data~8_combout\ = (!\u_uart_send|uart_en_d1~q\ & (\u_phase_diff_detect|r_data\(1) & \u_uart_send|uart_en_d0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_uart_send|uart_en_d1~q\,
	datac => \u_phase_diff_detect|r_data\(1),
	datad => \u_uart_send|uart_en_d0~q\,
	combout => \u_uart_send|tx_data~8_combout\);

-- Location: FF_X2_Y2_N5
\u_uart_send|tx_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|tx_data~8_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	ena => \u_uart_send|tx_data[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|tx_data\(1));

-- Location: LCCOMB_X2_Y2_N8
\u_uart_send|tx_data~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|tx_data~6_combout\ = (!\u_uart_send|uart_en_d1~q\ & (\u_phase_diff_detect|r_data\(2) & \u_uart_send|uart_en_d0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_uart_send|uart_en_d1~q\,
	datac => \u_phase_diff_detect|r_data\(2),
	datad => \u_uart_send|uart_en_d0~q\,
	combout => \u_uart_send|tx_data~6_combout\);

-- Location: FF_X2_Y2_N9
\u_uart_send|tx_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|tx_data~6_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	ena => \u_uart_send|tx_data[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|tx_data\(2));

-- Location: LCCOMB_X2_Y2_N18
\u_uart_send|tx_data~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|tx_data~7_combout\ = (\u_phase_diff_detect|r_data\(0) & (!\u_uart_send|uart_en_d1~q\ & \u_uart_send|uart_en_d0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_phase_diff_detect|r_data\(0),
	datac => \u_uart_send|uart_en_d1~q\,
	datad => \u_uart_send|uart_en_d0~q\,
	combout => \u_uart_send|tx_data~7_combout\);

-- Location: FF_X2_Y2_N19
\u_uart_send|tx_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|tx_data~7_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	ena => \u_uart_send|tx_data[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|tx_data\(0));

-- Location: LCCOMB_X1_Y5_N2
\u_uart_send|Mux0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|Mux0~3_combout\ = (\u_uart_send|tx_cnt\(0) & ((\u_uart_send|tx_cnt\(1) & (\u_uart_send|tx_data\(2))) # (!\u_uart_send|tx_cnt\(1) & ((\u_uart_send|tx_data\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|tx_cnt\(1),
	datab => \u_uart_send|tx_data\(2),
	datac => \u_uart_send|tx_cnt\(0),
	datad => \u_uart_send|tx_data\(0),
	combout => \u_uart_send|Mux0~3_combout\);

-- Location: LCCOMB_X1_Y5_N28
\u_uart_send|Mux0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|Mux0~4_combout\ = (\u_uart_send|Mux0~3_combout\) # ((\u_uart_send|tx_data\(1) & (!\u_uart_send|tx_cnt\(0) & \u_uart_send|tx_cnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|tx_data\(1),
	datab => \u_uart_send|Mux0~3_combout\,
	datac => \u_uart_send|tx_cnt\(0),
	datad => \u_uart_send|tx_cnt\(1),
	combout => \u_uart_send|Mux0~4_combout\);

-- Location: LCCOMB_X2_Y2_N22
\u_uart_send|Mux0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|Mux0~5_combout\ = (\u_uart_send|tx_cnt\(3) & (((\u_uart_send|tx_cnt\(2))))) # (!\u_uart_send|tx_cnt\(3) & ((\u_uart_send|tx_cnt\(2) & (\u_uart_send|Mux0~2_combout\)) # (!\u_uart_send|tx_cnt\(2) & ((\u_uart_send|Mux0~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|Mux0~2_combout\,
	datab => \u_uart_send|Mux0~4_combout\,
	datac => \u_uart_send|tx_cnt\(3),
	datad => \u_uart_send|tx_cnt\(2),
	combout => \u_uart_send|Mux0~5_combout\);

-- Location: LCCOMB_X2_Y2_N16
\u_uart_send|tx_data~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|tx_data~0_combout\ = (\u_phase_diff_detect|r_data\(7) & (!\u_uart_send|uart_en_d1~q\ & \u_uart_send|uart_en_d0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_phase_diff_detect|r_data\(7),
	datac => \u_uart_send|uart_en_d1~q\,
	datad => \u_uart_send|uart_en_d0~q\,
	combout => \u_uart_send|tx_data~0_combout\);

-- Location: FF_X2_Y2_N17
\u_uart_send|tx_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|tx_data~0_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	ena => \u_uart_send|tx_data[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|tx_data\(7));

-- Location: LCCOMB_X2_Y2_N2
\u_uart_send|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|Mux0~0_combout\ = (\u_uart_send|tx_cnt\(1) & (!\u_uart_send|uart_txd~q\)) # (!\u_uart_send|tx_cnt\(1) & (((\u_uart_send|tx_data\(7)) # (\u_uart_send|tx_cnt\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|uart_txd~q\,
	datab => \u_uart_send|tx_data\(7),
	datac => \u_uart_send|tx_cnt\(0),
	datad => \u_uart_send|tx_cnt\(1),
	combout => \u_uart_send|Mux0~0_combout\);

-- Location: LCCOMB_X2_Y2_N0
\u_uart_send|Mux0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|Mux0~6_combout\ = (\u_uart_send|Mux0~5_combout\ & (((!\u_uart_send|uart_txd~q\) # (!\u_uart_send|tx_cnt\(3))))) # (!\u_uart_send|Mux0~5_combout\ & (\u_uart_send|Mux0~0_combout\ & (\u_uart_send|tx_cnt\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_uart_send|Mux0~5_combout\,
	datab => \u_uart_send|Mux0~0_combout\,
	datac => \u_uart_send|tx_cnt\(3),
	datad => \u_uart_send|uart_txd~q\,
	combout => \u_uart_send|Mux0~6_combout\);

-- Location: LCCOMB_X1_Y5_N4
\u_uart_send|uart_txd~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_uart_send|uart_txd~0_combout\ = (!\u_uart_send|Mux0~6_combout\ & \u_uart_send|tx_flag~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_uart_send|Mux0~6_combout\,
	datad => \u_uart_send|tx_flag~q\,
	combout => \u_uart_send|uart_txd~0_combout\);

-- Location: FF_X1_Y5_N5
\u_uart_send|uart_txd\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \u_uart_send|uart_txd~0_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_uart_send|uart_txd~q\);
END structure;


