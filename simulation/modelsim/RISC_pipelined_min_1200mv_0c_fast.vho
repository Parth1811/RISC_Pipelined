-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "11/03/2019 02:54:43"

-- 
-- Device: Altera EP4CE22F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	stage1 IS
    PORT (
	clk : IN std_logic;
	rst : IN std_logic;
	valid_in : IN std_logic;
	pc_control : IN std_logic_vector(1 DOWNTO 0);
	reg_b_val : IN std_logic_vector(15 DOWNTO 0);
	pc_plus_imm : IN std_logic_vector(15 DOWNTO 0);
	ir : OUT std_logic_vector(15 DOWNTO 0);
	pc_old : OUT std_logic_vector(15 DOWNTO 0);
	valid_out : OUT std_logic
	);
END stage1;

-- Design Ports Information
-- ir[0]	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[1]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[2]	=>  Location: PIN_T11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[3]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[4]	=>  Location: PIN_L8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[5]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[6]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[7]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[8]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[9]	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[10]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[11]	=>  Location: PIN_P8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[12]	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[13]	=>  Location: PIN_T5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[14]	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[15]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_old[0]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_old[1]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_old[2]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_old[3]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_old[4]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_old[5]	=>  Location: PIN_K2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_old[6]	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_old[7]	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_old[8]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_old[9]	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_old[10]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_old[11]	=>  Location: PIN_M10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_old[12]	=>  Location: PIN_N11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_old[13]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_old[14]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_old[15]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- valid_out	=>  Location: PIN_P9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_M2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- valid_in	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_plus_imm[0]	=>  Location: PIN_T9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_control[0]	=>  Location: PIN_K16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_b_val[0]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_control[1]	=>  Location: PIN_L16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_plus_imm[1]	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_b_val[1]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_plus_imm[2]	=>  Location: PIN_N14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_b_val[2]	=>  Location: PIN_P15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_plus_imm[3]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_b_val[3]	=>  Location: PIN_N12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_plus_imm[4]	=>  Location: PIN_B14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_b_val[4]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_plus_imm[5]	=>  Location: PIN_N15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_b_val[5]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_plus_imm[6]	=>  Location: PIN_J14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_b_val[6]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_plus_imm[7]	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_b_val[7]	=>  Location: PIN_L14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_plus_imm[8]	=>  Location: PIN_K15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_b_val[8]	=>  Location: PIN_L15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_plus_imm[9]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_b_val[9]	=>  Location: PIN_R14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_plus_imm[10]	=>  Location: PIN_P14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_b_val[10]	=>  Location: PIN_L13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_plus_imm[11]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_b_val[11]	=>  Location: PIN_R13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_plus_imm[12]	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_b_val[12]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_plus_imm[13]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_b_val[13]	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_plus_imm[14]	=>  Location: PIN_T14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_b_val[14]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_plus_imm[15]	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_b_val[15]	=>  Location: PIN_D16,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF stage1 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_valid_in : std_logic;
SIGNAL ww_pc_control : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_reg_b_val : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_pc_plus_imm : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_ir : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_pc_old : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_valid_out : std_logic;
SIGNAL \code_mem|Memory_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \code_mem|Memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \rst~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ir[0]~output_o\ : std_logic;
SIGNAL \ir[1]~output_o\ : std_logic;
SIGNAL \ir[2]~output_o\ : std_logic;
SIGNAL \ir[3]~output_o\ : std_logic;
SIGNAL \ir[4]~output_o\ : std_logic;
SIGNAL \ir[5]~output_o\ : std_logic;
SIGNAL \ir[6]~output_o\ : std_logic;
SIGNAL \ir[7]~output_o\ : std_logic;
SIGNAL \ir[8]~output_o\ : std_logic;
SIGNAL \ir[9]~output_o\ : std_logic;
SIGNAL \ir[10]~output_o\ : std_logic;
SIGNAL \ir[11]~output_o\ : std_logic;
SIGNAL \ir[12]~output_o\ : std_logic;
SIGNAL \ir[13]~output_o\ : std_logic;
SIGNAL \ir[14]~output_o\ : std_logic;
SIGNAL \ir[15]~output_o\ : std_logic;
SIGNAL \pc_old[0]~output_o\ : std_logic;
SIGNAL \pc_old[1]~output_o\ : std_logic;
SIGNAL \pc_old[2]~output_o\ : std_logic;
SIGNAL \pc_old[3]~output_o\ : std_logic;
SIGNAL \pc_old[4]~output_o\ : std_logic;
SIGNAL \pc_old[5]~output_o\ : std_logic;
SIGNAL \pc_old[6]~output_o\ : std_logic;
SIGNAL \pc_old[7]~output_o\ : std_logic;
SIGNAL \pc_old[8]~output_o\ : std_logic;
SIGNAL \pc_old[9]~output_o\ : std_logic;
SIGNAL \pc_old[10]~output_o\ : std_logic;
SIGNAL \pc_old[11]~output_o\ : std_logic;
SIGNAL \pc_old[12]~output_o\ : std_logic;
SIGNAL \pc_old[13]~output_o\ : std_logic;
SIGNAL \pc_old[14]~output_o\ : std_logic;
SIGNAL \pc_old[15]~output_o\ : std_logic;
SIGNAL \valid_out~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \pc_control[0]~input_o\ : std_logic;
SIGNAL \pc_plus_imm[0]~input_o\ : std_logic;
SIGNAL \Mux15~0_combout\ : std_logic;
SIGNAL \reg_b_val[0]~input_o\ : std_logic;
SIGNAL \rst~inputclkctrl_outclk\ : std_logic;
SIGNAL \pc_control[1]~input_o\ : std_logic;
SIGNAL \pc_plus_imm[1]~input_o\ : std_logic;
SIGNAL \Mux14~0_combout\ : std_logic;
SIGNAL \reg_b_val[1]~input_o\ : std_logic;
SIGNAL \pc_plus_imm[2]~input_o\ : std_logic;
SIGNAL \Mux13~0_combout\ : std_logic;
SIGNAL \Mux13~1_combout\ : std_logic;
SIGNAL \reg_b_val[2]~input_o\ : std_logic;
SIGNAL \pc_plus_imm[3]~input_o\ : std_logic;
SIGNAL \Mux12~0_combout\ : std_logic;
SIGNAL \reg_b_val[3]~input_o\ : std_logic;
SIGNAL \pc_alu|add|Carry~0_combout\ : std_logic;
SIGNAL \pc_plus_imm[4]~input_o\ : std_logic;
SIGNAL \Mux11~0_combout\ : std_logic;
SIGNAL \reg_b_val[4]~input_o\ : std_logic;
SIGNAL \pc_plus_imm[5]~input_o\ : std_logic;
SIGNAL \pc_alu|add|Carry~1_combout\ : std_logic;
SIGNAL \Mux10~0_combout\ : std_logic;
SIGNAL \reg_b_val[5]~input_o\ : std_logic;
SIGNAL \pc_plus_imm[6]~input_o\ : std_logic;
SIGNAL \Mux9~0_combout\ : std_logic;
SIGNAL \reg_b_val[6]~input_o\ : std_logic;
SIGNAL \code_mem|Memory_rtl_0|auto_generated|ram_block1a0~portadataout\ : std_logic;
SIGNAL \code_mem|Memory_rtl_0|auto_generated|ram_block1a1\ : std_logic;
SIGNAL \code_mem|Memory_rtl_0|auto_generated|ram_block1a2\ : std_logic;
SIGNAL \code_mem|Memory_rtl_0|auto_generated|ram_block1a3\ : std_logic;
SIGNAL \code_mem|Memory_rtl_0|auto_generated|ram_block1a4\ : std_logic;
SIGNAL \code_mem|Memory_rtl_0|auto_generated|ram_block1a5\ : std_logic;
SIGNAL \code_mem|Memory_rtl_0|auto_generated|ram_block1a6\ : std_logic;
SIGNAL \code_mem|Memory_rtl_0|auto_generated|ram_block1a7\ : std_logic;
SIGNAL \code_mem|Memory_rtl_0|auto_generated|ram_block1a8\ : std_logic;
SIGNAL \code_mem|Memory_rtl_0|auto_generated|ram_block1a9\ : std_logic;
SIGNAL \code_mem|Memory_rtl_0|auto_generated|ram_block1a10\ : std_logic;
SIGNAL \code_mem|Memory_rtl_0|auto_generated|ram_block1a11\ : std_logic;
SIGNAL \code_mem|Memory_rtl_0|auto_generated|ram_block1a12\ : std_logic;
SIGNAL \code_mem|Memory_rtl_0|auto_generated|ram_block1a13\ : std_logic;
SIGNAL \code_mem|Memory_rtl_0|auto_generated|ram_block1a14\ : std_logic;
SIGNAL \code_mem|Memory_rtl_0|auto_generated|ram_block1a15\ : std_logic;
SIGNAL \pc_old[0]~reg0feeder_combout\ : std_logic;
SIGNAL \pc_old[0]~reg0_q\ : std_logic;
SIGNAL \pc_old[1]~reg0feeder_combout\ : std_logic;
SIGNAL \pc_old[1]~reg0_q\ : std_logic;
SIGNAL \pc_old[2]~reg0feeder_combout\ : std_logic;
SIGNAL \pc_old[2]~reg0_q\ : std_logic;
SIGNAL \pc_old[3]~reg0feeder_combout\ : std_logic;
SIGNAL \pc_old[3]~reg0_q\ : std_logic;
SIGNAL \pc_old[4]~reg0feeder_combout\ : std_logic;
SIGNAL \pc_old[4]~reg0_q\ : std_logic;
SIGNAL \pc_old[5]~reg0feeder_combout\ : std_logic;
SIGNAL \pc_old[5]~reg0_q\ : std_logic;
SIGNAL \pc_old[6]~reg0feeder_combout\ : std_logic;
SIGNAL \pc_old[6]~reg0_q\ : std_logic;
SIGNAL \pc_alu|add|Carry~2_combout\ : std_logic;
SIGNAL \pc_plus_imm[7]~input_o\ : std_logic;
SIGNAL \Mux8~0_combout\ : std_logic;
SIGNAL \reg_b_val[7]~input_o\ : std_logic;
SIGNAL \pc_old[7]~reg0feeder_combout\ : std_logic;
SIGNAL \pc_old[7]~reg0_q\ : std_logic;
SIGNAL \pc_plus_imm[8]~input_o\ : std_logic;
SIGNAL \pc_alu|add|Carry~3_combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \reg_b_val[8]~input_o\ : std_logic;
SIGNAL \pc_old[8]~reg0feeder_combout\ : std_logic;
SIGNAL \pc_old[8]~reg0_q\ : std_logic;
SIGNAL \pc_plus_imm[9]~input_o\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \reg_b_val[9]~input_o\ : std_logic;
SIGNAL \pc_old[9]~reg0feeder_combout\ : std_logic;
SIGNAL \pc_old[9]~reg0_q\ : std_logic;
SIGNAL \pc_plus_imm[10]~input_o\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \reg_b_val[10]~input_o\ : std_logic;
SIGNAL \pc_old[10]~reg0feeder_combout\ : std_logic;
SIGNAL \pc_old[10]~reg0_q\ : std_logic;
SIGNAL \pc_plus_imm[11]~input_o\ : std_logic;
SIGNAL \pc_alu|add|Carry~4_combout\ : std_logic;
SIGNAL \pc_alu|add|Carry~5_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \reg_b_val[11]~input_o\ : std_logic;
SIGNAL \pc_old[11]~reg0feeder_combout\ : std_logic;
SIGNAL \pc_old[11]~reg0_q\ : std_logic;
SIGNAL \pc_plus_imm[12]~input_o\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Mux3~1_combout\ : std_logic;
SIGNAL \reg_b_val[12]~input_o\ : std_logic;
SIGNAL \pc_old[12]~reg0feeder_combout\ : std_logic;
SIGNAL \pc_old[12]~reg0_q\ : std_logic;
SIGNAL \pc_plus_imm[13]~input_o\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \reg_b_val[13]~input_o\ : std_logic;
SIGNAL \pc_old[13]~reg0feeder_combout\ : std_logic;
SIGNAL \pc_old[13]~reg0_q\ : std_logic;
SIGNAL \pc_plus_imm[14]~input_o\ : std_logic;
SIGNAL \pc_alu|add|Carry~6_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \reg_b_val[14]~input_o\ : std_logic;
SIGNAL \pc_old[14]~reg0feeder_combout\ : std_logic;
SIGNAL \pc_old[14]~reg0_q\ : std_logic;
SIGNAL \pc_plus_imm[15]~input_o\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Mux0~1_combout\ : std_logic;
SIGNAL \reg_b_val[15]~input_o\ : std_logic;
SIGNAL \pc_old[15]~reg0feeder_combout\ : std_logic;
SIGNAL \pc_old[15]~reg0_q\ : std_logic;
SIGNAL \valid_in~input_o\ : std_logic;
SIGNAL \valid_out_temp~feeder_combout\ : std_logic;
SIGNAL \valid_out_temp~q\ : std_logic;
SIGNAL \pc_alu|add|sum\ : std_logic_vector(15 DOWNTO 0);
SIGNAL pc : std_logic_vector(15 DOWNTO 0);
SIGNAL \ALT_INV_rst~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_rst~input_o\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_rst <= rst;
ww_valid_in <= valid_in;
ww_pc_control <= pc_control;
ww_reg_b_val <= reg_b_val;
ww_pc_plus_imm <= pc_plus_imm;
ir <= ww_ir;
pc_old <= ww_pc_old;
valid_out <= ww_valid_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\code_mem|Memory_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (pc(6) & pc(5) & pc(4) & pc(3) & pc(2) & pc(1) & pc(0));

