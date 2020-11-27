
[b,a]=ellip(10,0.5,60,[500,2500]*2/8000);%��ͨ��Բ�˲������

  bp2000=fir1(25,[0.45 0.55]);
  bp1000=fir1(25,[0.25 0.3]);
  
  [pyr,fs]=audioread('noise.wav');
  pyr=filter(b,a,pyr);%��ͨ�˲���500hz-2500hz��

f1=filter(bp2000,1,pyr);%��ѡȡ2000HZ��Ƶ�ʣ�����0
f2=filter(bp1000,1,pyr);

f3=(abs(f2)-abs(f1));
figure(4);
plot(f3);
figure(5);
plot(abs(fft(f3)));


f3=downsample(f3,80);
figure(5);
plot(f3);
title('�˲����')

len=length(f3);
a=[];
 for i=0:(len-1)
     if f3(i+1)>-0
     a(i+1)=1 ;   
     else
     a(i+1)=0;
     end
 end  
 
 
 %%%%%%%%%%%%%������Ԫת�ɱ�׼�ַ���%%%%%%%%%%%%%%%%%
 for i=1:length(a)
if i==1
b=num2str(a(i));
else
b=[b,num2str(a(i))];
end
end

 
%%%%%%%%%%%%%%%%%%ɸѡ%%%%%%%%%%%%%%%%%%%%%%%%%%

 s=extractBetween(b,'111111111111111111100110101','0000011111');
 v=s';
j=1;
smat=[];
for i=1:length(v)
    smat=cell2mat(v(i))
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
%%%%%%%%%%%%%%%��ȡ�������Լ�������ʽ%%%%%%%%%%%%%%%%%%%%
k=1;
for k=1:size(b,1)
    if (b(k,:)) == [0 0 0 0] 
        optnum=1;
        optloc=k;
        disp('+');     
    end
    if (b(k,:)) == [0 0 0 1] 
        optnum=2;
        optloc=k;
        disp('-');  
    end
    if (b(k,:)) == [0 0 1 0] 
        optnum=3;
        optloc=k;
        disp('*');
    end
    if (b(k,:)) == [0 0 1 1] 
        optnum=4;
        optloc=k;
        disp('/');
    end
end
op1_matrix=getnum1(b,optloc);
i=length(op1_matrix);
op1=0;
while i~=0
    op1=op1+op1_matrix(i)*10^(length(op1_matrix)-i);
    i=i-1;
end

op2_matrix=getnum2(b,optloc);
i=length(op2_matrix);
op2=0;
while i~=0
    op2=op2+op2_matrix(i)*10^(length(op2_matrix)-i);
    i=i-1;
end

%%%%%%%%%%%%%��������ļ���%%%%%%%%%%%%%%%%%%%%%%%
if optnum==1
    result=op1+op2;
end
if optnum==2
    result=op1-op2;
end
if optnum==3
    result=op1*op2;
end
if optnum==4
    resullt=fix(op1/op2);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
result=int2str(result)
clear all;