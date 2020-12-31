<p align="center">
    <img src="https://github.com/Dafeigy/Wireless-Calculator-based-on-2FSK/blob/main/Pic/logo.jpg" alt="logo" width=200 height=200 />
</p>

<h1 align="center">Wireless-Calculator-based-on-2FSK</h1>
<p align="center">
    <em>八里台男子职业技术学院通信原理实验</em>
</p>
<p align="center">
    <a href="https://www.mathworks.com/">
        <img src="https://img.shields.io/badge/Platform-matlab2019b-orange.svg" alt="Platform">
    </a>
    <a href="https://github.com/Dafeigy/Wireless-Calculator-based-on-2FSK">
        <img src="https://img.shields.io/badge/Version-1.00-red.svg" alt="Version">
    </a>
    <a href="https://github.com/Dafeigy/Wireless-Calculator-based-on-2FSK/blob/main/README.md">
        <img src="https://img.shields.io/badge/Readme-Clickhere-yellow.svg" alt="README">
    </a>
    <a href="http://cybercolyce.cn/">
        <img src="https://img.shields.io/badge/Contact-Homepage-brightgreen.svg" alt="Contact">
    </a><p align="center">
    <a href="https://github.com/me-shaon/GLWTPL/blob/master/LICENSE">
        <img src="https://img.shields.io/badge/Build-passing-purple.svg" alt="Build">
    </a>
    <a href="https://github.com/Dafeigy">
        <img src="https://img.shields.io/badge/Contribution-Welcome-blue.svg" alt="contribution">
    </a>
    <a href="https://github.com/me-shaon/GLWTPL/blob/master/LICENSE">
        <img src="https://img.shields.io/badge/License-GLWT-critical.svg" alt="License">
    </a>
</p>



# ❓这是个什么东西

这是**八里台男子职业技术学院**也就是TJU的通信工程专业的实验：**无线计算器。**

利用声音波段作为载波，设计一个基于两台电脑和两个耳麦的无线数据传输系统。

在电脑A上输入一系列命令，对其作编码调制后，通过耳麦传送到电脑B, 电脑B执行命令后将结果返回到电脑A。

# 🔔我要怎么用这个东西

首先你需要先下载并解压这个项目：

