library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

entity transmitter is
	port(msg: in std_logic_vector(13 downto 0);
		  load: in std_logic;
		  clk: in std_logic;
		  serial: out std_logic;
		  Tx: buffer std_logic);
end transmitter;




architecture char of transmitter is

signal data: std_logic_vector(18 downto 0);
signal p1, p2, p4, p8, p16: std_logic;

begin
	process(clk, load)
	begin	
			if load = '1' then
				 Tx <= '0';
				 data(0) <= msg(0) xor msg(1) xor msg(3) xor msg(4) xor msg(6) xor msg(8) xor msg(10) xor msg(11) xor msg(13);
				 data(1) <= msg(0) xor msg(2) xor msg(3) xor msg(5) xor msg(6) xor msg(9) xor msg(10) xor msg(12) xor msg(13);
				 data(2) <= msg(0);
				 data(3) <= msg(1) xor msg(2) xor msg(3) xor msg(7) xor msg(8) xor msg(9) xor msg(10);
				 data(4) <= msg(1);
				 data(5) <= msg(2);
				 data(6) <= msg(3);
				 data(7) <= msg(4) xor msg(5) xor msg(6) xor msg(7) xor msg(8) xor msg(9) xor msg(10);
				 data(8) <= msg(4);
				 data(9) <= msg(5);
				 data(10) <= msg(6);
				 data(11) <= msg(7);
				 data(12) <= msg(8);
				 data(13) <= msg(9);
				 data(14) <= msg(10);
				 data(15) <= msg(11) xor msg(12) xor msg(13);
				 data(16) <= msg(11);
				 data(17) <= msg(12);
				 data(18) <= msg(13);
				 Tx <= '1';
				 
					for k in 0 to 18 loop
					if rising_edge(clk) then
						serial <= data(k);
					end if;
					end loop;
				 Tx <= '0';
			elsif load = '0' then
				 data <= "0000000000000000000";
			else
			end if;
	end process;
end char;




