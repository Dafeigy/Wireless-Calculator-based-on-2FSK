%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%��ʽ����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
equal='77-70';%Later I will change a more convenient way to load the equation

fs=32000;  
f1=4000;
f2=2000;
fss=fs/2;
f11=f1-500;%��ͨ
f12=f1+500;
f21=f2-500;%��ͨ
f22=f2+500;
X=100;%�ؿ���
DOWN=160;%�²���
T1=20;%����ʱ��


%��%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%��������%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This part is for basic encode and haming encode with BARK
% 
% disp('��ʽ�����ı���')
% disp(emit_temp0);
emit_final=eNcoDe(equal)
disp(emit_final);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%��������ơ�װ�ء�����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
final_emit=eNlarGe(emit_final,X);
Modulatedata=CaRreiR(f1,f2,fs,final_emit);
sound(Modulatedata,fs);
pause(10);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%Till now all the emition part is finished%%%%%%%%%%%%%%%%%%%%%%%%



