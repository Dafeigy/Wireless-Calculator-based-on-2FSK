function[b3]=BARK(b,N)
 bark=[1 1 1 1 1 0 0 1 1 0 1 0 1];
 for index=1:length(b)-12
        res_xor=xor(b(index:index+12),bark)
        if(sum(res_xor))<N
            break;
        end
 end
for i=index+13:length(b)-12
        res_xor=xor(b(i:i+12),bark)
        if(sum(res_xor))<N
            break;
        end
end
disp(i);
disp(index);
b3=b(1,index+13:i-11);
end