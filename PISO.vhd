library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

entity PISO is
	port(clk, clear: in std_logic;
		  d: in std_logic_vector(13 downto 0);
		  load: in std_logic;
		  q: out std_logic);
end PISO;

architecture char of PISO is
signal temp: std_logic_vector(18 downto 0);
begin
		process(clk, clear, load, d)
		begin
			temp(0) <= d(0) xor d(1) xor d(3) xor d(4) xor d(6) xor d(8) xor d(10) xor d(11) xor d(13);
			temp(1) <= d(0) xor d(2) xor d(3) xor d(5) xor d(6) xor d(9) xor d(10) xor d(12) xor d(13);
			temp(2) <= d(0);
			temp(3) <= d(1) xor d(2) xor d(3) xor d(7) xor d(8) xor d(9) xor d(10);
			temp(4) <= d(1);
			temp(5) <= d(2);
			temp(6) <= d(3);
			temp(7) <= d(4) xor d(5) xor d(6) xor d(7) xor d(8) xor d(9) xor d(10);
			temp(8) <= d(4);
			temp(9) <= d(5);
			temp(10) <= d(6);
			temp(11) <= d(7);
			temp(12) <= d(8);
			temp(13) <= d(9);
			temp(14) <= d(10);
			temp(15) <= d(11) xor d(12) xor d(13);
			temp(16) <= d(11);
			temp(17) <= d(12);
			temp(18) <= d(13);
			if clear = '1' then
				q <= '0';
			elsif (load = '1') and (rising_edge(clk)) then 
				q <= temp(18);
				end if;
			temp(18 downto 1) <= temp(17 downto 0);
		end process;
end char;