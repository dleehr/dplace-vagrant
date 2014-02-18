# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Ubuntu 12.04 LTS 64-bit
  config.vm.box = "precise64"
  # If box is not present
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # config.vm.network :forwarded_port, guest: 80, host: 8080
  # config.vm.network :private_network, ip: "192.168.33.10"
  # config.vm.network :public_network
  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible-postgresql/setup.yml"
  end
end
