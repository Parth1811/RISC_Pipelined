library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity reg_file is

    port (
	   clk        : in   std_logic;
	   rst        : in   std_logic;
	   wr         : in   std_logic;

	   wr_7	      : in std_logic;
	   Reg7	      : in std_logic_vector(15 downto 0);

	   rf_a1      : in  std_logic_vector(2 downto 0);
	   rf_d1      : out  std_logic_vector(15 downto 0);

	   rf_a2      : in  std_logic_vector(2 downto 0);
	   rf_d2      : out  std_logic_vector(15 downto 0);

	   rf_a3      : in  std_logic_vector(2 downto 0);
	   rf_d3      : in  std_logic_vector(15 downto 0)
     );

end entity ;

architecture behave of reg_file is
	type regarray is array(7 downto 0) of std_logic_vector(15 downto 0);
	signal REG_file:
		regarray:=(		0 => x"0000",
					1 => x"0001",
					2 => x"0002",
					3 => x"0003",
					4 => x"0004",
					5 => x"0005",
					6 => x"0EE0",
					7 => x"0000"
        );

  begin

  	rf_d1 <= REG_file(conv_integer(rf_a1));
  	rf_d2 <= REG_file(conv_integer(rf_a2));

    process(clk,wr,rf_a3)

    begin
      if(clk'event and clk='1') then
        if(rst = '0') then
		      if(wr='1') then
			      REG_file(conv_integer(rf_a3)) <= rf_d3;
          end if;

          if(wr='1' or wr_7='1') then
            REG_file(7) <= Reg7;
          end if;
        end if;
      end if;

    end process;

end architecture;	
