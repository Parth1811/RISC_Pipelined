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
    	  clk, W      : in std_logic;
    	  A, Din      : in std_logic_vector(15 downto 0);
        Dout        : out std_logic_vector(15 downto 0)
    );

  end component ;

  signal pc, ir1 :std_logic_vector (15 downto 0);
  signal valid_out_temp : std_logic := '0';
  signal pc_temp : std_logic_vector(15 downto 0):= (others => '0');
  constant Z16 : std_logic_vector(15 downto 0):= (others  => '0');
  
  
 begin

  valid_out <= valid_out_temp;

  pc_alu: alu
	port map(
       A    =>  pc,
    	 B    =>  x"0001",
    	 OP   =>  "00" ,
    	 O    =>  pc_temp
  );

 code_mem: memory1
    port map (
    	  clk   => clk ,
    	  A     => pc,
        Dout  => ir1,
        Din   => Z16,
        W     => '0'
    );


  stg1: process(clk,rst)
   begin
     if rst = '1' then
        pc <= Z16;
     elsif rising_edge(clk) then
        case pc_control is
            when "00"   =>  pc <= pc_temp;
            when "01"   =>  pc <= pc_plus_imm;
            when others =>  pc <= reg_b_val;
        end case;

        valid_out_temp <= valid_in;
        pc_old <= pc;
        ir <= ir1;

     end if;
  end process stg1;

end architecture behave;
