library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity execute_stage is
	port(
	   clk     : in  std_logic;
	   rst		: in std_logic;
	   valid_in : in std_logic;
	   input_alu2_ctl : in std_logic_vector(1 downto 0);
	   output_ctrl: in std_logic;

	   output_ctrl_5: in std_logic;		output_ctrl_5_o: out std_logic;
	   reg_inp_data_ctl_6: in std_logic;	reg_inp_data_ctl_6_o: out std_logic;
	   mem_rd_5 : in std_logic;		mem_rd_5_o : out std_logic;
	   reg_wr_6 : in std_logic;		reg_wr_6_o : out std_logic;
	   jlr_yes : in std_logic;		jlr_yes_o : out std_logic;
	   beq_yes: in std_logic;		beq_yes_o: out std_logic;
	   jal_yes: in std_logic;		jal_yes_o: out std_logic;

	   reg_a_adr_in: in std_logic_vector(2 downto 0);	reg_a_adr_out: out std_logic_vector(2 downto 0);
	   t1  : in std_logic_vector(15 downto 0);
	   t2_in  : in std_logic_vector(15 downto 0);		t2_out: out std_logic_vector(15 downto 0);
	   imm6  : in std_logic_vector(5 downto 0);
	   imm9  : in std_logic_vector(8 downto 0);
	   alu_op: in std_logic_vector(1 downto 0);
	   pc_old_i: in std_logic_vector(15 downto 0);		pc_old_o: out std_logic_vector(15 downto 0);
	   carry_yes_i :  in std_logic;				carry_yes_o :  out std_logic;
	   zero_yes_i: in std_logic;				zero_yes_o: out std_logic;
	   --reg_a_adr_out: out std_logic_vector(2 downto 0);
	   --t2_out: out std_logic_vector(15 downto 0);
	   --pc_old_o: out std_logic_vector(15 downto 0);


	   alu_out : out std_logic_vector(15 downto 0);


	   p_carry: out std_logic;
	   p_zero : out std_logic;
	   p_carry_com: out std_logic;
	   p_zero_com:out std_logic;
	   --carry_yes_o :  out std_logic;
	   --zero_yes_o: out std_logic;


	   --output_ctrl_5_o: out std_logic;
	   --reg_inp_data_ctl_6_o: out std_logic;
	   --mem_rd_5_o : out std_logic;
	   --reg_wr_6_o : out std_logic;
	   --jlr_yes_o : out std_logic;
	   --beq_yes_o: out std_logic;
	   --jal_yes_o: out std_logic;

	   valid_out : out std_logic;

	   stage4_out_hzrd : out std_logic_vector(15 downto 0)

	   --p_carry_com: out std_logic;
	   --p_zero_com:out std_logic
	);
end entity;


architecture behav of execute_stage is

component ALU is
	port (
		A, B	: in std_logic_vector(15 downto 0);
		OP 		: in std_logic_vector(1 downto 0);
		O 		: out std_logic_vector(15 downto 0);
		C, Z	: out std_logic
	);
end component;



signal imm6_bef, imm9_bef, imm9_aft, ALU2, ALU_out_1, ALU_output: std_logic_vector(15 downto 0);
signal carry, zero: std_logic;
signal valid_out1: std_logic := '0';

begin

imm6_bef <= ("0000000000") & imm6;
imm9_bef <= ("0000000") & imm9;
imm9_aft <= imm9 & ("0000000");

valid_out <= valid_out1;

ALU2<= t2_in when input_alu2_ctl = "00" else
     imm6_bef when input_alu2_ctl = "01" else
     imm9_bef when input_alu2_ctl = "10" else
     imm9_aft when input_alu2_ctl = "11";

alu_execute: ALU
 port map(	A => t1,
		B => ALU2,
		OP => alu_op,
		O =>  ALU_out_1,
		C => carry,
		Z => zero  );


p_carry_com <= carry;
p_zero_com <= zero;

ALU_output <= ALU_out_1 when output_ctrl = '0' else imm9_aft;

stage4_out_hzrd <= pc_old_i when (jal_yes = '1' or jlr_yes = '1') else ALU_output;

process(clk)
begin
    if(clk'event and clk='1') then
        if(rst = '0') then

 	 alu_out <= ALU_output;
	 valid_out1 <= valid_in;

 	p_carry <= carry;
 	p_zero <= zero;

 	output_ctrl_5_o <= output_ctrl_5;
	reg_inp_data_ctl_6_o <= reg_inp_data_ctl_6;
 	mem_rd_5_o <= mem_rd_5;
 	reg_wr_6_o <= reg_wr_6;
 	jlr_yes_o <= jlr_yes;
 	beq_yes_o <= beq_yes;
	jal_yes_o <= jal_yes;

 	reg_a_adr_out <= reg_a_adr_in;
 	t2_out <= t2_in;
 	pc_old_o <= pc_old_i;
 	carry_yes_o <= carry_yes_i;
 	zero_yes_o <= zero_yes_i;

        end if;
    end if;



end process;
end architecture;
