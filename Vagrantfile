# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box_check_update = false

  # vbox template for all vagranth instances
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "4096"
    vb.cpus = 2
  end

             config.vm.define "vg-rundeck-ubuntu" do |k8scluster|
                k8scluster.vm.box = "bento/ubuntu-20.04"
                k8scluster.vm.hostname = "vg-rundeck-ubuntu"
                k8scluster.vm.network "private_network", ip: "192.168.50.15"                                
                k8scluster.vm.provider "virtualbox" do |vb|
                    vb.name = "vbox-rundeck-ubuntu"
                    vb.memory = "4096"
                end
                k8scluster.vm.provision :shell, path: "provisioning/bootstrap_ubuntu.sh"
              end

             config.vm.define "vg-rundeck-debian" do |k8scluster|
                k8scluster.vm.box = "debian/buster64"
                k8scluster.vm.hostname = "vg-rundeck-debian"
                k8scluster.vm.network "private_network", ip: "192.168.50.16"                                
                k8scluster.vm.provider "virtualbox" do |vb|
                    vb.name = "vbox-rundeck-debian"
                    vb.memory = "4096"
                end
                k8scluster.vm.provision :shell, path: "provisioning/bootstrap_debian.sh"
              end

             config.vm.define "vg-rundeck-fedora" do |k8scluster|
                k8scluster.vm.box = "bento/fedora-32"
                k8scluster.vm.hostname = "vg-rundeck-fedora"
                k8scluster.vm.network "private_network", ip: "192.168.50.17"                                
                k8scluster.vm.provider "virtualbox" do |vb|
                    vb.name = "vbox-rundeck-fedora"
                    vb.memory = "4096"
                end
                k8scluster.vm.provision :shell, path: "provisioning/bootstrap_fedora.sh"
              end

             config.vm.define "vg-rundeck-centos" do |k8scluster|
                k8scluster.vm.box = "bento/centos-8.2"
                k8scluster.vm.hostname = "vg-rundeck-centos"
                k8scluster.vm.network "private_network", ip: "192.168.50.18"                                
                k8scluster.vm.provider "virtualbox" do |vb|
                    vb.name = "vbox-rundeck-centos"
                    vb.memory = "4096"
                end
                k8scluster.vm.provision :shell, path: "provisioning/bootstrap_centos.sh"
              end

end