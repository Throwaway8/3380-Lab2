library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

entity receiver is
	port(cereal: in std_logic;
		  Rx: buffer std_logic;
		  clk: in std_logic;
		  msg2: out std_logic_vector(13 downto 0);
		  twoBE: out std_logic);
end receiver;

architecture char of receiver is
signal data: std_logic_vector(18 downto 0);
signal p1, p2, p3, p4, p5: std_logic;
signal correctMsg: std_logic_vector(13 downto 0);
signal c1, c2, c3, c4, c5: integer;
signal e: integer;
signal errorPos: integer;
begin 
	process(clk)
	begin
		Rx <= '1';
		if rising_edge(clk) then
			for k in 0 to 18 loop
				data(k) <= cereal;
			end loop;
		end if;
				Rx <= '0';
				p1 <= data(2) or data(4) or data(6) or data(8) or data(10) or data(12) or data(16) or data(18);
				p2 <= data(2) or data(5) or data(6) or data(9) or data(10) or data(13) or data(14) or data(17) or data(18);
				p3 <= data(4) or data(5) or data(6) or data(11) or data(12) or data(13) or data(14);
				p4 <= data(8) or data(9) or data(10) or data(11) or data(12) or data(13) or data(14);
				p5 <= data(16) or data(17) or data(18);
				if data(0) /= p1 then
					c1 <= 1;
				else 
					c1 <= 0;
				end if;
				
				if data(1) /= p2 then
					c2 <= 2;
				else 
					c2 <= 0;
				end if;
				
				if data(3) /= p3 then
					c2 <= 3;
				else 
					c3 <= 0;
				end if;
			
				if data(7) /= p4 then
					c4 <= 7;
				else 
					c4 <= 0;
				end if;
				
				if data(15) /= p5 then
					c5 <= 15;
				else 
					c5 <= 0;
				end if;
				
				e <= c1 + c2 + c3 + c4 + c5;
				correctMsg(0) <= data(2);
				correctMsg(1) <= data(4);
				correctMsg(2) <= data(5);
				correctMsg(3) <= data(6);
				correctMsg(4) <= data(8);
				correctMsg(5) <= data(9);
				correctMsg(6) <= data(10);
				correctMsg(7) <= data(11);
				correctMsg(8) <= data(12);
				correctMsg(9) <= data(13);
				correctMsg(10) <= data(14);
				correctMsg(11) <= data(16);
				correctMsg(12) <= data(17);
				correctMsg(13) <= data(18);
				
				if e < 19 then
				twoBE <= '0';
				
					if e < 1 then
						msg2(0) <= correctMsg(0);
						msg2(1) <= correctMsg(1);
						msg2(2) <= correctMsg(2);
						msg2(3) <= correctMsg(3);
						msg2(4) <= correctMsg(4);
						msg2(5) <= correctMsg(5);
						msg2(6) <= correctMsg(6);
						msg2(7) <= correctMsg(7);
						msg2(8) <= correctMsg(8);
						msg2(9) <= correctMsg(9);
						msg2(10) <= correctMsg(10);
						msg2(11) <= correctMsg(11);
						msg2(12) <= correctMsg(12);
						msg2(13) <= correctMsg(13);
					else
						for k in 0 to 13 loop
							if k = e then
								msg2(k) <= not data(e);
							else
								msg2(k) <= correctMsg(k);
							end if;
							end loop;
					end if;
					
				elsif e > 19 then 
					twoBE <= '1';
					correctMsg <= "00000000000000";
					msg2 <= correctMsg;
				else
				end if;
	end process;
end char;
				
			
					
					
					
				
			