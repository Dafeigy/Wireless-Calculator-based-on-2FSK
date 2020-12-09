fs=32000;  
f1=4000;
f2=2000;
fss=fs/2;
f11=f1-500;%��ͨ
f12=f1+500;
f21=f2-500;%��ͨ
f22=f2+500;
X=100;%�ؿ���ٱ�
N=3;%�Ϳ���
DOWN=160;%�²���
T1=40;%����ʱ��
%------------------�����˲���
bp2000=fir1(44,[f11/fss f12/fss]);
bp1000=fir1(44,[f21/fss f22/fss]);
lpf=fir1(44,160/fss);  %200HZ��ͨ 
%-----------------------------------------------------------------------------------------------------��⿪ʼ  
flag = 0;
while(flag==0)
    voicing = audiorecorder(fs,16,1);
    recordblocking(voicing, 0.5);
    voice = getaudiodata(voicing);
    voice=filter(bp1000,1,voice);
    plot(voice);
    disp('���ڼ�⣬��ʼ�����.....')
    if max(voice) > 0.1
        flag=1;
        disp('�ѽ�ͨ����ʼ������Ϣ��')
    end
end
%-----------------------------------------------------------------------------------------------------������ 
voicing = audiorecorder(fs,16,1);
recordblocking(voicing, T1);
pyr = getaudiodata(voicing);    
p=pyr;
pyr1=p(1:20000,1);%ȡ��һ��,��Ϊ��һ�ΰ����Ϳ���,�ҵ��Ϳ��������ģ�
bark=[1 1 1 1 1 0 0 1 1 0 1 0 1];
[pyr3,~,~,~]=jianbo(bp2000,bp1000,lpf,DOWN,pyr1);
pyr3(pyr3>0)=1;
pyr3(pyr3<=0)=-1;
a1=pyr3;
bark1=[ones(1,5*DOWN) -ones(1,2*DOWN) ones(1,2*DOWN)  -ones(1,DOWN)  ones(1,DOWN) -ones(1,DOWN) ones(1,DOWN)];
a=0;
c=[];
for b=1:length(a1)-13*DOWN
    c(b)=bark1*a1(b:b+13*DOWN-1,1);
end
[~,u]=max(flip(c));
[~,v]=max(c);
u=length(c)+1-u;
z=floor((u+v)*0.5);
pyr666=p(z-DOWN:end,1)';
[a2,~,~,~]=jianbo(bp2000,bp1000,lpf,DOWN,pyr666);
a2=a2(1,1:floor(length(a2)/DOWN)*DOWN);
a2(a2>0)=1;
a2(a2<=0)=-1;
a2=reshape(a2,DOWN,[]);
a3=sum(a2);
a3(a3>0)=1;
a3(a3<0)=0;
b33=baka(a3,2); %------------------------------------------------Ѱ�ҰͿ���
str=fanyi(b33);  
%------------------------------------------------------------------�������
disp(str);
%--------------------------------------------------------------д�õĺ���  
function [pyr1,f3,f2,f1]=jianbo(bp2000,bp1000,lpf,aaaa,pyr)
f10=filter(bp2000,1,pyr);%��ѡȡ2000HZ��Ƶ�ʣ�����0
f20=filter(bp1000,1,pyr);
%ȫ����������а���첨
f1=abs(f10);
f2=abs(f20);
subplot(3,2,1);
plot(f1);
subplot(3,2,2);
plot(f2);
f1=filter(lpf,1,f1);
f2=filter(lpf,1,f2);
%�����о�
subplot(3,2,3);
plot(f1);
subplot(3,2,4);
plot(f2);
pyr1=abs(f2)-abs(f1);
f3=downsample(pyr1,aaaa);
subplot(3,2,5);
plot(f3);
%�²���
subplot(3,2,6);
plot(f3);
end 
 

function [a]=panjue(f3,gate)
f3(f3>gate)=1;
f3(f3<=gate)=0;
a=f3';
end



function[b3]=baka(b,N)
 bark=[1 1 1 1 1 0 0 1 1 0 1 0 1];
 for index=1:length(b)-12
        res_xor=xor(b(index:index+12),bark)
        if(sum(res_xor))<N
            break;
        end
 end
for i=index+13:length(b)-12
        res_xor=xor(b(i:i+12),bark)
        if(sum(res_xor))<N
            break;
        end
end
disp(i);
disp(index);
b3=b(1,index+13:i-11);
end

function [str]=fanyi(b3)

b2=decode(b3',7,4,'hamming/binary');%%��������
b=num2str(b2');

%------------���벢�Ҽ���

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
                    str=[str '('];
                case 1111
                    str=[str ')'];
                otherwise
                    disp('������������');
          end
      end
end
function [F] = yima(LCD_str)
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
        F=[ones(300,1);[1 1 1 1 1 0 0 1 1 0 1 0 1]';b2;zeros(11,1);[1 1 1 1 1 0 0 1 1 0 1 0 1]';];
  end 
function [bittosend_final]= tuokuan(bbbb,N)
        bittosend_final=[];
        for index=1:length(bbbb)
            if bbbb(index)
                bittosend_final=[bittosend_final ones(1,N)];
            else
                bittosend_final=[bittosend_final zeros(1,N)];
            end
        end   
  end
function [modulatedData]= zaibo(f1,f2,fs,c)
t2=1/(fs/f2)/f2:1/(fs/f2)/f2:1/f2;
t1=1/(fs/f1)/f1:1/(fs/f1)/f1:1/f1;                   
carrier1Data_temp=sin(2*pi*f2*t2);
carrier1Data=repmat(carrier1Data_temp,1,10)      
        
carrier2Data_temp=sin(2*pi*f1*t1);
carrier2Data=repmat(carrier2Data_temp,1,10*f1/f2);%�����1����20�����ڵ�0               
modulatedData=[];
for index=1:100:length(c)
    if c(index)==1
        modulatedData=[modulatedData carrier1Data];
    else
        modulatedData=[modulatedData carrier2Data];
    end
end
end


