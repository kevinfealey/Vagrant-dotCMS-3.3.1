# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.network "forwarded_port", guest: 9999, host: 9999

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = 2
  end

  config.vm.provision "shell", path: "bootstrap.sh"
  config.vm.provision "shell", inline: "/downloadedApps/dotcms-3.3.1/bin/startup.sh || true", run: "always"
end
