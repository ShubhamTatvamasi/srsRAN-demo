Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/focal64"
  config.vm.network "public_network", bridge: "ens1f0", ip: "192.168.5.57"

  config.vm.provider "virtualbox" do |v|
    v.linked_clone = true
    v.memory = 4096
    v.cpus = 4
  end

  config.vm.box_check_update = false
  
  config.vm.provision "shell", inline: <<-SHELL
    echo "@reboot ip route add default via 192.168.5.1" \
      > /var/spool/cron/crontabs/root
  SHELL

  config.vm.provision "shell", run: "always",
    inline: "ip route add default via 192.168.5.1 || true"

end
