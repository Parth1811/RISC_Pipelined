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
					7 => x"0000");

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



--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
-- 
-- entity reg_file_wrap is
--    
--    port (
--	   clk        : in   std_logic;
--	   rst        : in   std_logic;
--		ir         : in  std_logic_vector(15 downto 0);
--	   t1         : in  std_logic_vector(15 downto 0);
--	   t3         : in  std_logic_vector(15 downto 0);
--		t4				: in std_logic_vector (15 downto 0);
--	   pc         : in  std_logic_vector(15 downto 0);
--	   app7       : in  std_logic_vector(15 downto 0);
--	   state      : in  std_logic_vector(4 downto 0);
--       rf_d1      : out  std_logic_vector(15 downto 0);
--	   rf_d2      : out  std_logic_vector(15 downto 0);
--		R7 : in std_logic_vector(15 downto 0)
--     );
--		
--  end entity ;
--  
--   architecture behave of reg_file_wrap is
--	
--	component reg_file is
--    
--    port (
--	   clk        : in   std_logic;
--	   rst        : in   std_logic;
--	   wr         : in   std_logic;
--	   rf_a1      : in  std_logic_vector(2 downto 0);
--	   rf_a2      : in  std_logic_vector(2 downto 0);
--	   rf_a3      : in  std_logic_vector(2 downto 0);
--	   rf_d1      : out  std_logic_vector(15 downto 0);
--	   rf_d2      : out  std_logic_vector(15 downto 0);
--	   rf_d3      : in  std_logic_vector(15 downto 0);
--		Reg7 : in std_logic_vector(15 downto 0)
--     );
--		
--  end component ;
--
--   signal P,Q,S,wr,branch_opcode : std_logic;
--   signal R: std_logic_vector(1 downto 0);
--   signal rf_a1,rf_a2,rf_a3: std_logic_vector(2 downto 0);
--	signal rf_d3: std_logic_vector(15 downto 0);
--
--begin
--branch_opcode <= ((ir(15) and (not ir(14)) and (not ir(13))) or (ir(15) and (not ir(13)) and (not ir(12)))) and state(4) and (not(state(3) or state(2) or state(1) or state(0)));
--P <= (not state(4)) and (not state(3)) and (not state(2)) and state(1) and (not state(0));
--Q <= (not state(4)) and state(3) and (not state(2)) and state(1) and (not state(0));
--S <= (not state(4)) and state(3) and state(2) and (not state(1)) and state(0);
--
--R(0) <= (((not state(4)) and (not state(3)) and state(2) and (not state(1)) and (not state(0))) or 
--        ((not state(4)) and state(3) and (not state(2)) and state(1) and (not state(0)))) or branch_opcode;
--
--R(1) <= (state(4) and (not state(3)) and (not state(2)) and state(1) and state(0)) or branch_opcode; 
--
--wr <= ((not state(4)) and (not state(3)) and state(2) and (not state(1)) and (not state(0))) or 
--       ((not state(4)) and state(3) and (not state(2)) and state(1) and (not state(0)))      or
--       (state(4) and (not state(3)) and (not state(2)) and state(1) and state(0)) or
--       (state(4) and (not state(3)) and (not state(2)) and (not state(1)) and (not state(0))) ;
--
--
----rrfa1:process(S,ir,t3)
----begin
----	 case S is
----		when '0' =>  rf_a1 <= ir(8 downto 6);
----		when others =>  rf_a1 <= t3(2 downto 0);
----	 end case;
----end process rrfa1;
--
--  rf_a1 <= 
--     ir(8 downto 6) when s = '0' else 
--     t3(2 downto 0) when s = '1' ;
--
----rrfa2:process(P,ir)
----begin
----	 case P is
----		when '0' =>  rf_a2 <= ir(11 downto 9);
----		when others =>  rf_a2 <= ir(5 downto 3);
----	 end case;
----end process rrfa2;
--
--  rf_a2 <= 
--     ir(11 downto 9) when p = '0' else 
--     ir(5 downto 3) when p = '1' ;
--	
--
---- rrfa3:process(Q,ir,t3)
---- begin
----	 case Q is
----		when '0' =>  rf_a3 <= ir(11 downto 9);
----		when others =>  rf_a3 <= t3(2 downto 0);
----	 end case;
---- end process rrfa3;
--
--  rf_a3 <= 
--     ir(11 downto 9) when q = '0' else 
--     t3(2 downto 0) when q = '1' ;
--
---- rrfd3:process(R,pc,t1,app7)
---- begin
----	 case R is
----		when "00" =>  rf_d3 <= pc;
----		when "01" =>  rf_d3 <= t1;
----		when others =>  rf_d3 <= app7;
----	 end case;
---- end process rrfd3;
--
--  rf_d3 <=
--     pc when r = "00" else 
--     t1 when r = "01" else
--     app7 when r = "10" else
--	  t4 when r = "11";
--
-- reg_wrap: reg_file
--    
--    port map (
--	   clk        => clk,
--	   rst        => rst,
--	   wr         => wr,
--	   rf_a1      => rf_a1,
--	   rf_a2      => rf_a2,
--	   rf_a3      => rf_a3,
--	   rf_d1      => rf_d1,
--	   rf_d2      => rf_d2,
--	   rf_d3      => rf_d3,
--	   Reg7 => R7
--     );
--		
--
--
--
--
--	end architecture behave;
