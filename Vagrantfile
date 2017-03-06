# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
	config.vm.box = "ubuntu/trusty64"
	config.vm.box_check_update = true
   
	# Create a public network, which generally matched to bridged network.
	# Bridged networks make the machine appear as another physical device on
	# your network.
	
	config.vm.network "forwarded_port", guest: 9999, host: 9999 
   
   config.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 2
   end
 
#   config.vm.provision "shell", inline: <<-SHELL
#	apt-get update

#SHELL
	config.vm.provision :shell, path: "bootstrap.sh"
	config.vm.provision :shell, inline: "/downloadedApps/dotcms-3.3.1/bin/startup.sh", run: "always"
end
