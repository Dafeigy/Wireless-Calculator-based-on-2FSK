function [str]=TransCal(b3)

b2=decode(b3',7,4,'hamming/binary');%%汉明解码
b=num2str(b2');

%------------翻译并且计算
      str1=char();
      str=[]
      for k=1:length(b);
          str1=strcat(str1,num2str(b(k)));
      end
      disp(str1);
      for l=1:4:length(str1)-4;
          num=str2num(str1(l:l+3));
          switch num
                case 0000
                    str=[str '+'];
                case 0001
                    str=[str '-'];
                case 0010
                    str=[str '*'];
                case 0011
                    str=[str '/'];
                case 0100
                    str=[str '0'];
                case 0101
                    str=[str '1'];
                case 0110
                    str=[str '2'];
                case 0111
                    str=[str '3'];
                case 1000
                    str=[str '4'];
                case 1001
                    str=[str '5'];
                case 1010
                    str=[str '6'];
                case 1011
                    str=[str '7'];
                case 1100
                    str=[str '8'];
                case 1101
                    str=[str '9'];
                case 1110
                    str=[str '.'];
                otherwise
                    disp('输入数据有误');
          end
      end
end