fs=32000;  
f1=4000;
f2=2000;
fss=fs/2;
f11=f1-500;%��ͨ
f12=f1+500;
f21=f2-500;%��ͨ
f22=f2+500;
X=100;%�ؿ���ٱ�
DOWN=160;%�²���
T1=8;%����ʱ��
bark=[1 1 1 1 1 0 0 1 1 0 1 0 1];
bark1=[ones(1,5*DOWN) -ones(1,2*DOWN) ones(1,2*DOWN)  -ones(1,DOWN)  ones(1,DOWN) -ones(1,DOWN) ones(1,DOWN)];
%------------------�����˲���
bp2000=fir1(44,[f11/fss f12/fss]);
bp1000=fir1(44,[f21/fss f22/fss]);
lpf=fir1(44,160/fss); 
while(1)
    voice_temp = audiorecorder(fs,16,1);
    recordblocking(voice_temp, 0.5);
    voice = getaudiodata(voice_temp);
    voice=filter(bp1000,1,voice);
    plot(voice);
    disp('Detecting...')
    if max(voice) > 0.2
        disp('Signal Found,Processing...')
        break;
    end
end
Truevoice=audiorecorder(fs,16,1);
recordblocking(Truevoice, T1);
pyr = getaudiodata(Truevoice);    
p=pyr;
%----------------------------------------------------------------------------%�Ҷ԰Ϳ����ڵ��ǶΣ���žͿ�����
pyr1=p(1:20000,1);%ȡ��һ��,��Ϊ��һ�ΰ����Ϳ���,�ҵ��Ϳ��������ģ�
[pyr3,~,~,~]=evlop(bp2000,bp1000,lpf,DOWN,pyr1);
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
%----------------------------------------------------------------���֡ͬ��������
pyr666=p(z-DOWN:end,1)';
[a2,~,~,~]=evlop(bp2000,bp1000,lpf,DOWN,pyr666);
a2=a2(1,1:floor(length(a2)/DOWN)*DOWN);
a2(a2>0)=1;
a2(a2<=0)=-1;
a2=reshape(a2,DOWN,[]);
a3=sum(a2);
a3(a3>0)=1;
a3(a3<0)=0;%------�����յ���160�Σ��������˽������㣻 
b33=BARK(a3,2); %------------------------------------------------Ѱ�ҰͿ���
equal=TransCal(b33);  
%------------------------------------------------------------------�������
disp(equal);
equal=equal(1:17);
disp(equal);
newstr=split(equal,"=");
res='';
for i=1:(length(newstr))
   res=[res,(num2str(eval(cell2mat(newstr(i)))+"="))];
end
result=num2str(res); 
disp(result);
disp('��ʼ���롭��');   
 %---------------------------------------------------------------------
result = return_encode(result);      %-----------------���룬���ӰͿ���     
c1 = eNlarGe(result,X) ;  %-----------------%�ؿ�����ź�
Modu=CaRreiR(f1,f2,fs,c1);%-----�ز� f1��f2��fs,�ؿ�Ļ����ź�
sound(Modu,fs);%----��������
