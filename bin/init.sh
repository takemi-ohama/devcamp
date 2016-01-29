hostname devcampi
export PATH="${HOST}/bin:$PATH"
git config --global credential.helper store
git config core.filemode false
git config --global user.email "takemi.ohama@gmail.com"
git config --global user.name "takemi-ohama"

ln -s ~/devbase/.bash_profile
