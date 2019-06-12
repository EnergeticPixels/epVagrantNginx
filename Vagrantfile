# -*- mode: ruby -*-
# vi: set ft=ruby :

# ------  DEVELOPMENT BOX  -------
# ---> CONSTANTS
VAGRANTFILE_API_VERSION= "2"

# ---> Confiure the box
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # --> the basic box
  #config.vm.box = "generic/ubuntu1804"
  #config.vm.box = "generic/trusty64"
  config.vm.box = "ubuntu/bionic64"
  config.vm.box_version = "20190604.0.0"
  #config.vm.box_url = "https://vagrantcloud.com/generic/ubuntu1804"
  config.vm.hostname = "epBionicBeaver.box"
  
  # config.vm.box_check_update = false

  # --> HOST port communicating with server on guest port only allow access
  # --> from localhost(127.0.0.1) which disables public access
  config.vm.network "forwarded_port", guest: 80, host: 3001, id:"nginx"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder.   
  # /vagrant below is done by default when vagrant builds the box out
  config.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  config.vm.provider "virtualbox" do |vb|
    vb.name = "epBionicBeaver"
    #vb.gui = true
    vb.cpus = 2
    vb.memory = 1024
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
  config.vm.provision "shell", inline: <<-SHELL
    echo "inline provision shell for future use - adding user"
    # create non-root user with sudo privs
    # sudo adduser thechief
    # sudo usermod -aG sudo thechief
  SHELL

  config.vm.provision "shell" do |nginx|
    nginx.path = ".provision/nginx-bootstrap.sh"
  end

end
