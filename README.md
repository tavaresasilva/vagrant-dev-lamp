# LAMP development environment with Vagrant and VirtualBox

This project create a basic LAMP development environment using Vagrant and VirtualBox.

### This environment includes:

1. Ubuntu 18.04
2. Apache/2.4.29 (Ubuntu)
3. MySQL Ver 14.14 Distrib 5.7.27
3. PHP Version 7.2.19
4. phpMyAdmin Ver 4.6

## About Vagrant

Vagrant is a tool for building and distributing development environments.

Development environments managed by Vagrant can run on local virtualized platforms such as VirtualBox or VMware, in the cloud via AWS or OpenStack, or in containers such as with Docker or raw LXC. [Vagrant README GitHub Project](https://github.com/hashicorp/vagrant/blob/master/README.md)

## About VirtualBox

VirtualBox is a general-purpose full virtualizer for x86 hardware, targeted at server, desktop and embedded use. [About VirtualBox Wiki Page](https://www.virtualbox.org/wiki/VirtualBox)

## About LAMP

LAMP (Linux, Apache, MySQL,PHP) is an archetypal model of web service stacks, named as an acronym of the names of its original four open-source components: the Linux operating system, the Apache HTTP Server, the MySQL relational database management system (RDBMS), and the PHP programming language. [LAMP Wikipedia](https://en.wikipedia.org/wiki/LAMP_(software_bundle))

## How do I use this?

### Step 1
> Install these packages first

1. [Install Git](https://git-scm.com/downloads)
2. [Install VirtualBox](https://www.virtualbox.org/wiki/Downloads)  
3. [Install Vagrant](https://www.vagrantup.com/downloads.html)  

### Step 2
> Run these commands on the terminal. This step can take a while

```
git clone https://github.com/tavaresasilva/vagrant-dev-lamp.git
cd vagrant-dev-lamp
vagrant up
```

### Step 3
> It's done

Use the html directory to build your project and access [localhost](http://localhost) to see the work. You can access phpmyadmin with vagrant default username and password.

## Vagrant Cheat Sheet

Connects to virtual machine via SSH
```
vagrant ssh
```

Turn off the virtual machine
```
vagrant halt
```

Turn on the virtual machine
```
vagrant up
```

Deletes the virtual machine. Keep files in vagrant directory
```
vagrant destroy
```

