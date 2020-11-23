function [F] = eNcoDe(equal)
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
operater=[
0 0 0 0;
0 0 0 1;
0 0 1 0;
0 0 1 1;];
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
emit_0=[num_1,operater(k,:),num_2];
bittosend_temp2=(emit_0');%将字符串转换成数字型
b2=encode(bittosend_temp2,7,4,'hamming/binary');
%增加前面的保护码，同步吗巴克码
F=[ones(200,1);[1 1 1 1 1 0 0 1 1 0 1 0 1]';b2;zeros(11,1);[1 1 1 1 1 0 0 1 1 0 1 0 1]';];
end 