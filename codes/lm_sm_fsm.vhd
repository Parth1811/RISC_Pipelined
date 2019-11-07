library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controller is
	port(
			clk, rst, valid_2											  : in std_logic;
			lm_out_2, sm_out_2, load_hzrd_out_2 	  : in std_logic;
			mem_addr_in, reg_data_in, mem_data_in   : in std_logic_vector(15 downto 0);
			shifter_in													 	  : in std_logic_vector(7 downto 0);

			next_mem_addr													  : out std_logic_vector(15 downto 0);
			write_mem_data, write_reg_data				  : out std_logic_vector(15 downto 0);
			reg_addr_out													  : out std_logic_vector(2 downto 0);
			clk1,clk2,clk3,clk4										  : out std_logic;
			write_to_reg, write_to_mem						  : out std_logic;
			lm_active_now, sm_active_now 			: out std_logic;
			load_init_mem_addr, temp3					:	out std_logic;
			temp4, sm_active_7 								: out std_logic
		);
end entity;

architecture Behav of controller is

	component shifter is
	   port(
		   clk,shift,wr : in std_logic;
			 writeData		: in std_logic_vector(7 downto 0);
			 bit1					: out std_logic
		 );
	end component;

	type state_type is ( S0,S1,S2,S3,S4,S5,S6,lukhi1,lukhi2,lukhi3,lukhi4,lukhi5);
	signal state : state_type := S0;
	signal alu_out,alu_in,reg_val: std_logic_vector(15 downto 0) ;
	signal counter:std_logic_vector(15 downto 0) := x"0000";
	signal car_dump,zer_dump:std_logic;
	signal shift_now, shifter_bit_0, clk_3_temp:std_logic;

	begin

		shifter_instance: shifter
			port map(
				clk                    => clk ,
				shift                  => shift_now,
				wr                     => clk_3_temp,
				writeData              => shifter_in,
				bit1                   => shifter_bit_0
			);

		alu_in <= counter 		when (state = S3 or state = S5) else
    					mem_addr_in when (state = S2 or state = S6) else
	    				counter ;
		alu_out <= std_logic_vector(to_signed((to_integer(signed(alu_in)) + 1), 16));

		shift_now          <= '1' when (state = S3 or state = S6) else '0';
	  lm_active_now 		 <= '1' when (state = S2 or state = S3) else '0';
	 	sm_active_now 		 <= '1' when (state = S5 or state = S6) else '0';
	  load_init_mem_addr <= '1' when (state = S1 or state = S4) else  '0';
		write_to_reg 			 <= '1' when (state = S3 and shifter_bit_0 = '1') else '0';
		write_to_mem 			 <= '1' when (state = S6 and shifter_bit_0 = '1') else '0';
		temp4        <= '1' when (state = lukhi4  or state = lukhi5) else '0';

	 	write_mem_data <= reg_val;
	 	write_reg_data <= reg_val;

	 	reg_addr_out <= counter(2 downto 0);

	 	clk1 <= '1' when state = S0 else '0';
		clk2 <= '1' when state = S0 else '0';
		clk3 <= '1' when state = S0 else '0';
		clk_3_temp <= '1' when state = S0 else '0';
		clk4 <= '1' when (state = S0 or state = S1 or state = S4 or state = lukhi3 or state = lukhi4 or state = lukhi5) else '0';
		sm_active_7 <= not(counter(0) or counter(1) or counter(2)) when (state = S6) else '0';

		process(clk,rst)
			begin
				if(rst ='1')then
					state <= S0;
				elsif(rising_edge(clk))then
					case state is
						when S0 =>
							temp3 <= '0' ;
							if(valid_2 = '1' and lm_out_2 = '1')then
								state <= S1;
							elsif(valid_2 = '1' and sm_out_2 = '1')then
								state <= S4;
							elsif(load_hzrd_out_2 = '1')then
								state <= lukhi3;
							else
								state <= S0;
							end if;

						when S1 =>
							state <= lukhi1;

						when lukhi1 =>
							state <= S2;

						when S2 =>
							reg_val <= mem_data_in;
							if (shifter_bit_0 = '1')then
								next_mem_addr <= alu_out;
							else
								next_mem_addr <= mem_addr_in;
							end if;
							state <= S3;

						when S3 =>
							counter <= alu_out;
							if (counter(2 downto 0)= "111") then
								state <= S0;
							else
								state <= S2;
							end if ;

						when S4 =>
							state <= lukhi2;

						when lukhi2 =>
							state <= S5;
							next_mem_addr <= mem_addr_in;

						when S5 =>
							counter <= alu_out;
							reg_val <= reg_data_in;
							next_mem_addr <= mem_addr_in;
							state <= S6;

						when S6 =>
							if (shifter_bit_0 = '1')then
								next_mem_addr <= alu_out;
							else
								next_mem_addr <= mem_addr_in;
							end if;
							if (counter(2 downto 0)= "000") then
								state <= S0;
							else
								state <= S5;
							end if ;

						when lukhi3 =>
							temp3 <= '0' ;
							state <= lukhi4;

						when lukhi4 =>
							temp3 <= '1' ;
							state <= lukhi5;

						when lukhi5 =>
							state <= S0;
						end case;

				end if;

		end process;

end Behav;