\code_mem|Memory_rtl_0|auto_generated|ram_block1a0~portadataout\ <= \code_mem|Memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\code_mem|Memory_rtl_0|auto_generated|ram_block1a1\ <= \code_mem|Memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);
\code_mem|Memory_rtl_0|auto_generated|ram_block1a2\ <= \code_mem|Memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(2);
\code_mem|Memory_rtl_0|auto_generated|ram_block1a3\ <= \code_mem|Memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(3);
\code_mem|Memory_rtl_0|auto_generated|ram_block1a4\ <= \code_mem|Memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(4);
\code_mem|Memory_rtl_0|auto_generated|ram_block1a5\ <= \code_mem|Memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(5);
\code_mem|Memory_rtl_0|auto_generated|ram_block1a6\ <= \code_mem|Memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(6);
\code_mem|Memory_rtl_0|auto_generated|ram_block1a7\ <= \code_mem|Memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(7);
\code_mem|Memory_rtl_0|auto_generated|ram_block1a8\ <= \code_mem|Memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(8);
\code_mem|Memory_rtl_0|auto_generated|ram_block1a9\ <= \code_mem|Memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(9);
\code_mem|Memory_rtl_0|auto_generated|ram_block1a10\ <= \code_mem|Memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(10);
\code_mem|Memory_rtl_0|auto_generated|ram_block1a11\ <= \code_mem|Memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(11);
\code_mem|Memory_rtl_0|auto_generated|ram_block1a12\ <= \code_mem|Memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(12);
\code_mem|Memory_rtl_0|auto_generated|ram_block1a13\ <= \code_mem|Memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(13);
\code_mem|Memory_rtl_0|auto_generated|ram_block1a14\ <= \code_mem|Memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(14);
\code_mem|Memory_rtl_0|auto_generated|ram_block1a15\ <= \code_mem|Memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(15);

