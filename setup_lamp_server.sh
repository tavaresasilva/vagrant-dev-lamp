#!/bin/bash

  sudo apt-get -y update
  sudo apt-get -y upgrade 
  sudo apt-get -y install lamp-server^

  if ! ls /vagrant/html > /dev/null 2> /dev/null
    then
      cp -r /var/www/html /vagrant      
  fi
    
  sudo rm -r /var/www/html
  ln -s /vagrant/html /var/www/html

  # Enable https on server
  sudo a2enmod rewrite > /dev/null
  sudo a2enmod ssl > /dev/null
  sudo systemctl restart apache2
  sudo a2ensite default-ssl.conf > /dev/null
  sudo systemctl restart apache2
