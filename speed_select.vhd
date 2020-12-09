library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity speed_select is
    port(clk : in  std_logic;                        --ϵͳʱ��
		 rst_n: in std_logic;                        --��λ�ź� 
		 clk_bps: out std_logic;                     --��ʱclk_bps�ĸߵ�ƽΪ���ջ��߷�������λ���м������
		 bps_start:in std_logic     --�������ݺ󣬲�����ʱ�������ź�
									--���߿�ʼ��������ʱ��������ʱ�������ź�
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
					cnt<="0000000000000";   --�����ʼ���������
				else
					cnt<=cnt+'1'; --������ʱ�Ӽ�������
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
					clk_bps<='1';   --clk_bps_r�ߵ�ƽΪ��������λ���м�����㣬ͬʱҲ��Ϊ�������ݵ����ݸı��
				else
					clk_bps<='0';   --�����ʼ���������
				end if;
			end if;
		end if;
	end process;
end behav;