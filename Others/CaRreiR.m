function [modulatedData]= CaRreiR(f1,f2,fs,c)
t2=1/(fs/f2)/f2:1/(fs/f2)/f2:1/f2;
t1=1/(fs/f1)/f1:1/(fs/f1)/f1:1/f1;                   
carrier1Data_temp=sin(2*pi*f2*t2);
carrier1Data=repmat(carrier1Data_temp,1,10)      
        
carrier2Data_temp=sin(2*pi*f1*t1);
carrier2Data=repmat(carrier2Data_temp,1,10*f1/f2);%如果是1发射20个周期的0               
modulatedData=[];
for index=1:100:length(c)
    if c(index)==1
        modulatedData=[modulatedData carrier1Data];
    else
        modulatedData=[modulatedData carrier2Data];
    end
end
end