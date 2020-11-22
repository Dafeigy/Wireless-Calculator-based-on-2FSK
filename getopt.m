function optnum=getopt(b)

for k=1:size(b,1)
    if (b(k,:)) == [0 0 0 0] 
        optnum=1;
        disp('+');     
    end
    if (b(k,:)) == [0 0 0 1] 
        optnum=2;
        disp('-');  
    end
    if (b(k,:)) == [0 0 1 0] 
        optnum=3;
        disp('*');
    end
    if (b(k,:)) == [0 0 1 1] 
        optnum=4;
        disp('/');
    end
end