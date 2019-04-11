# IsoplotRserver
All needed to build a IsoplotR server. 搭建 IsoplotR 服务器所需内容
# IsoplotRgui

这个项目是 **IsoplotR** 这一软件的服务器项目. **IsoplotR** 是一个自由的开源软件,用于同位素地球化学和地质年代学数据处理,由[Pieter Vermeesch](http://ucl.ac.uk/~ucfbpve)开发, 是对 Kenneth Ludwig 当年所开发的 Excel 插件 **Isoplot** 的替代品. 


## 下载安装好 IsoplotRserver/Gui 的虚拟机

用户名 : isoplotr
密码 : isoplotr

[百度网盘 提取码：ov1r ](https://pan.baidu.com/s/1sAIgA9WT3z-aHrb2LMG6Ww)

[微软云盘](https://1drv.ms/f/s!AnIw_Lqr4g5tgTlWR0P4WgjYwef8)

## Ubuntu 18.04 server/desktop 下的安装指南

你首先需要在电脑里安装好**R**(参考
[http://r-project.org](http://r-project.org)). 而且推荐你安装最新版本的.

这就需要你在终端内运行下面的代码先导入密钥:
```Bash
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
```

导入了上面的密钥之后, 你需要编辑源列表, 用编辑器(下面以nano为例)来添加新的源:
```Bash
nano /etc/apt/sources.list
```
上面的命令是运行nano编辑器打开源列表文件, 然后在最上面粘贴上下面的代码:
```Bash
# add bionic R3.5
deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/
```

以nano为例, Ctrl+O保存, Ctrl+X退出.

退出了之后要更新一下列表:

```Bash
sudo apt update
```

然后就要安装R语言和一些重要的依赖包了(这里要注意一定要安装第二行的那些依赖包,否则后续的devtool没发成功安装):
```Bash
sudo apt install r-base r-base-dev
sudo apt install build-essential libcurl4-gnutls-dev libxml2-dev libssl-dev gdebi git
```
上面的基础包安装完了之后, 就需要安装 **devtools** 包,这样才能从 Github 来安装 IsoplotRgui 在内的各种软件.
这里你需要运行下面的命令来安装 devtools (注意这里是在终端调用R来运行的, 不用去进入R就可以, 这样安装的包所有用户都能用,用来构建服务器必须这样安装):

```Bash
sudo su - -c "R -e \"install.packages('devtools',repos='http://cran.rstudio.com/')\""
```


安装完了devtool 之后, 就要安装 shiny 1.2.0 版本, 目前最新版本的 shiny 和IsoplotRgui以及IsoplotR的服务器也不兼容,必须用下面这行代码所指定的1.2.0版本才可以
```Bash
#sudo su - -c "R -e \"install.packages('shiny',repos='http://cran.rstudio.com/')\""
#sudo su - -c "R -e \"devtools::install_github('rstudio/shiny',force=TRUE)\""
#上面这两行是安装最新版 shiny 用的命令, 现在不兼容
sudo su - -c "R -e \"devtools::install_version('shiny',version = '1.2.0', repos = 'http://cran.rstudio.com/')\""
```

上面的两个项目安装完毕之后,就是要安装IsoplotR以及IsoplotRgui了:
```Bash
sudo su - -c "R -e \"devtools::install_github('pvermees/IsoplotR',force=TRUE)\""
sudo su - -c "R -e \"devtools::install_github('pvermees/IsoplotRgui',force=TRUE)\""
```

## 安装 Shiny Server

首先,你需要安装 gdebi 以及 wget:
```Bash
sudo apt install gdebi-core wget
```

然后,用 wget 来下载 rstudio server 以及 shiny server 的安装包,然后用 gdebi 来安装:
```Bash
wget https://download2.rstudio.org/rstudio-server-1.0.136-amd64.deb
sudo gdebi rstudio-server-1.0.136-amd64.deb
wget https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.9.923-amd64.deb
sudo gdebi shiny-server-1.5.9.923-amd64.deb
```

## 搭建服务器


在终端中输入下面的命令来将IsoplotR服务器构建所需的内容同步到你的机器上:

```Bash
git clone https://github.com/chinageology/IsoplotRserver
```

然后进入到IsoplotRserver这个目录中, 将该目录下的 IsoplotRshiny 这个目录整个复制到 /srv/shiny-server/ 目录下:

```Bash
cd IsoplotRserver
cp -R IsoplotRshiny /srv/shiny-server/
```

然后访问你的服务器ip加上3838端口下的 IsoplotRshiny 目录.

假如你的域名是 fake.com
你就可以访问:  http://fake.com:3838/IsoplotRshiny/R/

或者你也可以用你机器上的ip来访问, 比如你的地址是 10.10.10.10
那就可以访问: http://10.10.10.10:3838/IsoplotRshiny/R/

如果你安装不成功又着急用, 可以使用志愿者们搭建提供的服务器:

[http://isoplotr.london-geochron.com](http://ucl.ac.uk/~ucfbpve/isoplotr)

## 更多信息

请参考 [http://isoplotr.london-geochron.com](http://ucl.ac.uk/~ucfbpve/isoplotrlnnn)

## 作者

[Pieter Vermeesch](http://ucl.ac.uk/~ucfbpve)

###### 中文翻译  [CycleUser](https://www.zhihu.com/people/cycleuser/columns)

## 授权协议

本项目使用 GPL-3 协议.
