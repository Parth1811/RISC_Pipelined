library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Mem_wr_5 is 
 port (
	   clk: in  std_logic;
	   rst: in std_logic;
	   valid_in : in std_logic;
	   p_carry_i: in std_logic;				p_carry_o: out std_logic;		
	   p_zero_i: in std_logic;				p_zero_o : out std_logic;

	   output_ctrl: in std_logic;
	   read_ctrl: in std_logic;
	   reg_inp_data_ctl_6: in std_logic;			reg_inp_data_ctl_6_o: out std_logic;
	   reg_wr_6 : in std_logic;				reg_wr_6_o : out std_logic;
	   jlr_yes : in std_logic;				jlr_yes_o : out std_logic;
	   beq_yes: in std_logic;				beq_yes_o: out std_logic;
	   jal_yes: in std_logic;				jal_yes_o: out std_logic;
	   reg_a_adr_in: in std_logic_vector(2 downto 0);	reg_a_adr_out: out std_logic_vector(2 downto 0);
	   t2_in  : in std_logic_vector(15 downto 0);		t2_out: out std_logic_vector(15 downto 0);
	   pc_old_i: in std_logic_vector(15 downto 0);		pc_old_o: out std_logic_vector(15 downto 0);
	   carry_yes_i :  in std_logic;				carry_yes_o :  out std_logic;
	   zero_yes_i: in std_logic;				zero_yes_o: out std_logic;
	   --reg_a_adr_out: out std_logic_vector(2 downto 0);
	   --t2_out: out std_logic_vector(15 downto 0);
	   --pc_old_o: out std_logic_vector(15 downto 0);
	   stage_5_out : out std_logic_vector(15 downto 0);
	   alu_out_5 : in std_logic_vector(15 downto 0);
	   stage5_out_hzrd: out std_logic_vector(15 downto 0);
	   --p_carry_o: out std_logic;
	   --carry_yes_o :  out std_logic;
	   --zero_yes_o: out std_logic;
	   --p_zero_o : out std_logic;

	   --reg_inp_data_ctl_6_o: out std_logic;
	   --reg_wr_6_o : out std_logic;
	   --jlr_yes_o : out std_logic;
	   --beq_yes_o: out std_logic;
	   --jal_yes_o: out std_logic;

	   valid_out : out std_logic ;

	   mem_addr_in 	: in std_logic_vector(15 downto 0);
	   write_mem_data: in std_logic_vector(15 downto 0);
	   read_mem_data: out std_logic_vector(15 downto 0);
	   write_to_mem	: in std_logic;
	   lm_active : in std_logic;
	   sm_active : in std_logic
		
     );

end entity;

architecture behav of Mem_wr_5 is

   component memory2 is
    
	port (
		A, Din : in std_logic_vector(15 downto 0);
	 	clk, W : in std_logic;
		Dout   : out std_logic_vector(15 downto 0)
		);
		
  end component;


signal valid_out1 : std_logic := '0';
signal mem_dout, mem_dwri, mem_addr:std_logic_vector (15 downto 0);
signal Mem_out_1, Mem_output:std_logic_vector (15 downto 0);
signal mem_read: std_logic;

begin

valid_out <= valid_out1;

 data_mem: memory2
    port map (
	   clk => clk ,
	   A => mem_addr,
      	   --membr1 => membr1,
	   --membr2 => membr2,
	   Dout => mem_dout,
	   --membw1 => membw1,
	   --membw2 => membw2,
	   Din => mem_dwri,
	   W => mem_read
     );

Mem_out_1<= mem_dout;
read_mem_data <= Mem_out_1;

mem_read <= write_to_mem when (lm_active='1'or sm_active='1') else  read_ctrl and valid_in;


mem_dwri <= write_mem_data(15 downto 0) when sm_active='1' else  t2_in(15 downto 0) ;


mem_addr <= mem_addr_in when (lm_active='1'or sm_active='1') else  alu_out_5;


Mem_output <= Mem_out_1 when output_ctrl = '1' else alu_out_5 ;


stage5_out_hzrd <= pc_old_i when (jal_yes = '1' or jlr_yes = '1') else Mem_output;

process(clk)
begin
    if(clk'event and clk='1') then
        if(rst = '0') then
	stage_5_out <= Mem_output;
	valid_out1 <= valid_in;

 	p_carry_o <= p_carry_i;
 	p_zero_o <= p_zero_i;


	reg_inp_data_ctl_6_o <= reg_inp_data_ctl_6;
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








