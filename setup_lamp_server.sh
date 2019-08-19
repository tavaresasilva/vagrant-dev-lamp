#!/bin/bash
# -------------------------------------------------------------------------------------
# This script is part of vagrant-dev-lamp project that creates a LAMP dev environment.
# Visit https://github.com/tavaresasilva/vagrant-dev-lamp for more information.
# -------------------------------------------------------------------------------------

DEFAULT_PHPMYAMDIN_PASS="vagrant"
VAGRANT_SQL_USER="vagrant"
VAGRANT_SQL_PASS="vagrant"

# Update and install lamp server
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install lamp-server^

# Checks if the html directory exists and creates a symbolic link on the web server
if ! ls /vagrant/html >/dev/null 2>/dev/null; then
  cp -r /var/www/html /vagrant
fi

sudo rm -r /var/www/html
ln -s /vagrant/html /var/www/html

# Enable https on server
sudo a2enmod rewrite >/dev/null
sudo a2enmod ssl >/dev/null
sudo systemctl restart apache2
sudo a2ensite default-ssl.conf >/dev/null
sudo systemctl restart apache2

# Install and setup phpmyadmin
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $DEFAULT_PHPMYAMDIN_PASS"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $DEFAULT_PHPMYAMDIN_PASS"

sudo apt-get install -y phpmyadmin

# Create a new vagrant SQL admin user
sudo mysql -e "CREATE USER '${VAGRANT_SQL_USER}'@'localhost' IDENTIFIED BY '${VAGRANT_SQL_PASS}';"
sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${VAGRANT_SQL_USER}'@'localhost' WITH GRANT OPTION;"
sudo mysql -e "FLUSH PRIVILEGES;"

# End script