![](https://github.com/Dafeigy/Wireless-Calculator-based-on-2FSK/blob/main/Pic/QQ%E6%88%AA%E5%9B%BE20201209213531.png)

如果你的下载速度很慢的话，我在[这里](https://pan.baidu.com/s/1HfDN0fAz598NK8dFCDAhRg)留了一个备用网址，提取码是TJU的建校年份。

所需**硬件**和软件：

* **两台**普通个人电脑；
* 2个~~低质量~~**耳麦**（🎧x2和🎤x2），分别连接到**电脑**上；
* 应用软件：**Matlab** 2019b
* 在**FInal_release**文件夹中的环境两台电脑分别运行**Host**文件和**Receiver**文件。

# 💊文件夹的其他文件是用来干什么的/可以删掉其他文件吗

文件夹的其他文件包含了**Host**和**Receiver**调用的函数文件，以及初始化的一些设置。

如果你**删掉**了其他文件，那么祝贺你，把它们**再重新下载/解压**回来吧。

# 💢你这个能做到什么程度

**“上限很高，下限很低。”**

**理论上**能做到**1分钟完成100条算式**的无线计算。

* **极高的调试性。**通过**Generater.exe**生成存放了算式和结果的两个文件，为后续测试奠定基础。
* **极大的扩展性**。编码方式神秘而幽冥，**可以一次编码、传输N条算式**，**每条算式用“=”来分隔。**
* **极小的误码率**。正确率只有**0%**和**100%**两种情况（确信）
* **极差的抗干扰**。本人用超频过的游戏本运行时会**因为风扇噪音过大**造成传输异常。

# 🔞那你能讲讲你怎么做的吗/老师问我我该怎么回答

**前期知识储备：**

接触过编程（少儿编程也行）、通信原理课程**缺勤率不大于50%**。

主要是你对通信系统的理解，看你对框架熟不熟，是否真正明白每一个部件是做什么的。

**中期框架构建：**

**首先**确定调制方式。综合考虑后选择了2FSK调制解调，原因有二：

* 前人有用这个的经验，部分能参考
* 2FSK能较好听出差别，方便调试

**然后**写出程序框图（我摸了，把ASK改成2FSK就好）：

![](https://github.com/Dafeigy/Wireless-Calculator-based-on-2FSK/blob/main/Pic/QQ%E6%88%AA%E5%9B%BE20201209214603.png)

值得注意的一点是，我用了**非相干**解调，以及**巴克码作为同步帧**。

**同步帧是这个程序的灵魂**，因为它才有高准确率的保证（确信。



接着就是代码实现。matlab很好学，简单上手，只要会几个操作就行了：

* **基本数据类型**的了解、**相互转换的方法**
* **矩阵**的访问、遍历
* 循环、条件判断等**基本的逻辑控制语句**
* 学会**百度/谷歌**



**后期测试调整：**

详情可以看[**开发历程**](https://github.com/Dafeigy/Wireless-Calculator-based-on-2FSK#%E5%BC%80%E5%8F%91%E5%8E%86%E7%A8%8B)，我这里就不写了哈。

*详细版本的我会后续写一个PDF文档。

# 📚开发历程

## 主要框架 ver0.1

* 用随机函数生成噪声进行模拟，构建了第一版本的滤波器。
* 为了节省时间直接把有噪声的文件作为接收端接受的文件而不录音进行接收端处理。参数大部分参考同学的，用的椭圆滤波器，但据说实际测试效果不好（后期打算用巴特沃斯和切比雪夫滤波器试一下）。
**暂时只能接受个位数的加减乘除**，但预留了改进空间。同时对除法的运算**没有进行小数**后的处理。采用2FSK调制，Host为发送端，Receiver是接收端（无噪声情况）接受，noise是叠加噪声情况的接受，test是译码部分。getnum1、getnum2、getopt分别是获取操作数和操作符函数。
## 方案修改 ver0.2
* 给老师看了，老师觉得滤波器问题不大，问题很大的是我。没有看框图就开始检验了，**FSK两个频率的带通滤波器中的1000Hz的做得不OK，2000Hz的还行。**
* **缺少一个包络检波器**，打算这个用LPF来做，具体实现我感觉普通得滤波就可以。问题还有检测、检错、纠错（？）部分老师觉得不对劲，感觉我在口胡他（？）
* 还有一个月的时间。（金工也要一个月我要死啦
## 方案补充 ver0.21
完善了编码和译码部分 可以做**多位数的四则运算**了 
ps 心态记录 2020.11.20
好家伙 已经有同学做出版本答案了 史无前例 一分二十秒百分百正确率 向他借来了接收端的部分参考 发现是增加了BARK作为同步帧 但只是框架 对比了一下发现框架结构差不多
## 方案更新 ver0.3 2020/11/23
请教了下 原来是一起把一百条信息一起编码发出去了 然后我把他的滤波器终于弄到手检验下了发现真不错 我自己的框架也能用 柳暗花明了
## 方案完善&补充 ver0.35 2020/11/24
* 用python写了个算式生成器 并把算式和计算结果保留到文本文档中
* 接收端完善并完成了回发result的部分
## 方案更新 ver 0.90 2020/11/25
* 完成了发送端的回收部分，优化了采样方式
* 框架结构**完全**完成
* 回头测试的时候发现python打包的那个EXE文件没打包好不能运行，后期会更新

## 方案更新 ver0.95 2020/11/27

* Python 部分完成了并打包了 做了点小手段让它不生成除法算式
* 使用“=”作为分隔符，并同时完善了译码方式
* 最近压力很大 课业挺多 我也在想有些事情是否要坚持下去


## 方案完成 ver1.00

* 至此，我宣布**无线计算器**【可验收版本】 完成！后续我会编写一份开发历程和一些想法，希望能帮到看到这里的你。

* 我对这个专业并不感冒，但我希望有些东西能够传承下去。

* 代码已经完善，通过了实测但有几点需要注意：

  ① 需要非常非常安静（风扇噪音不能过大）的环境，我建议用轻薄本而不要用游戏本进行测试。

  ②接收端需要对译码得到的算式长度进行长度规范（理想情况下不需要限定译码长度）

  ③长度的计算方式是$6*(算式个数)-1$


  
## 说明
* 理论上已经完成了全部工作，我留下了一点很微妙的小bug待有缘人修复
* 如果有需要紧急验收的朋友，可以加🛰Koonsoom-联系我（工作号 如果认出来我是谁了烦请保密）

* 说明文档估计要寒假才能完成了  摸了 再见
