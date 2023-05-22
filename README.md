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

## 更新
好多人来问，但是我已经忘了代码写的什么了。等放假了出个重制版吧。
