function op2=getnum2(b,optnum)
op2=[];
for i =optnum:size(b,1)
    if (b(i,:)) == [0 1 0 0]
        op2=[op2,0];
    end
    if (b(i,:)) == [0 1 0 1]
        op2=[op2,1];
    end
    if (b(i,:)) == [0 1 1 0]
        op2=[op2,2];
    end
    if (b(i,:)) == [0 1 1 1]
        op2=[op2,3];
    end
    if (b(i,:)) == [1 0 0 0]
        op2=[op2,4];
    end
    if (b(i,:)) == [1 0 0 1]
        op2=[op2,5];
    end
    if (b(i,:)) == [1 0 1 0]
        op2=[op2,6];
    end
    if (b(i,:)) == [1 0 1 1]
        op2=[op2,7];
    end
    if (b(i,:)) == [1 1 0 0]
        op2=[op2,8];
    end
    if (b(i,:)) == [1 1 0 1]
        op2=[op2,9];
    end
end