\rst~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rst~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_rst~inputclkctrl_outclk\ <= NOT \rst~inputclkctrl_outclk\;
\ALT_INV_rst~input_o\ <= NOT \rst~input_o\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X34_Y0_N16
\ir[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \code_mem|Memory_rtl_0|auto_generated|ram_block1a0~portadataout\,
	devoe => ww_devoe,
	o => \ir[0]~output_o\);

-- Location: IOOBUF_X16_Y0_N23
\ir[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \code_mem|Memory_rtl_0|auto_generated|ram_block1a1\,
	devoe => ww_devoe,
	o => \ir[1]~output_o\);

-- Location: IOOBUF_X36_Y0_N23
\ir[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \code_mem|Memory_rtl_0|auto_generated|ram_block1a2\,
	devoe => ww_devoe,
	o => \ir[2]~output_o\);

-- Location: IOOBUF_X34_Y0_N2
\ir[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \code_mem|Memory_rtl_0|auto_generated|ram_block1a3\,
	devoe => ww_devoe,
	o => \ir[3]~output_o\);

-- Location: IOOBUF_X18_Y0_N9
\ir[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \code_mem|Memory_rtl_0|auto_generated|ram_block1a4\,
	devoe => ww_devoe,
	o => \ir[4]~output_o\);

-- Location: IOOBUF_X14_Y0_N23
\ir[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \code_mem|Memory_rtl_0|auto_generated|ram_block1a5\,
	devoe => ww_devoe,
	o => \ir[5]~output_o\);

-- Location: IOOBUF_X18_Y0_N23
\ir[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \code_mem|Memory_rtl_0|auto_generated|ram_block1a6\,
	devoe => ww_devoe,
	o => \ir[6]~output_o\);

-- Location: IOOBUF_X36_Y0_N9
\ir[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \code_mem|Memory_rtl_0|auto_generated|ram_block1a7\,
	devoe => ww_devoe,
	o => \ir[7]~output_o\);

-- Location: IOOBUF_X20_Y0_N2
\ir[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \code_mem|Memory_rtl_0|auto_generated|ram_block1a8\,
	devoe => ww_devoe,
	o => \ir[8]~output_o\);

-- Location: IOOBUF_X20_Y0_N9
\ir[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \code_mem|Memory_rtl_0|auto_generated|ram_block1a9\,
	devoe => ww_devoe,
	o => \ir[9]~output_o\);

-- Location: IOOBUF_X34_Y0_N23
\ir[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \code_mem|Memory_rtl_0|auto_generated|ram_block1a10\,
	devoe => ww_devoe,
	o => \ir[10]~output_o\);

-- Location: IOOBUF_X25_Y0_N16
\ir[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \code_mem|Memory_rtl_0|auto_generated|ram_block1a11\,
	devoe => ww_devoe,
	o => \ir[11]~output_o\);

-- Location: IOOBUF_X14_Y0_N9
\ir[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \code_mem|Memory_rtl_0|auto_generated|ram_block1a12\,
	devoe => ww_devoe,
	o => \ir[12]~output_o\);

-- Location: IOOBUF_X14_Y0_N16
\ir[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \code_mem|Memory_rtl_0|auto_generated|ram_block1a13\,
	devoe => ww_devoe,
	o => \ir[13]~output_o\);

-- Location: IOOBUF_X29_Y0_N2
\ir[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \code_mem|Memory_rtl_0|auto_generated|ram_block1a14\,
	devoe => ww_devoe,
	o => \ir[14]~output_o\);

-- Location: IOOBUF_X36_Y0_N16
\ir[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \code_mem|Memory_rtl_0|auto_generated|ram_block1a15\,
	devoe => ww_devoe,
	o => \ir[15]~output_o\);

-- Location: IOOBUF_X43_Y34_N16
\pc_old[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_old[0]~reg0_q\,
	devoe => ww_devoe,
	o => \pc_old[0]~output_o\);

-- Location: IOOBUF_X53_Y30_N9
\pc_old[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_old[1]~reg0_q\,
	devoe => ww_devoe,
	o => \pc_old[1]~output_o\);

