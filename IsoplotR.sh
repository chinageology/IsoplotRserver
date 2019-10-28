# i. update IsoplotR from GitHub:
sudo su - -c "R -e \"devtools::install_github('pvermees/IsoplotR',force=TRUE)\""

# ii. clone IsoplotRgui from GitHub to /tmp:
cd /tmp
git clone https://github.com/pvermees/IsoplotRgui

# iii. copy the app to the shiny-server directory:
cd IsoplotRgui/inst/shiny-examples/myapp
sudo cp -R www /srv/shiny-server/IsoplotR
sudo cp -R server.R /srv/shiny-server/IsoplotR

# iv. clean up and restart shiny-server
sudo rm -rf /tmp/IsoplotRgui
sudo systemctl restart shiny-server