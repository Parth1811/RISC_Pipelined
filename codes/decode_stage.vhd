library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decode_stage is
    port (
    	   clk, rst	                       : in  std_logic;
    	   valid_in		               : in std_logic;
    	   ir, pc_old_i                        : in std_logic_vector(15 downto 0);
    	   pc_old_o, pc_plus_imm               : out std_logic_vector(15 downto 0);
    	   imm6                                : out std_logic_vector(5 downto 0);
    	   imm9                                : out std_logic_vector(8 downto 0);
    	   reg_a_addr, reg_b_addr, reg_c_addr  : out std_logic_vector(2 downto 0);
         r_a_hzrd, r_b_hzrd, r_c_hzrd        : out std_logic_vector(2 downto 0);
    	   alu_op, input_alu2_ctl_4            : out std_logic_vector(1 downto 0);
         carry_yes, zero_yes                 : out std_logic;
    	   reg_addr2_ctl_3, reg_inp_data_ctl_6 : out std_logic;
    	   output_ctrl_4, output_ctrl_5        : out std_logic;
    	   mem_rd_5, reg_wr_6                  : out std_logic;
    	   jlr_yes, beq_yes, jal_yes           : out std_logic;
    	   valid_out, lm_out_2, sm_out_2       : out std_logic;
    	   read_from_a                         : out std_logic;
    	   load_hzrd_out_2a, load_hzrd_out_2b  : out std_logic;
    	   load_hzrd_out_2c, load_hzrd_out_2   : out std_logic;
    	   ra_is_r7, rb_is_r7, rc_is_r7        : out std_logic;
    	   r7_write_yes                        : out std_logic
     );
end entity ;

