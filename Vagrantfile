# -*- mode: ruby -*-
# vi: set ft=ruby :
# -------------------------------------------------------------------------------------
# This script is part of vagrant-dev-lamp project that creates a LAMP dev environment.
# Visit https://github.com/tavaresasilva/vagrant-dev-lamp for more information.
# -------------------------------------------------------------------------------------

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"
  config.vm.network "forwarded_port", guest: 80, host: 80
  config.vm.network "forwarded_port", guest: 443, host: 443
  config.vm.provision "shell", path:"setup_lamp_server.sh"

end
