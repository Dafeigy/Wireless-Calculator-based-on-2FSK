%%%%%%%%%%%%%%%%%%%%%%%��ȡ��ʽ�ͽ��%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
fid1 = fopen('equal.txt');
tline = fgetl(fid1);
equal="";
while ischar(tline)
%disp(tline);
equal=equal+tline;
tline = fgetl(fid1);
end
fclose(fid1);

result_matrix="";
fid2 = fopen('result.txt');
tline = fgetl(fid2);
while ischar(tline)
%disp(tline);
result_matrix=result_matrix+(tline)+'=';
tline = fgetl(fid2);
end
fclose(fid2);


%%%%%%%%%%%%��ȡ������������String%%%%%%%%%%%%%%%%%%%%%
newstr=split(equal,"=");
res='';
for i=1:(length(newstr)-1)
   res=res+(num2str(eval(newstr(i)))+"=");
end

%%%%%%%%%%%%%%���ؽ���Ա�%%%%%%%%%%%%%%%%%%
backres=split(res,"=");
trueres=split(result_matrix,"=");
mse=length(trueres);
for i=1:length(trueres)-1
    if trueres(i)~=backres(i)
        mse=mse-1;
    end
end
disp(mse);



