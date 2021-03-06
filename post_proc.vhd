-- Project Mufas RGH Code for Matrix/Coolrunner
-- 15432, Octal450

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.STD_LOGIC_UNSIGNED.all;

-- main module

entity post_proc is
	Port (
		POST : in STD_LOGIC;
		CLK : in STD_LOGIC;
		CLK_D : in STD_LOGIC;
		SLOW : out STD_LOGIC := '0';
		DBG : out STD_LOGIC := '0';
		RST : inout STD_LOGIC := 'Z'
	);
end post_proc;

architecture arch of post_proc is

constant R_LEN : integer := 1;
constant R_END : integer := 34721; -- Trinity 192MHz: 34721 and Corona 192MHz: 32710, Untested: Trinity 200MHz: 36167 and Corona 200MHz: 34073
constant T_END : integer := 40000;
constant S_DEL : integer := 490; -- Trinity: 490, Corona: 460

constant post_rgh : integer := 11;
constant post_max : integer := 15;
signal cnt : integer range 0 to T_END := 0;
signal stop : STD_LOGIC := '0';
signal post_cnt : integer range 0 to post_max := 0;
signal del_cnt : integer range 0 to S_DEL := 0;
signal to_slow : STD_LOGIC := '0';

begin

-- post limit
process (post_cnt) is
begin
	stop <= to_unsigned(post_cnt,4)(3) and to_unsigned(post_cnt,4)(2);
end process;

-- post counter
process (POST) is
begin
	if (POST'event) then
		if (RST = '1') then
			if (stop = '0') then
				post_cnt <= post_cnt + 1;
			end if;
		else
			post_cnt <= 0;
		end if;
	end if;
	
	DBG <= POST;
end process;

-- timing counter + reset
process (CLK) is
begin
	if (CLK'event) then -- 192 MHz (48 MHz Quartz, with clk_doubler module before CLK) or 200 MHz (100 MHz Quartz, no clk_doubler module)
		if (post_cnt = post_rgh) then
			if (cnt < T_END) then
				cnt <= cnt + 1;
			end if;
		else
			cnt <= 0;
		end if;
		
		if (cnt >= R_END - R_LEN and cnt < R_END) then
			RST <= '0';
		else
			RST <= 'Z';
		end if;
	end if;
end process;

-- slowdown
process (post_cnt) is
begin
	if (post_cnt = post_rgh - 1) then
		to_slow <= '1';
	else
		to_slow <= '0';
	end if;
end process;

-- delayer
process (to_slow, CLK_D) is
begin
	if (to_slow = '0') then
		SLOW <= '0';
		del_cnt <= 0;
	else
		if (rising_edge(CLK_D)) then
			if (del_cnt < S_DEL) then
				del_cnt <= del_cnt + 1;
				SLOW <= '0';
			else
				SLOW <= '1';
			end if;
		end if;
	end if;
end process;

end arch;
