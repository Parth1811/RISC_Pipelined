use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity memory1 is
	port (
				A : in std_logic_vector(15 downto 0);
				Din : in std_logic_vector(15 downto 0);
	 			clk, W : in std_logic;
				Dout   : out std_logic_vector(15 downto 0)
			 );
end entity;

architecture Form of memory1 is
	type regarray is array(100 downto 0) of std_logic_vector(15 downto 0);
	signal Memory:
		regarray:=(

        0 => "0000001010011000", --add
				1 => "0000100101010010", --adc
				2 => "0010110100001000", --ndu
				3 => "0011010000111000", --lhi
				4 => "0000000000000000", --add
				5 => "0000000000000000", --add
				6 => "0001011001000011", --adi
     		others => "0000000000000000");

begin

	Dout <= Memory(conv_integer(A));
	Mem_write:
	process (W,Din,A,clk)
		begin
			if(W = '1') then
				if(rising_edge(clk)) then
					Memory(conv_integer(A)) <= Din;
				end if;
			end if;
	end process;
end Form;


library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity memory2 is
	port (
				A, Din : in std_logic_vector(15 downto 0);
	 			clk, W : in std_logic;
				Dout   : out std_logic_vector(8 downto 0)
			 );
end entity;

architecture Form of memory2 is
	type regarray is array(100 downto 0) of std_logic_vector(15 downto 0);
	signal Memory2:
		regarray:=(

        0 => "0000000100000010",
				1 => "0000001100000100",
				2 => "0000000000000111",
				3 => "0000011100001000",
				4 => "0000100100001010",
				5 => "0000101100001100",
				6 => "0000101100001100",
        7 => "0000110100001110",
        8 => "0000111100010110",
        9 => "0001000100010010",
        10 => "0001001100010100",
     		others => "0000000000000000");

begin

	Dout <= Memory2(conv_integer(A));
	Mem_write:
	process (W,Din,A,clk)
		begin
			if(W = '1') then
				if(rising_edge(clk)) then
					Memory2(conv_integer(A)) <= Din;
				end if;
			end if;
	end process;

end Form;
