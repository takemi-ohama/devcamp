vagrant destroy -f
vagrant up
vagrant package
mv package.box vivid64.box
vagrant box add -cf --name takemi-ohama/vivid64 vivid64.box
vagrant halt
vagrant destroy -f
