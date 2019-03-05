library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

entity SIPO is
	port(d: in std_logic;
		  clk: in std_logic;
		  clear: in std_logic;
		  q: inout std_logic_vector(13 downto 0));
end SIPO;

architecture char of SIPO is
begin

		process(clk, clear)
		begin
			if clear = '1' then
				q <= "00000000000000";
			elsif rising_edge(clk) then
				q(13) <= d;
				q(12 downto 0) <= q(13 downto 1);
			end if;
		end process;
end char;