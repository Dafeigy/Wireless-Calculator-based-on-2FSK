function op1=getnum1(b,optnum)
op1=[];
for i =1:optnum-1
    if (b(i,:)) == [0 1 0 0]
        op1=[op1,0];
    end
    if (b(i,:)) == [0 1 0 1]
        op1=[op1,1];
    end
    if (b(i,:)) == [0 1 1 0]
        op1=[op1,2];
    end
    if (b(i,:)) == [0 1 1 1]
        op1=[op1,3];
    end
    if (b(i,:)) == [1 0 0 0]
        op1=[op1,4];
    end
    if (b(i,:)) == [1 0 0 1]
        op1=[op1,5];
    end
    if (b(i,:)) == [1 0 1 0]
        op1=[op1,6];
    end
    if (b(i,:)) == [1 0 1 1]
        op1=[op1,7];
    end
    if (b(i,:)) == [1 1 0 0]
        op1=[op1,8];
    end
    if (b(i,:)) == [1 1 0 1]
        op1=[op1,9];
    end
end