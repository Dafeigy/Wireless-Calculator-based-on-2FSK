library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity speed_select is
    port(clk : in  std_logic;                        --系统时钟
		 rst_n: in std_logic;                        --复位信号 
		 clk_bps: out std_logic;                     --此时clk_bps的高电平为接收或者发送数据位的中间采样点
		 bps_start:in std_logic     --接收数据后，波特率时钟启动信号
									--或者开始发送数据时，波特率时钟启动信号
   );
end speed_select;
architecture behav of speed_select is

signal cnt:std_logic_vector(12 downto 0);
constant BPS_PARA:integer:=625;
constant BPS_PARA_2:integer:=312;

begin

   process(clk,rst_n)
   begin
         if (rst_n='0')then
			cnt<="0000000000000";
		else
			if (rising_edge(clk)) then
				if((cnt=BPS_PARA)or(bps_start='0')) then
					cnt<="0000000000000";   --波特率计数器清零
				else
					cnt<=cnt+'1'; --波特率时钟计数启动
				end if;
			end if;
		end if;
	end process;
 
	process(clk,rst_n)
    begin
         if (rst_n='0')then
			clk_bps<='0';
		 else  
			if (rising_edge(clk)) then
				if(cnt=BPS_PARA_2) then
					clk_bps<='1';   --clk_bps_r高电平为接收数据位的中间采样点，同时也作为发送数据的数据改变点
				else
					clk_bps<='0';   --波特率计数器清零
				end if;
			end if;
		end if;
	end process;
end behav;