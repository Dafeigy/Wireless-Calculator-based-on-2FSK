function [F] = eNcoDe(LCD_str)
        n=length(LCD_str); %gȡ���ַ�������
        n1=num2str(n);
        %LCD_str=[n1 LCD_str];   
        bittosend_temp0=char();%����Ӧ���ַ���ɱ��룬ʹ�ú�������      
        for k=1:n;
            switch LCD_str(k)
                case '+'
                    bittosend_temp0=[bittosend_temp0 '0000'];
                case '-'
                    bittosend_temp0=[bittosend_temp0 '0001'];
                case '*'
                    bittosend_temp0=[bittosend_temp0 '0010'];
                case '/'
                    bittosend_temp0=[bittosend_temp0 '0011'];
                case '0'
                    bittosend_temp0=[bittosend_temp0 '0100'];
                case '1'
                    bittosend_temp0=[bittosend_temp0 '0101'];
                case '2'
                    bittosend_temp0=[bittosend_temp0 '0110'];
                case '3'
                    bittosend_temp0=[bittosend_temp0 '0111'];
                case '4'
                    bittosend_temp0=[bittosend_temp0 '1000'];
                case '5'
                    bittosend_temp0=[bittosend_temp0 '1001'];
                case '6'
                    bittosend_temp0=[bittosend_temp0 '1010'];
                case '7'
                    bittosend_temp0=[bittosend_temp0 '1011'];
                case '8'
                    bittosend_temp0=[bittosend_temp0 '1100'];
                case '9'
                    bittosend_temp0=[bittosend_temp0 '1101'];
                case '('
                    bittosend_temp0=[bittosend_temp0 '1110'];
                case ')'
                    bittosend_temp0=[bittosend_temp0 '1111'];
                otherwise
                    disp('������������');
            end
        end
       
        bittosend_temp2=str2num(bittosend_temp0');%���ַ���ת����������
        b2=encode(bittosend_temp2,7,4,'hamming/binary');
        %����ǰ��ı����룬ͬ����Ϳ���
        F=[ones(200,1);[1 1 1 1 1 0 0 1 1 0 1 0 1]';b2;zeros(11,1);[1 1 1 1 1 0 0 1 1 0 1 0 1]';];
  end 