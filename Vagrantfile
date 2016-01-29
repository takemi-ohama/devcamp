VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define :devcamp do | v |
    v.vm.box = "takemi-ohama/vivid64"
    v.vm.network :private_network, ip: "192.168.33.71"
    if RbConfig::CONFIG['host_os'] =~ /darwin/ then
      if `nfsd status`.include?('nfsd is running') then
        v.vm.synced_folder "./src", "/opt", :nfs => true, :create => true
        else
        puts 'nfsd is not running'
      end
    end
    v.vm.synced_folder ".", "/home/vagrant/devcamp", :create => true, :owner => 'vagrant', :group => 'users',  :mount_options => ["dmode=2777","fmode=777"]
  end
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--vram", 16]
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.gui = false
  end
  config.vm.provision "shell", path: "bin/init.sh"
  config.vm.provision "shell", run: "always", path: "bin/start.sh"
  config.hostsupdater.aliases = [
    "devcamp",
  ]
end
