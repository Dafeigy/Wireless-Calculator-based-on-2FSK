operater=[0 0 0 0;
          0 0 0 1;
          0 0 1 0;
          0 0 1 1;];
      
      
BCD=[0 1 0 0;
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

[xt,fs] = audioread('Ca.wav');
data = xt();  %��ȡ

%�����ݱ��浽TXT
fid = fopen('Data.txt','w');
fprintf(fid,'%d\r\n',data);
fclose(fid);
dataFFT = fft(data);
magX = abs(dataFFT);
figure(1);
plot(data);
figure(2);
plot(magX);



Ts = 1/fs;%��������
M = length(data);%��Ƶ�źų���



[b,a]=ellip(5,0.5,60,[500,2500]*2/8000);%��ͨ��Բ�˲������

  bp2000=fir1(24,[0.45 0.55]);
  bp1000=fir1(24,[0.2 0.3]);

  
[pyr,fs]=audioread('Ca.wav');
pyr=filter(b,a,pyr);%��ͨ�˲���500hz-2500hz��

f1=filter(bp2000,1,pyr);%��ѡȡ2000HZ��Ƶ�ʣ�����0
f2=filter(bp1000,1,pyr);

f3=(abs(f2)-abs(f1));
figure(5);
pin=fft(f3);
f3=downsample(f3,80);
plot(f3);
len=length(f3);
a=[];
 for i=0:(len-1)
     if f3(i+1)>0
     a(i+1)=1 ;   
     else
     a(i+1)=0;
     end
 end  
 
 disp(a);


