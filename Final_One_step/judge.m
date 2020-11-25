function [a]=judge(f3,gate)
len=length(f3);
a=[];
 for i=0:(len-1)
     if f3(i+1)>gate
     a(i+1)=1    
     else
     a(i+1)=0
     end
 end
end