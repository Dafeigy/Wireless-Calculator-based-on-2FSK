clear all
operater=[
0 0 0 0;
0 0 0 1;
0 0 1 0;
0 0 1 1;];
      
BCD=[
0 1 0 0;
0 1 0 1;
0 1 1 0;
0 1 1 1;
1 0 0 0;
1 0 0 1;
1 0 1 0;
1 0 1 1;
1 1 0 0;
1 1 0 1; 
];
equal=input('输入算式？','s');
len=length(equal);
i=1;
while (equal(i)~='+' && equal(i)~='-' && equal(i)~='*' && equal(i)~='/' )
    i=i+1;
end
n=i;% location of operater
num1len=n-1;%num1长度
num2len=len-n;%num2长度

num1=equal(1:n-1);
num_1=[];
for i=1:num1len
    temp=str2double(num1(i));
    codetemp=BCD((temp+1),:);
    num_1=[num_1,codetemp];
end
num2=equal(n+1:len);
num_2=[];
for i=1:num2len
    temp=str2double(num2(i));
    codetemp=BCD((temp+1),:);
    num_2=[num_2,codetemp];
end

operatenum=equal(n);
if operatenum =='+'
    k=1;
end
if operatenum =='-'
    k=2;
end
if operatenum =='*'
    k=3;
end
if operatenum =='/'
    k=4;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%编码整合%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
emit_temp0=[num_1,operater(k,:),num_2];
disp('算式基本的编码')
disp(emit_temp0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%增加标示码%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
emit_temp=[ones(1,14),[1 1 1 1 1 0 0 1 1 0 1 0 1],emit_temp0,[0 0 0 0 0],[1 1 1 1 1 0 0 1 1 0 1 0 1]];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('最终发射编码：');
disp(emit_temp);
final_temp=[];


%%%%%%%%%%%%%%%%%%%编码扩宽100倍%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for index=1:length(emit_temp)
            if emit_temp(index)
                final_temp=[final_temp ones(1,100)];
            else
                final_temp=[final_temp zeros(1,100)];
            end
end






f2=1000;%1000HZ对应1
f1=2000;%0
fs=8000;
t2=1/fs:1/fs:1/f2;
t1=1/fs:1/fs:1/f1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%扩宽%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
carrier1Data_temp=sin(2*pi*f2*t2);
carrier1Data=repmat(carrier1Data_temp,1,10);

carrier2Data_temp=sin(2*pi*f1*t1);
carrier2Data=repmat(carrier2Data_temp,1,20);

modulatedData=[];

for index=1:100:length(final_temp)
    if final_temp(index)==1
        modulatedData=[modulatedData carrier1Data];
    else
        modulatedData=[modulatedData carrier2Data];
    end
end

audiowrite('Ca.wav',modulatedData,fs);
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
plot(abs(fft(data)));
title('原来的声音时域');
sound(modulatedData,fs);




