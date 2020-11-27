# -*- mode: ruby -*-
# vi: set ft=ruby :

HOSTNAME = 'merrimack'
VAGRANTFILE_API_VERSION = '2'

$script = <<-SCRIPT
hostname #{HOSTNAME}
MY_IP=$(ip addr show dev eth0 | grep inet | grep -v inet6 | cut -d / -f 1 | rev | cut -d ' ' -f 1 | rev)
echo "${MY_IP} #{HOSTNAME}" >> /etc/hosts
dnf -y install at-spi2-atk atk gtk3 java-atk-wrapper libXt libgbm nodejs nss pango
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'centos/8'
  config.vm.provider 'virtualbox' do |vb|
    vb.name = HOSTNAME
  end
  config.vm.provision 'shell', inline: $script
# uncomment next line to enable live shared folder
# config.vm.synced_folder '.', '/vagrant', type: 'virtualbox'
end