-- Location: IOOBUF_X40_Y0_N16
\pc_old[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_old[2]~reg0_q\,
	devoe => ww_devoe,
	o => \pc_old[2]~output_o\);

-- Location: IOOBUF_X38_Y34_N16
\pc_old[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_old[3]~reg0_q\,
	devoe => ww_devoe,
	o => \pc_old[3]~output_o\);

-- Location: IOOBUF_X45_Y34_N16
\pc_old[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_old[4]~reg0_q\,
	devoe => ww_devoe,
	o => \pc_old[4]~output_o\);

-- Location: IOOBUF_X0_Y12_N2
\pc_old[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_old[5]~reg0_q\,
	devoe => ww_devoe,
	o => \pc_old[5]~output_o\);

-- Location: IOOBUF_X38_Y0_N2
\pc_old[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_old[6]~reg0_q\,
	devoe => ww_devoe,
	o => \pc_old[6]~output_o\);

-- Location: IOOBUF_X53_Y7_N9
\pc_old[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_old[7]~reg0_q\,
	devoe => ww_devoe,
	o => \pc_old[7]~output_o\);

-- Location: IOOBUF_X53_Y30_N2
\pc_old[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_old[8]~reg0_q\,
	devoe => ww_devoe,
	o => \pc_old[8]~output_o\);

-- Location: IOOBUF_X53_Y9_N23
\pc_old[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_old[9]~reg0_q\,
	devoe => ww_devoe,
	o => \pc_old[9]~output_o\);

-- Location: IOOBUF_X53_Y26_N23
\pc_old[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_old[10]~reg0_q\,
	devoe => ww_devoe,
	o => \pc_old[10]~output_o\);

-- Location: IOOBUF_X43_Y0_N23
\pc_old[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_old[11]~reg0_q\,
	devoe => ww_devoe,
	o => \pc_old[11]~output_o\);

-- Location: IOOBUF_X43_Y0_N16
\pc_old[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_old[12]~reg0_q\,
	devoe => ww_devoe,
	o => \pc_old[12]~output_o\);

-- Location: IOOBUF_X40_Y34_N9
\pc_old[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_old[13]~reg0_q\,
	devoe => ww_devoe,
	o => \pc_old[13]~output_o\);

-- Location: IOOBUF_X43_Y34_N23
\pc_old[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_old[14]~reg0_q\,
	devoe => ww_devoe,
	o => \pc_old[14]~output_o\);

-- Location: IOOBUF_X38_Y34_N2
\pc_old[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_old[15]~reg0_q\,
	devoe => ww_devoe,
	o => \pc_old[15]~output_o\);

-- Location: IOOBUF_X38_Y0_N9
\valid_out~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \valid_out_temp~q\,
	devoe => ww_devoe,
	o => \valid_out~output_o\);

-- Location: IOIBUF_X0_Y16_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G2
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y16_N15
\rst~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: IOIBUF_X53_Y12_N1
\pc_control[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_control(0),
	o => \pc_control[0]~input_o\);

-- Location: IOIBUF_X27_Y0_N1
\pc_plus_imm[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_plus_imm(0),
	o => \pc_plus_imm[0]~input_o\);

-- Location: LCCOMB_X44_Y12_N4
\Mux15~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux15~0_combout\ = (\pc_control[0]~input_o\ & ((\pc_plus_imm[0]~input_o\))) # (!\pc_control[0]~input_o\ & (!pc(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pc_control[0]~input_o\,
	datac => pc(0),
	datad => \pc_plus_imm[0]~input_o\,
	combout => \Mux15~0_combout\);

-- Location: IOIBUF_X53_Y20_N15
\reg_b_val[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg_b_val(0),
	o => \reg_b_val[0]~input_o\);

-- Location: CLKCTRL_G4
\rst~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rst~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rst~inputclkctrl_outclk\);

-- Location: IOIBUF_X53_Y11_N8
\pc_control[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_control(1),
	o => \pc_control[1]~input_o\);

-- Location: FF_X44_Y12_N5
\pc[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux15~0_combout\,
	asdata => \reg_b_val[0]~input_o\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \pc_control[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc(0));

-- Location: IOIBUF_X53_Y22_N1
\pc_plus_imm[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_plus_imm(1),
	o => \pc_plus_imm[1]~input_o\);

-- Location: LCCOMB_X44_Y12_N10
\Mux14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux14~0_combout\ = (\pc_control[0]~input_o\ & (\pc_plus_imm[1]~input_o\)) # (!\pc_control[0]~input_o\ & ((pc(1) $ (pc(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pc_plus_imm[1]~input_o\,
	datab => \pc_control[0]~input_o\,
	datac => pc(1),
	datad => pc(0),
	combout => \Mux14~0_combout\);

-- Location: IOIBUF_X53_Y22_N8
\reg_b_val[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg_b_val(1),
	o => \reg_b_val[1]~input_o\);

