# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.hostname = "k3s"
  config.vm.network "forwarded_port", guest: 80, host: 48080
  config.vm.network "private_network", ip: "192.168.61.11"
  config.vm.provider :virtualbox do |vb, override|
    vb.cpus = 2
    vb.memory = 2048
  end
  config.vm.provision "shell", path: "provision.sh"
end
