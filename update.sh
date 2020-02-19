# i. copy IsoplotR and IsoplotRgui from the London server:                                          
cd /tmp                                                                                            
wget http://pieter-vermeesch.es.ucl.ac.uk/IsoplotR.zip                                              
wget http://pieter-vermeesch.es.ucl.ac.uk/IsoplotRgui.zip                                          
                                                                                                   
# ii. install IsoplotR with devtools:                                                              
sudo su - -c "R -e \"devtools::install_local('/tmp/IsoplotR.zip',force=TRUE)\""                    
                                                                                                   
# iii. unzip IsoplotRgui and copy to the shiny-server directory:                                    
unzip IsoplotRgui                                                                                  
cd IsoplotRgui-master/inst/shiny-examples/myapp                                                    
sudo cp -R www /srv/shiny-server/IsoplotR                                                          
sudo cp -R server.R /srv/shiny-server/IsoplotR                                                      
                                                                                                   
# iv. clean up and restart shiny-server                                                            
cd /tmp                                                                                            
sudo rm -rf IsoplotR.zip IsoplotRgui.zip IsoplotRgui-master                                        
sudo systemctl restart shiny-server  