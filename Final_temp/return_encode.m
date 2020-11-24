function [emit_result] = return_encode(result)
n=length(result); %g取得字符串长度
        bittosend_temp0=char();%将对应的字符变成编码，使用汉明编码      
        for k=1:n;
            switch result(k)
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
                case '.'
                    bittosend_temp0=[bittosend_temp0 '1110'];
                case '?'
                    bittosend_temp0=[bittosend_temp0 '1111'];
                otherwise
                    disp('输入数据有误');
            end
        end
       
        bittosend_temp2=str2num(bittosend_temp0');%将字符串转换成数字型
        b2=encode(bittosend_temp2,7,4,'hamming/binary');
        %增加前面的保护码，同步吗巴克码
        emit_result=[ones(200,1);[1 1 1 1 1 0 0 1 1 0 1 0 1]';b2;zeros(11,1);[1 1 1 1 1 0 0 1 1 0 1 0 1]';];
  end 