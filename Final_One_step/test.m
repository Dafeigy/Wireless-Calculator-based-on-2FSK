result= '77';
disp('开始编码……');   
result = return_encode(result);      %-----------------译码，并加巴克码     
c1 = eNlarGe(result,X)   %-----------------%拓宽基带信号
Modu=CaRreiR(f1,f2,fs,c1);%-----载波 f1，f2，fs,拓宽的基带信号
sound(Modu,fs);%----发射声音