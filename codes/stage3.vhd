	library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stage3 is
	port (
		clk, rst , valid_in									: in  std_logic;
		jlr_yes, beq_yes, jal_yes 					: in std_logic;

		reg_addr2_ctl 											: in std_logic;
		input_alu2_ctl_4 										: in std_logic_vector(1 downto 0);
		output_ctrl_4, output_ctrl_5   			: in std_logic;
		reg_inp_data_ctl_6									: in std_logic;
		mem_rd_5, reg_wr_6 									: in std_logic;

		rf_d1, rf_d2												: in std_logic_vector(15 downto 0);
		pc_plus_imm, pc_old_i				  			: in std_logic_vector(15 downto 0);

		carry_yes_i, zero_yes_i			  			: in std_logic;
		imm6_i															: in std_logic_vector(5 downto 0);
		imm9_i 															: in std_logic_vector(8 downto 0);
		reg_a_addr, reg_c_addr			: in std_logic_vector(2 downto 0);
		r_a_hzrd, r_b_hzrd, r_c_hzrd				: in std_logic_vector(2 downto 0);
		read_from_a													: in std_logic;
		stage4_op, stage5_op, stage6_op			: in std_logic_vector(15 downto 0);
		valid_vec_hzrd 											: in std_logic_vector(2 downto 0);

		alu_op_i 														: in std_logic_vector(1 downto 0);
		t1, t2, pc_old_o, reg_b_val					: out std_logic_vector(15 downto 0);
		imm6_o 															: out std_logic_vector(5 downto 0);
		imm9_o 															: out std_logic_vector(8 downto 0);
		reg_a_addr_o 												: out std_logic_vector(2 downto 0);
		alu_op_o														: out std_logic_vector(1 downto 0);
		carry_yes_o, zero_yes_o, xor_comp		: out std_logic;

		input_alu2_ctl_4_o 									: out std_logic_vector(1 downto 0);
		output_ctrl_4_o, output_ctrl_5_o		: out std_logic;
		reg_inp_data_ctl_6_o, valid_out			: out std_logic;
		mem_rd_5_o, reg_wr_6_o							: out std_logic;

		pc_plus_imm_o 											: out std_logic_vector(15 downto 0);
		rf_a2																: out std_logic_vector(2 downto 0);

		jlr_yes_o, beq_yes_o, jal_yes_o			: out std_logic;
		load_hzrd_out_2a, load_hzrd_out_2b	: in std_logic;
		load_hzrd_out_2c  									: in std_logic;
		ra_is_r7, rb_is_r7, rc_is_r7				: in std_logic
	);

end entity;


architecture behave of stage3 is

	signal valid_out1 : std_logic := '0';
	signal rf_d11,rf_d22 : std_logic_vector(15 downto 0);

	function is_different(a, b : in std_logic_vector; rst : in std_logic) return std_logic is
		-- a and b are of same length
		variable yes : std_logic := '0';
		begin
      for i in a'range loop
        yes := yes or ( a(i) xor b(i) );
      end loop;
      yes := yes and (not rst);
	  return yes;
	end function;

	begin

		valid_out <= valid_out1;

		rf_a2 <= reg_c_addr when reg_addr2_ctl='0' else
						 reg_a_addr when reg_addr2_ctl='1';

		xor_comp <= is_different(rf_d11, rf_d22, rst);

		rf_d11 <=  pc_old_i  when rb_is_r7 = '1' else
		   				 stage4_op when (r_b_hzrd(0) and valid_vec_hzrd(0)) = '1' else
    	   			 stage5_op when (((((not r_b_hzrd(0)) or (not valid_vec_hzrd(0))) and (r_b_hzrd(1)))) and valid_vec_hzrd(1)) = '1' else
    	   			 stage6_op when (((((not r_b_hzrd(0)) or (not valid_vec_hzrd(0))) and ((not r_b_hzrd(1)) or (not valid_vec_hzrd(1))) and r_b_hzrd(2)) or load_hzrd_out_2b) and valid_vec_hzrd(2)) = '1' else
							 rf_d1 ;

	  rf_d22 <=  pc_old_i when (ra_is_r7 = '1'  and read_from_a = '1' )else
		   				 pc_old_i when (rc_is_r7 = '1' and read_from_a = '0' ) else
 		   		 		 stage4_op when (((r_c_hzrd(0) and (not read_from_a))or(r_a_hzrd(0) and (read_from_a))) and valid_vec_hzrd(0)) = '1' else
    	   			 stage5_op when (((((((not r_c_hzrd(0)) or (not valid_vec_hzrd(0))) and r_c_hzrd(1))) and (not read_from_a)) or ((((((not r_a_hzrd(0)) or (not valid_vec_hzrd(0))) and r_a_hzrd(1)) or load_hzrd_out_2a) and (read_from_a)))) and valid_vec_hzrd(1))  = '1' else
    	   			 stage6_op when ((((((not r_c_hzrd(0)) or (not valid_vec_hzrd(0))) and ((not r_c_hzrd(1)) or (not valid_vec_hzrd(1))) and r_c_hzrd(2) and (not read_from_a)) or load_hzrd_out_2c) or (((((not r_a_hzrd(0)) or (not valid_vec_hzrd(0))) and ((not r_a_hzrd(1)) or (not valid_vec_hzrd(1))) and r_a_hzrd(2))or load_hzrd_out_2a) and (read_from_a))) and valid_vec_hzrd(2)) = '1' else
     	   			 rf_d2 ;

	  stg3:process(clk,rst)
 			begin
 				if(rst='1') then

 				elsif rising_edge(clk) then

	 				valid_out1 <= valid_in;
					carry_yes_o <= carry_yes_i;
					zero_yes_o <= zero_yes_i;
					pc_old_o <= pc_old_i;
					alu_op_o <= alu_op_i;
					imm9_o <= imm9_i;
					imm6_o <= imm6_i;
					reg_a_addr_o <= reg_a_addr;

					input_alu2_ctl_4_o <= input_alu2_ctl_4;
					output_ctrl_5_o <= output_ctrl_5;
					output_ctrl_4_o <= output_ctrl_4;
					mem_rd_5_o <= mem_rd_5;
					reg_wr_6_o <= reg_wr_6;
					reg_inp_data_ctl_6_o <= reg_inp_data_ctl_6;
					pc_plus_imm_o <= pc_plus_imm;
					jal_yes_o <= jal_yes;
					jlr_yes_o <= jlr_yes;
					beq_yes_o <= beq_yes;
					reg_b_val <= rf_d11;
					t1 <= rf_d11;
					t2 <= rf_d22;

				end if;

			end process stg3;

end architecture behave;
