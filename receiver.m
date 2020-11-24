operater=[
    0 0 0 0;
    0 0 0 1;
    0 0 1 0;
    0 0 1 1;
    ];         
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
bark1=[ones(1,5*DOWN) -ones(1,2*DOWN) ones(1,2*DOWN)  -ones(1,DOWN)  ones(1,DOWN) -ones(1,DOWN) ones(1,DOWN)];
fs=32000;  
f1=4000;
f2=2000;
fss=fs/2;
f11=f1-500;%带通
f12=f1+500;
f21=f2-500;%带通
f22=f2+500;
X=100;%拓宽多少倍
DOWN=160;%下采样
T1=20;%采样时间
%------------------构建滤波器
bp2000=fir1(44,[f11/fss f12/fss]);
bp1000=fir1(44,[f21/fss f22/fss]);
lpf=fir1(44,160/fss);  %200HZ低通 
%%%%%%%%%waiting for signal%%%%%%%%%%%%%%%
while(True)
    voicing = audiorecorder(fs,16,1);
    recordblocking(voicing, 0.5);
    voice = getaudiodata(voicing);
    voice=filter(bp1000,1,voice);
    plot(voice);
    disp('Detecting for siganl......')
    if max(voice) > 0.2
        disp('Signal found,Processing...')
        break
    end
end
%%%%%%%%%%%%%%%%%%%%%RAW_DATA%%%%%%%%%%%%%%%%%%%%%
Truevoice = audiorecorder(fs,16,1);
recordblocking(Truevoice, T1);
pyr = getaudiodata(Truevoice);    
p=pyr;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pyr1=p(1:20000,1);%取出一段,认为这一段包含巴克码,找到巴克码大概在哪；
bark=[1 1 1 1 1 0 0 1 1 0 1 0 1];
[pyr3,~,~,~]=jianbo(bp2000,bp1000,lpf,DOWN,pyr1);
pyr3(pyr3>0)=1;
pyr3(pyr3<=0)=-1;
a1=pyr3;
a=0;
c=[];
for b=1:length(a1)-13*DOWN
    c(b)=bark1*a1(b:b+13*DOWN-1,1);
end
[~,u]=max(flip(c));
[~,v]=max(c);
u=length(c)+1-u;
z=floor((u+v)*0.5);
%----------------------------------------------------------------算出帧同步点在哪
pyr666=p(z-DOWN:end,1)';
[a2,~,~,~]=jianbo(bp2000,bp1000,lpf,DOWN,pyr666);
a2=a2(1,1:floor(length(a2)/DOWN)*DOWN);
a2(a2>0)=1;
a2(a2<=0)=-1;
a2=reshape(a2,DOWN,[]);
a3=sum(a2);
a3(a3>0)=1;
a3(a3<0)=0;%------利用收到的160次，都利用了进行运算；
b33=baka(a3,2); %------------------------------------------------寻找巴克码
str=fanyi(b33);  
%------------------------------------------------------------------解码结束
disp(str);
temp=eval(str);
result=num2str(temp);
disp(result);


