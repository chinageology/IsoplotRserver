# IsoplotRserver

All needed to build a IsoplotR server. 搭建 IsoplotR 服务器所需内容

[本文档中文原版](https://github.com/chinageology/IsoplotRserver/blob/master/README_CN.md)

# IsoplotRgui

This repo is the steps fo building a server of **IsoplotR**. **IsoplotR** is writen by [Pieter Vermeesch](http://ucl.ac.uk/~ucfbpve).

# Download A Packed up Virtual Machine wtih IsoplotRserver/Gui built inside

Username : isoplotr
Password : isoplotr

[Baiduyun Code：96zh](https://pan.baidu.com/s/1KCtrPNnYjFlS5AIFcZq1pg)

[Onedrive](https://1drv.ms/f/s!AnIw_Lqr4g5tgTlWR0P4WgjYwef8)

# For Docker User

```Bash
docker run -t -i -p 3838:3838  chinageology/isoplotrserver
sh /etc/init.d/update
shiny-server
```

For example, the IP of your docker conatiner is 10.10.10.10, then you can visit 10.10.10.10:3838/ to use isoplotr.

# For Ubuntu 18.04 server ONLY

Install **R**(
[http://r-project.org](http://r-project.org)) fisrt.
You need version 3.5.3.

Import the key in your terminal:

```Bash
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
```

Then edit your sources.list:

```Bash
nano /etc/apt/sources.list
```

Add the R 3.5.3 source for Ubuntu 18.04:

```Bash
# add bionic R3.5
deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/
```

Save the change and apt update:

```Bash
sudo apt update
```

Install dependencies:

```Bash
sudo apt install r-base r-base-dev
sudo apt install build-essential libcurl4-gnutls-dev libxml2-dev libssl-dev gdebi git
```

Install devtools(run the code below in terminal, not in R!):

```Bash
sudo su - -c "R -e \"install.packages('devtools',repos='http://cran.rstudio.com/')\""
```

Install the Shiny Version 1.2.0, other versions don't support IsoplotRgui right now.

```Bash
#sudo su - -c "R -e \"install.packages('shiny',repos='http://cran.rstudio.com/')\""
#sudo su - -c "R -e \"devtools::install_github('rstudio/shiny',force=TRUE)\""
#Ignore this line and the two lines above
sudo su - -c "R -e \"devtools::install_version('shiny',version = '1.2.0', repos = 'http://cran.rstudio.com/')\""
```

Install IsoplotR and IsoplotRgui:

```Bash
sudo su - -c "R -e \"devtools::install_github('pvermees/IsoplotR',force=TRUE)\""
sudo su - -c "R -e \"devtools::install_github('pvermees/IsoplotRgui',force=TRUE)\""
```

## Install Shiny Server

Install gdebi and wget.

```Bash
sudo apt install gdebi-core wget
```

Then use wget to download rstudio server and shiny server deb, after which use gdebi to install them.

```Bash
wget https://download2.rstudio.org/rstudio-server-1.0.136-amd64.deb
sudo gdebi rstudio-server-1.0.136-amd64.deb
wget https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.9.923-amd64.deb
sudo gdebi shiny-server-1.5.9.923-amd64.deb
```

## Test your server

Clone this repo to get the files for the IsoplotR server:

```Bash
git clone https://github.com/chinageology/IsoplotRserver
```

Get into the cloned folder `IsoplotRserver`, copy the who folder `IsoplotRshiny` to `/srv/shiny-server/`:

```Bash
cd IsoplotRserver
cp -R IsoplotRshiny /srv/shiny-server/
```

Then visit http://yourserverip:3838/IsoplotRshiny/

## Update A Installed Server To Latest

Update IsoplotR to the latest on github:

```Bash
sudo su - -c "R -e \"devtools::install_github('pvermees/IsoplotR',force=TRUE)\""
```

Git clone the latest version of IsoplotRgui, and then copy all inside `IsoplotRgui/inst/shiny-examples/myapp/` to your server location, here as `/srv/shiny-server/IsoplotRshiny/`:

```Bash
cd /tmp
git clone https://github.com/pvermees/IsoplotRgui
cd IsoplotRgui/inst/shiny-examples/myapp/
sudo cp -R * /srv/shiny-server/IsoplotRshiny/
```

## Community Servers

[http://isoplotr.london-geochron.com](http://ucl.ac.uk/~ucfbpve/isoplotr)

## Further information

See [http://isoplotr.london-geochron.com](http://ucl.ac.uk/~ucfbpve/isoplotrlnnn)

## Author

[Pieter Vermeesch](http://ucl.ac.uk/~ucfbpve)

###### This repo is built by [CycleUser](https://www.zhihu.com/people/cycleuser/columns)

## License

This project is licensed under the GPL-3 License
