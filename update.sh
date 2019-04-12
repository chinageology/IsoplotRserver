
sudo apt install subversion
sudo su - -c "R -e \"devtools::install_github('pvermees/IsoplotR',force=TRUE)\""
cd /srv/shiny-server/IsoplotRshiny
svn checkout --force
https://github.com/pvermees/IsoplotRgui/tree/master/inst/shiny-examples/myapp/www
svn export --force
https://github.com/pvermees/IsoplotRgui/blob/master/inst/shiny-examples/myapp/server.R