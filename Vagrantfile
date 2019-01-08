# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  config.vm.network "public_network"

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "bento/ubuntu-14.04"

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", path: "provision.sh"

  # Forward SSH
  config.ssh.forward_agent = true

  # Use a linked clone
  config.vm.provider "virtualbox" do |vb|
    vb.linked_clone = true
  end

  # Synced folder permissions
  config.vm.synced_folder "./", "/vagrant", 
    id: "vagrant-root",
    owner: "vagrant",
    group: "www-data",
    mount_options: ["dmode=775,fmode=777"]

  # @see https://github.com/phinze/landrush
  #config.landrush.enabled = true
  config.vm.hostname = "daheardit-records.vagrant.test"
end
