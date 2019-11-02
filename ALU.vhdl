library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;

package project is
    	component adder_16bit is
    	  port ( A : in std_logic_vector (15 downto 0);
           	B : in std_logic_vector (15 downto 0);
           	sum : out std_logic_vector (15 downto 0);
	   	Cout: out std_logic );
  	end component;

	component subtractor_16bit is
	  port ( A : in std_logic_vector (15 downto 0);
	         B : in std_logic_vector (15 downto 0);
	         diff : out std_logic_vector (15 downto 0)) ;
	end component ;

	component nand_16bit is
	  port ( A : in std_logic_vector (15 downto 0);
	         B : in std_logic_vector (15 downto 0);
	         nand_out : out std_logic_vector (15 downto 0)) ;
	end component;

	component MUX_4 is
		port (
	      S1, S0  : in std_logic;
	      X1, X2, X3, X4 : in std_logic_vector(15 downto 0) ;
	      Z : out std_logic_vector(15 downto 0)
		);
	end component;

  	component TwosCompliment is
		port (
			X : in std_logic_vector (15 downto 0);
			Z : out std_logic_vector(15 downto 0)
		);
	end component;
end project;



library work;
use work.project.all;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
entity adder_16bit is
  port ( A : in std_logic_vector (15 downto 0);
         B : in std_logic_vector (15 downto 0);
         sum : out std_logic_vector (15 downto 0);
         Cout: out std_logic
       );
end entity ;

architecture Equations of adder_16bit is
  signal Carry : std_logic_vector( 16 downto 0 );

  begin
    Carry(0 downto 0) <= "0";

    genAdd: for I in 0 to 15 generate
      sum(I) <= a(I) xor b(I) xor Carry(I);
      Carry(I+1) <= ((a(I) or b(I)) and Carry(I)) or (a(I) and b(I));
    end generate genAdd;

    Cout <= Carry(16);

end Equations;




library work;
use work.project.all;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
entity nand_16bit is
  port ( A : in std_logic_vector (15 downto 0);
         B : in std_logic_vector (15 downto 0);
         nand_out : out std_logic_vector (15 downto 0)) ;
end entity ;

architecture Equations of nand_16bit is

  begin

    genNand: for I in 0 to 15 generate
      nand_out(I) <= not (A(I) and B(I));
    end generate genNand;

  end Equations;




library work;
use work.project.all;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
entity subtractor_16bit is
  port ( A : in std_logic_vector (15 downto 0);
         B : in std_logic_vector (15 downto 0);
         diff : out std_logic_vector (15 downto 0)) ;
end entity ;

architecture Equations of subtractor_16bit is

  signal B_minus: std_logic_vector(15 downto 0);
	signal C_trash: std_logic;

begin

  tc : TwosCompliment
      port map( X => B, Z => B_minus);

  sub_add : adder_16bit
      port map( A => A, B => B_minus, sum => diff, Cout=> C_trash );

  end Equations;





library work;
use work.project.all;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
entity MUX_4 is
	port (
      S1, S0  : in std_logic;
      X1, X2, X3, X4 : in std_logic_vector(15 downto 0) ;
      Z : out std_logic_vector(15 downto 0)
	);
end entity MUX_4;
architecture arch of MUX_4 is

begin
	genmux: for i in 0 to 15 generate
			Z(i) <= (X1(i) and ((not S0) and (not S1))) or (X2(i) and ((not S1) and S0)) or (X3(i) and (S1 and (not S0))) or (X4(i) and (S0 and S1));
	end generate genmux;

end architecture ; 





library work;
use work.project.all;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
entity TwosCompliment is
	port (
      X : in std_logic_vector(15 downto 0);
      Z : out std_logic_vector(15 downto 0)
	);
end entity TwosCompliment;
architecture arch of TwosCompliment is
  signal T : std_logic_vector(15 downto 0);
begin

	gentcs: for i in 0 to 15 generate
			T(i) <= not X(i);
	end generate gentcs;

	fa: adder_16bit
	port map (
			a => T,
			b => "0000000000000001",
			sum => Z
	);

end architecture ; -- arch




library work;
use work.project.all;
library std ;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;

entity ALU is
	port (
		A, B	: in std_logic_vector(15 downto 0);
		OP 		: in std_logic_vector(1 downto 0);
		O 		: out std_logic_vector(15 downto 0);
		C, Z	: out std_logic
	);
end entity ALU;

architecture arch of ALU is
	constant Z16 : std_logic_vector(15 downto 0)  := (others  => '0');
	signal P, Q, R, Out_signal  : std_logic_vector(15 downto 0);

begin
	add: adder_16bit
		port map (A => A, B => B, sum => P, Cout => C);

	subtractor: subtractor_16bit
		port map (A => A, B => B, diff => Q);

	nand1: nand_16bit
		port map (A => A, B => B, nand_out => R);

	mux_alu: MUX_4
		port map (X1 => P, X2 => Q ,X3 => R, X4 => Z16, S0 => OP(0), S1 => OP(1), Z => Out_signal);

		Z <='1' when (Out_signal = Z16) else '0';
		O <= Out_signal;

end architecture ; -- arch
