Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/focal64"
  config.vm.network "private_network", bridge: "ens1f0", ip: "192.168.60.171", nic_type: "82540EM"

  config.vm.provider "virtualbox" do |v|
    v.linked_clone = true
    v.memory = 2048
    v.cpus = 4
  end

  config.vm.box_check_update = false

end