architecture behave of decode_stage is

	component ALU is
		port (
			A, B	: in std_logic_vector(15 downto 0);
			OP 		: in std_logic_vector(1 downto 0);
			O 		: out std_logic_vector(15 downto 0);
			C, Z	: out std_logic
		);
	end component;

  function check_hazard(a, b : in std_logic_vector) return std_logic is
	  variable hazard : std_logic := '0';
		begin
		  for i in a'range loop
		    hazard :=  hazard or (a(i) xor b(i));
		  end loop;
      hazard := not hazard;
	  return hazard;
	end function;

  function Check_instr(ir, inst : in std_logic_vector; rst : in std_logic) return std_logic is
	  variable yes : std_logic := '1';
		begin
      for i in inst'range loop
        yes := yes and (not (ir(12+i) xor inst(i)));
      end loop;
      yes := yes and (not rst);
	  return yes;
	end function;

  signal yin,imm6_16,imm9_se_16 : std_logic_vector(15 downto 0);
  signal r_a1,r_a2,r_a3,r_b,r_c,r_a,r_a_hzrdn,r_b_hzrdn,r_c_hzrdn,r_a_hzrdx,r_b_hzrdx,r_c_hzrdx : std_logic_vector(2 downto 0);
  signal carry1,zero1,pc_plus_imm_ctl: std_logic;
  signal sw_yes1,lm_yes1,sm_yes1,adi_yes1,lw_yes1,beq_yes1,lhi_yes1,lw_prev1,jal_yes1,jlr_yes1,r_a_hzrd1,r_b_hzrd1,r_c_hzrd1:std_logic;
  signal valid_out1 : std_logic := '0';

  begin

    jal_yes <= jal_yes1;
    r_b <= ir(8 downto 6);
    r_c <= ir(5 downto 3);
    r_a <= ir(11 downto 9);
    valid_out <= valid_out1;

    stage_4_alu: alu
      port map(
      	 A     =>  pc_old_i,
      	 B     =>  yin,
      	 OP    =>  "00",
      	 O     =>  pc_plus_imm,
      	 C     =>  carry1,
      	 Z     =>  zero1);

   imm6_16(5 downto 0) <= ir(5 downto 0);
   imm6_16(15 downto 6) <= (others => '0');

   imm9_se_16(8 downto 0) <= ir(8 downto 0);
   imm9_se_16(15 downto 9) <= (others => '0');

   yin <= imm6_16 when pc_plus_imm_ctl='0' else
   imm9_se_16 when pc_plus_imm_ctl='1';

   pc_plus_imm_ctl <= (not ((ir(15)) and (ir(14)) and (not ir(13)) and (not ir(12)))) and
                   ((ir(15)) and (not ir(14)) and (not ir(13)) and (not ir(12)));

   jal_yes1 <= Check_instr(ir, "1000", rst);
   adi_yes1 <= Check_instr(ir, "0001", rst);
   lw_yes1  <= Check_instr(ir, "0100", rst);
   lm_yes1  <= Check_instr(ir, "0110", rst);
   sm_yes1  <= Check_instr(ir, "0111", rst);
   beq_yes1 <= Check_instr(ir, "1100", rst);
   lhi_yes1 <= Check_instr(ir, "0011", rst);
   sw_yes1  <= Check_instr(ir, "0101", rst);
   jlr_yes1 <= Check_instr(ir, "1001", rst);

   reg_a_addr <= r_a1;

   r_a_hzrd1 <= check_hazard(r_a1, r_a);
   r_b_hzrd1 <= check_hazard(r_a1, r_b);
   r_c_hzrd1 <= check_hazard(r_a1, r_c);

   load_hzrd_out_2 <=  (lw_prev1 and (not (jal_yes1 or lhi_yes1)) and (r_b_hzrd1)) or (lw_prev1 and (not (jal_yes1 or lhi_yes1)) and (r_c_hzrd1));

   r_a_hzrd <= r_a_hzrdn;
   r_b_hzrd <= r_b_hzrdn;
   r_c_hzrd <= r_c_hzrdn;

   stg2:process(clk,rst)

    begin
      if(rst='1') then
        beq_yes <= '0';
        jlr_yes <= '0';

      elsif rising_edge(clk) then

        ra_is_r7 <= ir(11) and ir(10) and ir(9);
        rb_is_r7 <= ir(8) and ir(7) and ir(6);
        rc_is_r7 <= ir(5) and ir(4) and ir(3);
        r7_write_yes <= ir(11) and ir(10) and ir(9) and (not sm_yes1) and (not sw_yes1) and (not beq_yes1) and (not jal_yes1) and (not jlr_yes1);
        valid_out1 <= valid_in;
        r_a1 <= ir(11 downto 9);
        reg_b_addr <= ir(8 downto 6);
        reg_c_addr <= ir(5 downto 3);
        imm6 <= ir(5 downto 0);
        imm9 <= ir(8 downto 0);
        pc_old_o <= pc_old_i;

        carry_yes <= (Check_instr(ir, "0000", '0') or Check_instr(ir, "0010", '0')) and ir(1) and (not ir(0));
        zero_yes  <= (Check_instr(ir, "0000", '0') or Check_instr(ir, "0010", '0')) and (not ir(1)) and ir(0);

        reg_addr2_ctl_3 <= ir(14) or ir(12);
        input_alu2_ctl_4(1) <= '0';
        input_alu2_ctl_4(0) <= ((not ir(15)) and ir(14)) or ir(12);
        output_ctrl_4 <= ir(13) and ir(12);
        output_ctrl_5 <= ir(14);
        mem_rd_5 <= (not ir(15)) and (ir(14)) and (not ir(13)) and (ir(12));
        reg_wr_6 <= (not ir(14)) or ((not ir(15)) and(not ir(12)));
        reg_inp_data_ctl_6 <= ir(15);
        beq_yes <= beq_yes1;
        jlr_yes <= jlr_yes1;
        alu_op(1)<= ir(13);
        alu_op(0) <= ir(15);

        lm_out_2 <= lm_yes1;
        sm_out_2 <= sm_yes1;

        r_a_hzrdn(0) <= check_hazard(r_a1, r_a);
        r_a_hzrdn(1) <= check_hazard(r_a2, r_a);
        r_a_hzrdn(2) <= check_hazard(r_a3, r_a);

        r_b_hzrdn(0) <= check_hazard(r_a1, r_b);
        r_b_hzrdn(1) <= check_hazard(r_a2, r_b);
        r_b_hzrdn(2) <= check_hazard(r_a3, r_b);

        r_c_hzrdn(0) <= check_hazard(r_a1, r_c);
        r_c_hzrdn(1) <= check_hazard(r_a2, r_c);
        r_c_hzrdn(2) <= check_hazard(r_a3, r_c);

        read_from_a <= lm_yes1 or sm_yes1 or sw_yes1 or beq_yes1;

        lw_prev1 <= lw_yes1;

        load_hzrd_out_2a <= lw_prev1 and (not (jal_yes1 or lhi_yes1)) and (r_a_hzrd1);
        load_hzrd_out_2b <= lw_prev1 and (not (jal_yes1 or lhi_yes1)) and (r_b_hzrd1);
        load_hzrd_out_2c <= lw_prev1 and (not (jal_yes1 or lhi_yes1)) and (r_c_hzrd1);
        r_a2 <= r_a1;
        r_a3 <= r_a2;
      end if;
    end process stg2;

end architecture behave;
