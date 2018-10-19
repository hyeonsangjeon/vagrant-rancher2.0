# -*- mode: ruby -*-
# vi: set ft=ruby :
OS_NAME="ubuntu1404"
OS_URL="https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"


OS_NAME="ubuntu1804"
VAGRANTFILE_API_VERSION = "2"
NODE_COUNT = 10
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provision "shell", path: "./provisioning/default_setting.sh", args: ""
  config.vm.synced_folder "~/.ssh/", "/tmp/conf.d/"

## For Rancher VM Hosts instance  
  NODE_COUNT.times do |i|
    node_id = "vmhost0#{i}"
    config.vm.define node_id do |node|
### Args= [service name] [master / slave] [master IP] [advertise IP]
    config.vm.provision "shell", path: "./provisioning/vmhosts.sh", args: ""
    config.vm.network "private_network", :dev => "eth0", :ip => "192.200.10.1#{i}"
      node.vm.box = OS_NAME
      node.vm.box_url = OS_URL
      node.vm.hostname = "#{node_id}"
      node.vm.provider :virtualbox do |vb|
          vb.customize ["modifyvm", :id, "--memory", "3072"]
          vb.customize ["modifyvm", :id, "--cpus", "2"]
      end
    end
  end

## For Management server for all same service farm support
  config.vm.define "rancher" do |rancher|
    config.vm.provision "shell", path: "./provisioning/rancher.sh", args: ""
    config.vm.network "private_network", :dev => "eth0", :ip => "192.200.10.100"
    rancher.vm.box = OS_NAME
    rancher.vm.box_url = OS_URL
  end

  config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]   
  end 
end




