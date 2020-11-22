fs=8000;
[xt,fs] = audioread('Ca.wav');
data = xt();  %截取
%将数据保存到TXT
fid = fopen('myData.txt','w');
fprintf(fid,'%d\r\n',data);
fclose(fid);

dataFFT = fft(data);
magX = abs(dataFFT);
figure(1);%%%%原来的声音时域%%%%%%
plot(data)
title('原来的声音时域');
figure(2);%%%%%%原来的声音频域%%%%%%%%%%%%%
plot(magX);
title('原来的声音频域')

Ts = 1/fs;%采样周期
M = length(data);%音频信号长度
%%%%%%%%%%%%%%%%%%%%%%%%%%%噪声产生%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m = 0:M-1;
sigma = mean(data.*data);%噪声方差
v = sqrt(sigma)*randn([M,1]);%噪声生成
x = data+v;%受宽带噪声干扰的音频信号
audiowrite('noise.wav',x,fs);

f=[0:M/2]*fs/M;
X = fft(x);
magX1 = abs(X);%受噪声污染音频信号的频谱
figure(3);%%%%%%%加上噪声的时域图%%%%%%%%%%
plot(x);
title('加上噪声的时域图');
figure(4);
plot(magX1);%%%%%%%%%%%%加上噪声的频域%%%%%%%%%%%%
title('加上噪声的频域');


[b,a]=ellip(10,0.5,60,[500,2500]*2/8000);%带通椭圆滤波器设计

  bp2000=fir1(25,[0.45 0.55]);
  bp1000=fir1(25,[0.25 0.3]);
  
  [pyr,fs]=audioread('noise.wav');
  pyr=filter(b,a,pyr);%带通滤波（500hz-2500hz）

f1=filter(bp2000,1,pyr);%仅选取2000HZ的频率，代表0
f2=filter(bp1000,1,pyr);

f3=(abs(f2)-abs(f1));



f3=downsample(f3,80);
figure(5);
plot(f3);
title('滤波结果')

len=length(f3);
a=[];
 for i=0:(len-1)
     if f3(i+1)>-0
     a(i+1)=1 ;   
     else
     a(i+1)=0;
     end
 end  
 
 
 %%%%%%%%%%%%%接受码元转成标准字符串%%%%%%%%%%%%%%%%%
 for i=1:length(a)
if i==1
b=num2str(a(i));
else
b=[b,num2str(a(i))];
end
end

 
%%%%%%%%%%%%%%%%%%筛选%%%%%%%%%%%%%%%%%%%%%%%%%%

 s=extractBetween(b,'111111111111111111100110101','0000011111');
 s=s';
j=1;
for i=1:length(s)
    smat=cell2mat(s(i));
    snum=str2double(smat);
    snumm(j)=snum;
    j=j+1;
end
leng=length(smat);
b=double(smat);
for i=1:leng
b(i)=str2num(char(b(i)));
end
b=reshape(b,[4,length(b)/4]);
b=b';
%%%%%%%%%%%%%%%获取操作数以及操作方式%%%%%%%%%%%%%%%%%%%%
opt=getopt(b)
op1=getnum1(b,k)
op2=getnum2(b,k)

%%%%%%%%%%%%%操作结果的计算%%%%%%%%%%%%%%%%%%%%%%%
if opt==1
    result=op1+op2；
end
if opt ==2
    result=op1-op2；
end
if opt==3
    result=op1*op2；
end
if opt==4
    resullt=op1/op2；
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
result=int2str(result)


