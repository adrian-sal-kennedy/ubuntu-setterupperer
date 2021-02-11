#!/bin/bash
sudo apt install -y gparted barrier git guake nemo testdisk net-tools linux-image-lowlatency linux-headers-lowlatency build-essential fdupes encfs curl xclip mono-runtime pavucontrol libncurses5-dev v4l-utils v4l2loopback-dkms nasm yasm htop clang-10 llvm-10 libusb-1.0-0-dev mlocate fdupes
# get google chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt update 
sudo apt install -y google-chrome-stable
# install Zotero
cd ~/Downloads
wget -O zotero.tar.bz2 'https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64&version=5.0.93'
# sudo xdg-open ./Downloads/Zotero-5.0.93_linux-x86_64.tar.bz2 
sudo tar -xf  ./zotero.tar.bz2 -C /opt/
# extract dir to /opt/zotero/
cd /opt/Zotero_linux-x86_64/
sudo ./set_launcher_icon
ln -s /opt/Zotero_linux-x86_64/zotero.desktop ~/.local/share/applications/zotero.desktop
sudo apt install -y default-jre libreoffice-java-common
# should be able to launch it by just hitting start and typing z-o-t etc
# when you do, install the plugins for chrome and libreoffice as well. why not?
# Now is also a good time to bind super+e to nemo, the file manager
# ======
# now to create more users: Jarvie, Nani, Lucy
# make sure our ntfs backup drive is mounting a little faster:
echo 'UID=2106f2c0-5465-45fc-816a-deb5d376572f /media/sal/4tb2 ntfs rw,sync,auto,users,exec,nls=utf8,umask=003,gid=46,uid=1000    0   0 ' | sudo tee -a /etc/fstab

# fix repos to point to global not au, which misses a lot
# sudo cp /etc/apt/sources.list /etc/apt/sources.list.bup
# cat /etc/apt/sources.list.bup | sed 's#//au\.#//#' | sudo tee -a /etc/apt/sources.list

# if fonts are messed up by restoring/copying an old home dir into the new installation
# rm -rf ~/.cache/fontconfig && sudo fc-cache -r -v

# nvidia drivers
sudo ubuntu-drivers install
sudo nvidia-dkms-455 nvidia-driver-455 nvidia-kernel-source-455

# install Figma electron app
sudo add-apt-repository ppa:chrdevs/figma && sudo apt update && sudo apt install -y figma-linux

# install kxstudio
sudo apt-get install -y apt-transport-https gpgv
sudo dpkg --purge kxstudio-repos-gcc5
wget https://launchpad.net/~kxstudio-debian/+archive/kxstudio/+files/kxstudio-repos_10.0.3_all.deb
sudo dpkg -i kxstudio-repos_10.0.3_all.deb && rm kxstudio-repos_10.0.3_all.deb
sudo apt update && sudo apt upgrade
sudo apt install -y kxstudio-repos 
sudo apt install -y kxstudio-meta-audio-applications 
sudo apt install -y kxstudio-recommended-all
sudo apt install -y kxstudio-meta-audio-plugins-lv2 kxstudio-meta-audio-plugins-vst kxstudio-meta-audio-plugins-ladspa kxstudio-meta-audio-plugins-dssi
# if above doesn't work, do below
# sudo apt install -y kxstudio-recommended-audio kxstudio-recommended-audio-plugins kxstudio-recommended-video blender inkscape gimp-cbmplugs gimp-data-extras gimp-dds gimp-gap gimp-gluas gimp-gutenprint gimp-texturize

# install dbeaver
wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
sudo dpkg -i dbeaver-ce_latest_amd64.deb

# install build dependencies for obs-studio
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt build-dep obs-studio
sudo apt install obs-studio

# install zoom
cd ~/Downloads
wget 'https://zoom.us/client/latest/zoom_amd64.deb'
sudo dpkg -i ./zoom_amd64.deb 
sudo apt install -y --fix-broken

sudo apt install printer-driver-escpr

# install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn

# install rbenv and ruby stable (as of now, 2.7.2)
sudo apt remove ruby
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
rbenv install 2.7.2
gem install solargraph
gem install rails

# turn off the annoying calendar setting popup from evolution if you happen to have an account set up:
gsettings set org.gnome.evolution-data-server.calendar notify-with-tray true