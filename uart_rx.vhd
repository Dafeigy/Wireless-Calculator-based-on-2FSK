library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity uart_rx is
    port(clk : in  std_logic;                        --ϵͳʱ��
         rst_n: in std_logic;                        --��λ�ź� 
		 rs232_rx: in std_logic;                     --RS232���������ź�
		 clk_bps: in std_logic;                      --��ʱclk_bps�ĸߵ�ƽΪ�������ݵĲ�����
		 bps_start:out std_logic;  					--���յ����ݺ󣬲�����ʱ��ֹͣ
		 rx_data: out std_logic_vector(7 downto 0)  --�������ݼĴ���������ֱ����һ����������
   );
end uart_rx;
architecture behav of uart_rx is
signal    rs232_rx0: std_logic;
signal    rs232_rx1: std_logic;
signal    rs232_rx2: std_logic;
signal    rs232_rx3: std_logic;
signal    neg_rs232_rx:std_logic;
signal    bps_start_r:std_logic;
signal    num:integer;
signal    rx_data_r:std_logic_vector(7 downto 0);  
begin
 
	process(clk,rst_n,bps_start_r)
    begin
		if (rst_n='0')then  --�첽��λ��Ч
			rs232_rx0<='0';
			rs232_rx1<='0';
			rs232_rx2<='0';
			rs232_rx3<='0';
		else
			if(bps_start_r='0') then
				if (rising_edge(clk)) then  --��������λ����
					rs232_rx0<=rs232_rx;
					rs232_rx1<=rs232_rx0;
					rs232_rx2<=rs232_rx1;
					rs232_rx3<=rs232_rx2;
				end if;
			else
				rs232_rx0<='0';
				rs232_rx1<='0';
				rs232_rx2<='0';
				rs232_rx3<='0';			
			end if;
		end if;
		neg_rs232_rx <=rs232_rx3 and rs232_rx2 and not(rs232_rx1)and not(rs232_rx0); 
	end process;
 

	process(clk,rst_n)
    begin
		if (rst_n='0')then   --�첽��λ
			bps_start_r<='0';
		else
			if (rising_edge(clk)) then
				if(neg_rs232_rx='1') then    --���յ�����������rs232_rx���½��ر�־�ź�
					bps_start_r<='1';        --��������׼�����ݽ���
				else 
					if((num= 15) and (clk_bps='1')) then --����������������Ϣ
						bps_start_r<='0';  --���ݽ�����ϣ��ͷŲ����������ź�
					end if;
				end if;
			end if;
		end if;
		bps_start<=bps_start_r;
	end process;
  
	process(clk,rst_n)
    begin
		if (rst_n='0')then   --�첽��λ
			rx_data_r<="00000000";
			rx_data<="00000000";
			num<=0;
		else
			if (rising_edge(clk)) then
				if(clk_bps='1')then
					num<=num+1;
					case num is
						when  1=>rx_data_r(0)<=rs232_rx;--�����0bit
						when  2=>rx_data_r(1)<=rs232_rx;--�����0bit
						when  3=>rx_data_r(2)<=rs232_rx;--�����0bit
						when  4=>rx_data_r(3)<=rs232_rx;--�����0bit
						when  5=>rx_data_r(4)<=rs232_rx;--�����0bit
						when  6=>rx_data_r(5)<=rs232_rx;--�����0bit
						when  7=>rx_data_r(6)<=rs232_rx;--�����0bit
						when  8=>rx_data_r(7)<=rs232_rx;--�����0bit
						when  10=>rx_data<=rx_data_r;
						when  11=>num<=15;
						when  others=>null;
					end case;
					if(num=15) then
						num<=0;
					end if;
				end if;
			end if;
		end if;
	end process;
 
 end behav;