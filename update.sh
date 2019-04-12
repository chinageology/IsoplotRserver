
sudo apt install subversion
sudo su - -c "R -e \"devtools::install_github('pvermees/IsoplotR',force=TRUE)\""
cd /srv/shiny-server/IsoplotRshiny
svn checkout --force
https://github.com/pvermees/IsoplotRgui/tree/master/inst/shiny-examples/myapp/www
svn export --force
https://github.com/pvermees/IsoplotRgui/blob/master/inst/shiny-examples/myapp/server.R



```Bash
#Update IsoplotR to the latest on github:
sudo su - -c "R -e \"devtools::install_github('pvermees/IsoplotR',force=TRUE)\""
#clone the latest version of IsoplotRgui
#then copy all inside `IsoplotRgui/inst/shiny-examples/myapp/` to server location
#here as `/srv/shiny-server/IsoplotRshiny/`
cd /tmp
git clone https://github.com/pvermees/IsoplotRgui
cd IsoplotRgui/inst/shiny-examples/myapp/
cp -R * /srv/shiny-server/IsoplotRshiny/R/
```