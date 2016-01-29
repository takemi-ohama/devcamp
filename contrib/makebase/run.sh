vagrant destroy -f
vagrant up
vagrant package
mv package.box base.box
vagrant box remove -f --all takemi-ohama/devbase
vagrant box add -cf --name takemi-ohama/devbase  base.box
vagrant halt
vagrant destroy -f