-- Location: FF_X44_Y12_N11
\pc[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux14~0_combout\,
	asdata => \reg_b_val[1]~input_o\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \pc_control[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc(1));

-- Location: IOIBUF_X53_Y6_N22
\pc_plus_imm[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_plus_imm(2),
	o => \pc_plus_imm[2]~input_o\);

-- Location: LCCOMB_X43_Y12_N24
\Mux13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux13~0_combout\ = (!\pc_control[0]~input_o\ & (pc(2) $ (((pc(0) & pc(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pc(0),
	datab => \pc_control[0]~input_o\,
	datac => pc(1),
	datad => pc(2),
	combout => \Mux13~0_combout\);

-- Location: LCCOMB_X44_Y12_N28
\Mux13~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux13~1_combout\ = (\Mux13~0_combout\) # ((\pc_plus_imm[2]~input_o\ & \pc_control[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pc_plus_imm[2]~input_o\,
	datab => \pc_control[0]~input_o\,
	datad => \Mux13~0_combout\,
	combout => \Mux13~1_combout\);

-- Location: IOIBUF_X53_Y6_N15
\reg_b_val[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg_b_val(2),
	o => \reg_b_val[2]~input_o\);

-- Location: FF_X44_Y12_N29
\pc[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux13~1_combout\,
	asdata => \reg_b_val[2]~input_o\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \pc_control[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc(2));

-- Location: IOIBUF_X53_Y20_N22
\pc_plus_imm[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_plus_imm(3),
	o => \pc_plus_imm[3]~input_o\);

-- Location: LCCOMB_X43_Y12_N14
\pc_alu|add|sum[3]\ : cycloneive_lcell_comb
-- Equation(s):
-- \pc_alu|add|sum\(3) = pc(3) $ (((pc(0) & (pc(2) & pc(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pc(0),
	datab => pc(2),
	datac => pc(1),
	datad => pc(3),
	combout => \pc_alu|add|sum\(3));

-- Location: LCCOMB_X44_Y12_N26
\Mux12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux12~0_combout\ = (\pc_control[0]~input_o\ & (\pc_plus_imm[3]~input_o\)) # (!\pc_control[0]~input_o\ & ((\pc_alu|add|sum\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pc_plus_imm[3]~input_o\,
	datab => \pc_control[0]~input_o\,
	datad => \pc_alu|add|sum\(3),
	combout => \Mux12~0_combout\);

-- Location: IOIBUF_X47_Y0_N22
\reg_b_val[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg_b_val(3),
	o => \reg_b_val[3]~input_o\);

-- Location: FF_X44_Y12_N27
\pc[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux12~0_combout\,
	asdata => \reg_b_val[3]~input_o\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \pc_control[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc(3));

-- Location: LCCOMB_X44_Y12_N18
\pc_alu|add|Carry~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pc_alu|add|Carry~0_combout\ = (pc(1) & (pc(0) & (pc(3) & pc(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pc(1),
	datab => pc(0),
	datac => pc(3),
	datad => pc(2),
	combout => \pc_alu|add|Carry~0_combout\);

-- Location: IOIBUF_X45_Y34_N1
\pc_plus_imm[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_plus_imm(4),
	o => \pc_plus_imm[4]~input_o\);

-- Location: LCCOMB_X44_Y12_N8
\Mux11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux11~0_combout\ = (\pc_control[0]~input_o\ & (((\pc_plus_imm[4]~input_o\)))) # (!\pc_control[0]~input_o\ & (\pc_alu|add|Carry~0_combout\ $ ((pc(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pc_alu|add|Carry~0_combout\,
	datab => \pc_control[0]~input_o\,
	datac => pc(4),
	datad => \pc_plus_imm[4]~input_o\,
	combout => \Mux11~0_combout\);

-- Location: IOIBUF_X47_Y34_N22
\reg_b_val[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg_b_val(4),
	o => \reg_b_val[4]~input_o\);

-- Location: FF_X44_Y12_N9
\pc[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux11~0_combout\,
	asdata => \reg_b_val[4]~input_o\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \pc_control[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc(4));

-- Location: IOIBUF_X53_Y9_N15
\pc_plus_imm[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_plus_imm(5),
	o => \pc_plus_imm[5]~input_o\);

-- Location: LCCOMB_X44_Y12_N12
\pc_alu|add|Carry~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \pc_alu|add|Carry~1_combout\ = (pc(4) & \pc_alu|add|Carry~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => pc(4),
	datad => \pc_alu|add|Carry~0_combout\,
	combout => \pc_alu|add|Carry~1_combout\);

-- Location: LCCOMB_X45_Y12_N4
\Mux10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux10~0_combout\ = (\pc_control[0]~input_o\ & (\pc_plus_imm[5]~input_o\)) # (!\pc_control[0]~input_o\ & ((pc(5) $ (\pc_alu|add|Carry~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pc_control[0]~input_o\,
	datab => \pc_plus_imm[5]~input_o\,
	datac => pc(5),
	datad => \pc_alu|add|Carry~1_combout\,
	combout => \Mux10~0_combout\);

-- Location: IOIBUF_X53_Y16_N8
\reg_b_val[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg_b_val(5),
	o => \reg_b_val[5]~input_o\);

-- Location: FF_X45_Y12_N5
\pc[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux10~0_combout\,
	asdata => \reg_b_val[5]~input_o\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \pc_control[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc(5));

-- Location: IOIBUF_X53_Y15_N8
\pc_plus_imm[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_plus_imm(6),
	o => \pc_plus_imm[6]~input_o\);

-- Location: LCCOMB_X45_Y12_N24
\pc_alu|add|sum[6]\ : cycloneive_lcell_comb
-- Equation(s):
-- \pc_alu|add|sum\(6) = pc(6) $ (((pc(5) & (pc(4) & \pc_alu|add|Carry~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pc(5),
	datab => pc(4),
	datac => pc(6),
	datad => \pc_alu|add|Carry~0_combout\,
	combout => \pc_alu|add|sum\(6));

-- Location: LCCOMB_X45_Y12_N2
\Mux9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux9~0_combout\ = (\pc_control[0]~input_o\ & (\pc_plus_imm[6]~input_o\)) # (!\pc_control[0]~input_o\ & ((\pc_alu|add|sum\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pc_control[0]~input_o\,
	datab => \pc_plus_imm[6]~input_o\,
	datad => \pc_alu|add|sum\(6),
	combout => \Mux9~0_combout\);

-- Location: IOIBUF_X53_Y21_N22
\reg_b_val[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg_b_val(6),
	o => \reg_b_val[6]~input_o\);

-- Location: FF_X45_Y12_N3
\pc[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux9~0_combout\,
	asdata => \reg_b_val[6]~input_o\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \pc_control[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc(6));

-- Location: M9K_X33_Y4_N0
\code_mem|Memory_rtl_0|auto_generated|ram_block1a0\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"0000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016430000000000D0E02D08025480298",
	clk0_core_clock_enable => "ena0",
	clk0_input_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/RISC_pipelined.ram0_memory1_5f521577.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "memory1:code_mem|altsyncram:Memory_rtl_0|altsyncram_2c81:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 7,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 18,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 127,
	port_a_logical_ram_depth => 101,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 7,
	port_b_data_width => 18,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	ena0 => \ALT_INV_rst~input_o\,
	portaaddr => \code_mem|Memory_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \code_mem|Memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: LCCOMB_X43_Y12_N10
\pc_old[0]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pc_old[0]~reg0feeder_combout\ = pc(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => pc(0),
	combout => \pc_old[0]~reg0feeder_combout\);

-- Location: FF_X43_Y12_N11
\pc_old[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_old[0]~reg0feeder_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc_old[0]~reg0_q\);

-- Location: LCCOMB_X43_Y12_N16
\pc_old[1]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pc_old[1]~reg0feeder_combout\ = pc(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => pc(1),
	combout => \pc_old[1]~reg0feeder_combout\);

-- Location: FF_X43_Y12_N17
\pc_old[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_old[1]~reg0feeder_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc_old[1]~reg0_q\);

-- Location: LCCOMB_X43_Y12_N2
\pc_old[2]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pc_old[2]~reg0feeder_combout\ = pc(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => pc(2),
	combout => \pc_old[2]~reg0feeder_combout\);

-- Location: FF_X43_Y12_N3
\pc_old[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_old[2]~reg0feeder_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc_old[2]~reg0_q\);

-- Location: LCCOMB_X43_Y12_N4
\pc_old[3]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pc_old[3]~reg0feeder_combout\ = pc(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => pc(3),
	combout => \pc_old[3]~reg0feeder_combout\);

-- Location: FF_X43_Y12_N5
\pc_old[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_old[3]~reg0feeder_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc_old[3]~reg0_q\);

-- Location: LCCOMB_X45_Y12_N20
\pc_old[4]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pc_old[4]~reg0feeder_combout\ = pc(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => pc(4),
	combout => \pc_old[4]~reg0feeder_combout\);

-- Location: FF_X45_Y12_N21
\pc_old[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_old[4]~reg0feeder_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc_old[4]~reg0_q\);

-- Location: LCCOMB_X43_Y12_N22
\pc_old[5]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pc_old[5]~reg0feeder_combout\ = pc(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => pc(5),
	combout => \pc_old[5]~reg0feeder_combout\);

-- Location: FF_X43_Y12_N23
\pc_old[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_old[5]~reg0feeder_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc_old[5]~reg0_q\);

-- Location: LCCOMB_X40_Y12_N20
\pc_old[6]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pc_old[6]~reg0feeder_combout\ = pc(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => pc(6),
	combout => \pc_old[6]~reg0feeder_combout\);

-- Location: FF_X40_Y12_N21
\pc_old[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_old[6]~reg0feeder_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc_old[6]~reg0_q\);

-- Location: LCCOMB_X45_Y12_N22
\pc_alu|add|Carry~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \pc_alu|add|Carry~2_combout\ = (pc(5) & (pc(6) & (pc(4) & \pc_alu|add|Carry~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pc(5),
	datab => pc(6),
	datac => pc(4),
	datad => \pc_alu|add|Carry~0_combout\,
	combout => \pc_alu|add|Carry~2_combout\);

-- Location: IOIBUF_X53_Y8_N22
\pc_plus_imm[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_plus_imm(7),
	o => \pc_plus_imm[7]~input_o\);

-- Location: LCCOMB_X45_Y12_N16
\Mux8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux8~0_combout\ = (\pc_control[0]~input_o\ & (((\pc_plus_imm[7]~input_o\)))) # (!\pc_control[0]~input_o\ & (\pc_alu|add|Carry~2_combout\ $ (((pc(7))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pc_alu|add|Carry~2_combout\,
	datab => \pc_plus_imm[7]~input_o\,
	datac => pc(7),
	datad => \pc_control[0]~input_o\,
	combout => \Mux8~0_combout\);

-- Location: IOIBUF_X53_Y9_N8
\reg_b_val[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg_b_val(7),
	o => \reg_b_val[7]~input_o\);

-- Location: FF_X45_Y12_N17
\pc[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux8~0_combout\,
	asdata => \reg_b_val[7]~input_o\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \pc_control[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc(7));

-- Location: LCCOMB_X45_Y12_N30
\pc_old[7]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pc_old[7]~reg0feeder_combout\ = pc(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => pc(7),
	combout => \pc_old[7]~reg0feeder_combout\);

-- Location: FF_X45_Y12_N31
\pc_old[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_old[7]~reg0feeder_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc_old[7]~reg0_q\);

-- Location: IOIBUF_X53_Y13_N8
\pc_plus_imm[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_plus_imm(8),
	o => \pc_plus_imm[8]~input_o\);

-- Location: LCCOMB_X45_Y12_N28
\pc_alu|add|Carry~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \pc_alu|add|Carry~3_combout\ = (pc(5) & (pc(7) & (pc(6) & \pc_alu|add|Carry~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pc(5),
	datab => pc(7),
	datac => pc(6),
	datad => \pc_alu|add|Carry~1_combout\,
	combout => \pc_alu|add|Carry~3_combout\);

-- Location: LCCOMB_X45_Y12_N6
\Mux7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (\pc_control[0]~input_o\ & (\pc_plus_imm[8]~input_o\)) # (!\pc_control[0]~input_o\ & ((pc(8) $ (\pc_alu|add|Carry~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pc_control[0]~input_o\,
	datab => \pc_plus_imm[8]~input_o\,
	datac => pc(8),
	datad => \pc_alu|add|Carry~3_combout\,
	combout => \Mux7~0_combout\);

-- Location: IOIBUF_X53_Y11_N1
\reg_b_val[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg_b_val(8),
	o => \reg_b_val[8]~input_o\);

-- Location: FF_X45_Y12_N7
\pc[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux7~0_combout\,
	asdata => \reg_b_val[8]~input_o\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \pc_control[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc(8));

-- Location: LCCOMB_X43_Y12_N28
\pc_old[8]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pc_old[8]~reg0feeder_combout\ = pc(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => pc(8),
	combout => \pc_old[8]~reg0feeder_combout\);

-- Location: FF_X43_Y12_N29
\pc_old[8]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_old[8]~reg0feeder_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc_old[8]~reg0_q\);

-- Location: IOIBUF_X53_Y14_N8
\pc_plus_imm[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_plus_imm(9),
	o => \pc_plus_imm[9]~input_o\);

-- Location: LCCOMB_X45_Y12_N18
\pc_alu|add|sum[9]\ : cycloneive_lcell_comb
-- Equation(s):
-- \pc_alu|add|sum\(9) = pc(9) $ (((pc(8) & (\pc_alu|add|Carry~2_combout\ & pc(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pc(8),
	datab => pc(9),
	datac => \pc_alu|add|Carry~2_combout\,
	datad => pc(7),
	combout => \pc_alu|add|sum\(9));

-- Location: LCCOMB_X45_Y12_N0
\Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (\pc_control[0]~input_o\ & (\pc_plus_imm[9]~input_o\)) # (!\pc_control[0]~input_o\ & ((\pc_alu|add|sum\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pc_control[0]~input_o\,
	datab => \pc_plus_imm[9]~input_o\,
	datad => \pc_alu|add|sum\(9),
	combout => \Mux6~0_combout\);

-- Location: IOIBUF_X49_Y0_N1
\reg_b_val[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg_b_val(9),
	o => \reg_b_val[9]~input_o\);

-- Location: FF_X45_Y12_N1
\pc[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux6~0_combout\,
	asdata => \reg_b_val[9]~input_o\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \pc_control[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc(9));

-- Location: LCCOMB_X45_Y12_N8
\pc_old[9]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pc_old[9]~reg0feeder_combout\ = pc(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => pc(9),
	combout => \pc_old[9]~reg0feeder_combout\);

-- Location: FF_X45_Y12_N9
\pc_old[9]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_old[9]~reg0feeder_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc_old[9]~reg0_q\);

-- Location: IOIBUF_X49_Y0_N8
\pc_plus_imm[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_plus_imm(10),
	o => \pc_plus_imm[10]~input_o\);

-- Location: LCCOMB_X45_Y12_N12
\pc_alu|add|sum[10]\ : cycloneive_lcell_comb
-- Equation(s):
-- \pc_alu|add|sum\(10) = pc(10) $ (((pc(8) & (pc(9) & \pc_alu|add|Carry~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pc(8),
	datab => pc(9),
	datac => pc(10),
	datad => \pc_alu|add|Carry~3_combout\,
	combout => \pc_alu|add|sum\(10));

-- Location: LCCOMB_X45_Y12_N26
\Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (\pc_control[0]~input_o\ & (\pc_plus_imm[10]~input_o\)) # (!\pc_control[0]~input_o\ & ((\pc_alu|add|sum\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pc_control[0]~input_o\,
	datab => \pc_plus_imm[10]~input_o\,
	datad => \pc_alu|add|sum\(10),
	combout => \Mux5~0_combout\);

-- Location: IOIBUF_X53_Y10_N15
\reg_b_val[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg_b_val(10),
	o => \reg_b_val[10]~input_o\);

-- Location: FF_X45_Y12_N27
\pc[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux5~0_combout\,
	asdata => \reg_b_val[10]~input_o\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \pc_control[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc(10));

-- Location: LCCOMB_X45_Y12_N10
\pc_old[10]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pc_old[10]~reg0feeder_combout\ = pc(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => pc(10),
	combout => \pc_old[10]~reg0feeder_combout\);

-- Location: FF_X45_Y12_N11
\pc_old[10]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_old[10]~reg0feeder_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc_old[10]~reg0_q\);

-- Location: IOIBUF_X40_Y34_N1
\pc_plus_imm[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_plus_imm(11),
	o => \pc_plus_imm[11]~input_o\);

-- Location: LCCOMB_X45_Y12_N14
\pc_alu|add|Carry~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \pc_alu|add|Carry~4_combout\ = (pc(10) & (pc(7) & (pc(5) & pc(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pc(10),
	datab => pc(7),
	datac => pc(5),
	datad => pc(6),
	combout => \pc_alu|add|Carry~4_combout\);

-- Location: LCCOMB_X44_Y12_N2
\pc_alu|add|Carry~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \pc_alu|add|Carry~5_combout\ = (pc(8) & (pc(9) & (\pc_alu|add|Carry~4_combout\ & \pc_alu|add|Carry~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pc(8),
	datab => pc(9),
	datac => \pc_alu|add|Carry~4_combout\,
	datad => \pc_alu|add|Carry~1_combout\,
	combout => \pc_alu|add|Carry~5_combout\);

-- Location: LCCOMB_X43_Y12_N8
\Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (\pc_control[0]~input_o\ & (\pc_plus_imm[11]~input_o\)) # (!\pc_control[0]~input_o\ & ((pc(11) $ (\pc_alu|add|Carry~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pc_plus_imm[11]~input_o\,
	datab => \pc_control[0]~input_o\,
	datac => pc(11),
	datad => \pc_alu|add|Carry~5_combout\,
	combout => \Mux4~0_combout\);

-- Location: IOIBUF_X40_Y0_N22
\reg_b_val[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg_b_val(11),
	o => \reg_b_val[11]~input_o\);

-- Location: FF_X43_Y12_N9
\pc[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux4~0_combout\,
	asdata => \reg_b_val[11]~input_o\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \pc_control[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc(11));

-- Location: LCCOMB_X43_Y12_N26
\pc_old[11]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pc_old[11]~reg0feeder_combout\ = pc(11)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => pc(11),
	combout => \pc_old[11]~reg0feeder_combout\);

-- Location: FF_X43_Y12_N27
\pc_old[11]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_old[11]~reg0feeder_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc_old[11]~reg0_q\);

-- Location: IOIBUF_X16_Y0_N15
\pc_plus_imm[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_plus_imm(12),
	o => \pc_plus_imm[12]~input_o\);

-- Location: LCCOMB_X44_Y12_N16
\Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (!\pc_control[0]~input_o\ & (pc(12) $ (((pc(11) & \pc_alu|add|Carry~5_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pc(11),
	datab => \pc_control[0]~input_o\,
	datac => pc(12),
	datad => \pc_alu|add|Carry~5_combout\,
	combout => \Mux3~0_combout\);

-- Location: LCCOMB_X44_Y12_N30
\Mux3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux3~1_combout\ = (\Mux3~0_combout\) # ((\pc_plus_imm[12]~input_o\ & \pc_control[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pc_plus_imm[12]~input_o\,
	datab => \pc_control[0]~input_o\,
	datad => \Mux3~0_combout\,
	combout => \Mux3~1_combout\);

-- Location: IOIBUF_X49_Y34_N1
\reg_b_val[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg_b_val(12),
	o => \reg_b_val[12]~input_o\);

-- Location: FF_X44_Y12_N31
\pc[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux3~1_combout\,
	asdata => \reg_b_val[12]~input_o\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \pc_control[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc(12));

-- Location: LCCOMB_X43_Y12_N20
\pc_old[12]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pc_old[12]~reg0feeder_combout\ = pc(12)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => pc(12),
	combout => \pc_old[12]~reg0feeder_combout\);

-- Location: FF_X43_Y12_N21
\pc_old[12]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_old[12]~reg0feeder_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc_old[12]~reg0_q\);

-- Location: IOIBUF_X53_Y24_N22
\pc_plus_imm[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_plus_imm(13),
	o => \pc_plus_imm[13]~input_o\);

-- Location: LCCOMB_X44_Y12_N22
\pc_alu|add|sum[13]\ : cycloneive_lcell_comb
-- Equation(s):
-- \pc_alu|add|sum\(13) = pc(13) $ (((pc(11) & (pc(12) & \pc_alu|add|Carry~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pc(11),
	datab => pc(13),
	datac => pc(12),
	datad => \pc_alu|add|Carry~5_combout\,
	combout => \pc_alu|add|sum\(13));

-- Location: LCCOMB_X44_Y12_N0
\Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (\pc_control[0]~input_o\ & (\pc_plus_imm[13]~input_o\)) # (!\pc_control[0]~input_o\ & ((\pc_alu|add|sum\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pc_plus_imm[13]~input_o\,
	datab => \pc_control[0]~input_o\,
	datad => \pc_alu|add|sum\(13),
	combout => \Mux2~0_combout\);

-- Location: IOIBUF_X45_Y0_N15
\reg_b_val[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg_b_val(13),
	o => \reg_b_val[13]~input_o\);

-- Location: FF_X44_Y12_N1
\pc[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux2~0_combout\,
	asdata => \reg_b_val[13]~input_o\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \pc_control[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc(13));

-- Location: LCCOMB_X43_Y12_N30
\pc_old[13]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pc_old[13]~reg0feeder_combout\ = pc(13)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => pc(13),
	combout => \pc_old[13]~reg0feeder_combout\);

-- Location: FF_X43_Y12_N31
\pc_old[13]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_old[13]~reg0feeder_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc_old[13]~reg0_q\);

-- Location: IOIBUF_X45_Y0_N22
\pc_plus_imm[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_plus_imm(14),
	o => \pc_plus_imm[14]~input_o\);

-- Location: LCCOMB_X44_Y12_N24
\pc_alu|add|Carry~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \pc_alu|add|Carry~6_combout\ = (pc(11) & (pc(13) & (pc(12) & \pc_alu|add|Carry~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pc(11),
	datab => pc(13),
	datac => pc(12),
	datad => \pc_alu|add|Carry~5_combout\,
	combout => \pc_alu|add|Carry~6_combout\);

-- Location: LCCOMB_X44_Y12_N14
\Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (\pc_control[0]~input_o\ & (\pc_plus_imm[14]~input_o\)) # (!\pc_control[0]~input_o\ & ((pc(14) $ (\pc_alu|add|Carry~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pc_plus_imm[14]~input_o\,
	datab => \pc_control[0]~input_o\,
	datac => pc(14),
	datad => \pc_alu|add|Carry~6_combout\,
	combout => \Mux1~0_combout\);

-- Location: IOIBUF_X45_Y34_N8
\reg_b_val[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg_b_val(14),
	o => \reg_b_val[14]~input_o\);

-- Location: FF_X44_Y12_N15
\pc[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux1~0_combout\,
	asdata => \reg_b_val[14]~input_o\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \pc_control[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc(14));

-- Location: LCCOMB_X43_Y12_N12
\pc_old[14]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pc_old[14]~reg0feeder_combout\ = pc(14)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => pc(14),
	combout => \pc_old[14]~reg0feeder_combout\);

-- Location: FF_X43_Y12_N13
\pc_old[14]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_old[14]~reg0feeder_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc_old[14]~reg0_q\);

-- Location: IOIBUF_X53_Y14_N1
\pc_plus_imm[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_plus_imm(15),
	o => \pc_plus_imm[15]~input_o\);

-- Location: LCCOMB_X44_Y12_N6
\Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (pc(14) & \pc_alu|add|Carry~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => pc(14),
	datad => \pc_alu|add|Carry~6_combout\,
	combout => \Mux0~0_combout\);

-- Location: LCCOMB_X44_Y12_N20
\Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0~1_combout\ = (\pc_control[0]~input_o\ & (\pc_plus_imm[15]~input_o\)) # (!\pc_control[0]~input_o\ & ((pc(15) $ (\Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pc_plus_imm[15]~input_o\,
	datab => \pc_control[0]~input_o\,
	datac => pc(15),
	datad => \Mux0~0_combout\,
	combout => \Mux0~1_combout\);

-- Location: IOIBUF_X53_Y25_N1
\reg_b_val[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg_b_val(15),
	o => \reg_b_val[15]~input_o\);

-- Location: FF_X44_Y12_N21
\pc[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux0~1_combout\,
	asdata => \reg_b_val[15]~input_o\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \pc_control[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc(15));

-- Location: LCCOMB_X43_Y12_N6
\pc_old[15]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pc_old[15]~reg0feeder_combout\ = pc(15)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => pc(15),
	combout => \pc_old[15]~reg0feeder_combout\);

-- Location: FF_X43_Y12_N7
\pc_old[15]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_old[15]~reg0feeder_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc_old[15]~reg0_q\);

-- Location: IOIBUF_X27_Y0_N8
\valid_in~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_valid_in,
	o => \valid_in~input_o\);

-- Location: LCCOMB_X39_Y1_N28
\valid_out_temp~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \valid_out_temp~feeder_combout\ = \valid_in~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \valid_in~input_o\,
	combout => \valid_out_temp~feeder_combout\);

-- Location: FF_X39_Y1_N29
valid_out_temp : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \valid_out_temp~feeder_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \valid_out_temp~q\);

ww_ir(0) <= \ir[0]~output_o\;

ww_ir(1) <= \ir[1]~output_o\;

ww_ir(2) <= \ir[2]~output_o\;

ww_ir(3) <= \ir[3]~output_o\;

ww_ir(4) <= \ir[4]~output_o\;

ww_ir(5) <= \ir[5]~output_o\;

ww_ir(6) <= \ir[6]~output_o\;

ww_ir(7) <= \ir[7]~output_o\;

ww_ir(8) <= \ir[8]~output_o\;

ww_ir(9) <= \ir[9]~output_o\;

ww_ir(10) <= \ir[10]~output_o\;

ww_ir(11) <= \ir[11]~output_o\;

ww_ir(12) <= \ir[12]~output_o\;

ww_ir(13) <= \ir[13]~output_o\;

ww_ir(14) <= \ir[14]~output_o\;

ww_ir(15) <= \ir[15]~output_o\;

ww_pc_old(0) <= \pc_old[0]~output_o\;

ww_pc_old(1) <= \pc_old[1]~output_o\;

ww_pc_old(2) <= \pc_old[2]~output_o\;

ww_pc_old(3) <= \pc_old[3]~output_o\;

ww_pc_old(4) <= \pc_old[4]~output_o\;

ww_pc_old(5) <= \pc_old[5]~output_o\;

ww_pc_old(6) <= \pc_old[6]~output_o\;

ww_pc_old(7) <= \pc_old[7]~output_o\;

ww_pc_old(8) <= \pc_old[8]~output_o\;

ww_pc_old(9) <= \pc_old[9]~output_o\;

ww_pc_old(10) <= \pc_old[10]~output_o\;

ww_pc_old(11) <= \pc_old[11]~output_o\;

ww_pc_old(12) <= \pc_old[12]~output_o\;

ww_pc_old(13) <= \pc_old[13]~output_o\;

ww_pc_old(14) <= \pc_old[14]~output_o\;

ww_pc_old(15) <= \pc_old[15]~output_o\;

ww_valid_out <= \valid_out~output_o\;
END structure;


