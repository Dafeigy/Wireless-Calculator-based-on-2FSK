import numpy as np
sgn=['+','-','*']
num=int(input("输入要生成算式的个数：\n"))
dir=input("输入保存路径,不要放到硬盘根目录下面！\n")
result=[]
equal=[]
while True:
    sgn_lindex=np.random.randint(0, 3)#运算符下标
    a=np.random.randint(1,101)
    b=np.random.randint(1,101)
    str1=str(a)+sgn[sgn_lindex]+str(b) #生成便于表达式计算的字符串
    str2=str(a)+sgn[sgn_lindex]+str(b)+"="  #生成数学表达字符串
    res=eval(str1)#计算表达式


    if res>=0:#判断算式结果是否为正数 因为我不想编码编负数了55
        num=num-1
        equal.append(str2)
        result.append(str(res))
    if num==0:
        break
file=open(dir+r"\equal.txt","w")#算式保存路径
for each in equal:
    file.write(each+'\n')
file.close()
file2=open(dir+r"\result.txt","w")#结果保存路径
for each in result:
    file2.write(each+'\n')
file2.close()
