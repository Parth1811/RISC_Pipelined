library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity stage1 is

  port (
  	   clk, rst, valid_in      : in  std_logic;
  	   pc_control              : in std_logic_vector(1 downto 0);
  	   reg_b_val, pc_plus_imm  : in std_logic_vector(15 downto 0);
  	   ir, pc_old              : out std_logic_vector(15 downto 0);
  	   valid_out               : out std_logic
   );

end entity ;

architecture behave of stage1 is

	component ALU is
		port (
			A, B	: in std_logic_vector(15 downto 0);
			OP 		: in std_logic_vector(1 downto 0);
			O 		: out std_logic_vector(15 downto 0);
			C, Z	: out std_logic
		);
	end component;

  component memory1 is

    port (
    	  clk, wr             : in std_logic;
    	  mema                : in std_logic_vector(15 downto 0);
        membw1, membw2      : in std_logic_vector(7 downto 0);
        membr1, membr2      : out std_logic_vector(7 downto 0)
    );

  end component ;

  signal pc, ir1 :std_logic_vector (15 downto 0);
  signal pc_out : std_logic_vector(15 downto 0):= (others => '0');
  signal membr1,membr2,membw1,membw2 : std_logic_vector (7 downto 0);
  signal carry1,zero1 : std_logic;
  signal valid_out_temp : std_logic := '0';

 begin

  ir1 <= membr1 & membr2;
  valid_out <= valid_out_temp;

  pc_alu: alu
	port map(
       A      =>  pc,
    	 B      =>  x"0001",
    	 OP       =>  "00" ,
    	 O     =>  pc_out,
    	 C        =>  carry1,
    	 Z        =>  zero1
  );

 code_mem: memory1
    port map (
    	  clk       => clk ,
    	  mema      => pc,
        membr1    => membr1,
    		membr2    => membr2,
    	  membw1    => membw1,
    		membw2    => membw2,
    	  wr        => '0'
    );


  stg1: process(clk,rst)
   begin
     if rst = '1' then
        pc <= x"0000";
     elsif rising_edge(clk) then
        case pc_control is
            when "00"   =>  pc <= pc_out;
            when "01"   =>  pc <= pc_plus_imm;
            when others =>  pc <= reg_b_val;
        end case;

        valid_out_temp <= valid_in;
        pc_old <= pc;
        ir <= ir1;

     end if;
  end process stg1;

end architecture behave;
