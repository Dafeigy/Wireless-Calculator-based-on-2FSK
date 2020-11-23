%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%算式输入%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
equal='9877-77';

fs=32000;  
f1=4000;
f2=2000;
fss=fs/2;
f11=f1-500;%带通
f12=f1+500;
f21=f2-500;%带通
f22=f2+500;
X=100;%拓宽倍率
N=3;%巴克码
DOWN=160;%下采样
T1=20;%采样时间


%￥%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%编码整合%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This part is for basic encode and haming encode with BARK
% 
% disp('算式基本的编码')
% disp(emit_temp0);
emit_final=eNcoDe(equal)
disp(emit_final);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%扩宽与调制%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
final_emit=eNlarGe(emit_final,X);
Modulatedata=CaRreiR(f1,f2,fs,final_emit);
sound(Modulatedata,fs);



