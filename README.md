# Stuff to install on a new ubuntu:

```bash
#!/bin/bash
sudo apt install -y gparted barrier git guake nemo testdisk net-tools linux-image-lowlatency linux-headers-lowlatency build-essential fdupes encfs curl xclip mono-runtime pavucontrol libncurses5-dev v4l-utils v4l2loopback-dkms nasm yasm htop 
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
```

# boot issues can be fixed with boot-repair
```bash
sudo add-apt-repository ppa:yannubuntu/boot-repair
sudo apt install boot-repair && sudo add-apt-repository --remove ppa:yannubuntu/boot-repair
boot-repair 
```

# GPU drivers (here be dragons!)
```bash
sudo ubuntu-drivers install
sudo nvidia-dkms-455 nvidia-driver-455 nvidia-kernel-source-455
```

# darktable missing deps
```bash
sudo apt build-dep darktable
# sudo apt install autoconf automake autopoint autotools-dev cmake cmake-data debhelper dh-autoreconf dh-strip-nondeterminism dwz gettext gir1.2-colord-1.0 gir1.2-colordgtk-1.0 gir1.2-gtk-2.0 gir1.2-harfbuzz-0.0 gir1.2-osmgpsmap-1.0 icu-devtools intltool intltool-debian libarchive-zip-perl libatk-bridge2.0-dev libatk1.0-dev libatspi2.0-dev libblkid-dev libbrotli-dev libbz2-dev libcairo-script-interpreter2 libcairo2-dev libcolord-dev libcolord-gtk-dev libcroco3 libcups2-dev libcupsimage2-dev libcurl4-gnutls-dev libdatrie-dev libdbus-1-dev libdebhelper-perl libegl-dev libegl1-mesa-dev libepoxy-dev libexif-dev libexiv2-dev libexpat1-dev libffi-dev libfile-stripnondeterminism-perl libflickcurl-dev libflickcurl0 libfontconfig1-dev libfreetype-dev libfreetype6-dev libfribidi-dev libgdk-pixbuf2.0-dev libgl-dev libgl1-mesa-dev libgles-dev libgles1 libglib2.0-dev libglib2.0-dev-bin libglvnd-dev libglx-dev libgphoto2-dev libgraphicsmagick-q16-3 libgraphicsmagick1-dev libgraphite2-dev libgtk-3-dev libgtk2.0-dev libharfbuzz-dev libharfbuzz-gobject0 libice-dev libicu-dev libilmbase-dev libjbig-dev libjpeg-dev libjpeg-turbo8-dev libjpeg8-dev libjson-glib-dev libjsoncpp1 liblcms2-dev liblensfun-data-v1 liblensfun-dev liblensfun1 libltdl-dev liblua5.3-dev liblzma-dev libmount-dev libncurses-dev libopenexr-dev libopengl-dev libopengl0 libopenjp2-7-dev libosmgpsmap-1.0-1 libosmgpsmap-1.0-dev libpango1.0-dev libpcre16-3 libpcre2-dev libpcre2-posix2 libpcre3-dev libpcre32-3 libpcrecpp0v5 libpixman-1-dev libpng-dev libpsl-dev libpthread-stubs0-dev libpugixml-dev libpugixml1v5 libraptor2-dev libreadline-dev librhash0 librsvg2-dev libsecret-1-dev libselinux1-dev libsepol1-dev libsm-dev libsoup2.4-dev libsqlite3-dev libsub-override-perl libthai-dev libtiff-dev libtiffxx5 libtool libwayland-bin libwayland-dev libwebp-dev libwmf-dev libx11-dev libxau-dev libxcb-render0-dev libxcb-shm0-dev libxcb1-dev libxcomposite-dev libxcursor-dev libxdamage-dev libxdmcp-dev libxext-dev libxfixes-dev libxft-dev libxi-dev libxinerama-dev libxkbcommon-dev libxml2-dev libxml2-utils libxrandr-dev libxrender-dev libxslt1-dev libxtst-dev libyajl-dev libzstd-dev m4 pango1.0-tools po-debconf uuid-dev wayland-protocols x11proto-core-dev x11proto-dev x11proto-input-dev x11proto-randr-dev x11proto-record-dev x11proto-xext-dev x11proto-xinerama-dev xorg-sgml-doctools xsltproc xtrans-dev zlib1g-dev

# LLVM (required version >= 3.9)
# libavif (required version >= 0.8.2)
# GMIC
# Saxon
sudo apt install clang-10 llvm-10
```

# Allowing login screen to show on external monitor:
- set up "displays" the way you like it
- in terminal:
    ```bash
    sudo cp ~/.config/monitors.xml ~gdm/.config/monitors.xml
    sudo chown gdm:gdm ~gdm/.config/monitors.xml
    ```
- reboot

# setup Epson ET-2500 eco-tank
```bash
sudo apt install printer-driver-escpr
```
- superkey + type "printer", select "Printers"
- find the "ET-2500" on the network
- click the settings gear-icon, select *"Printer Details"*
    - click *"Select from Database..."*
    - Choose *"Epson" on the left, "EPSON ET-2500 Series, Epson Inkjet Printer Driver (ESC/P-R) for Linux"* on the right.

# setup Bluetooth as an alsa device
- install bluealsa (bluez-alsa?)
- get current device with:  
 `bluealsa-aplay -L | awk -F[,=] '{print $4;exit}'`
- create `~/.asoundrc.template`:
```bash
pcm.bluetooth_raw {
    type plug
    slave.pcm {
        type          bluealsa;
        device        REPLACE_THIS_DEVICE_ID;
        profile       "a2dp";
    }
    hint {
        show on;
        description "Bluetooth a2dp (out only)";
    }
}
```
- replace the appropriate line with the captured devid:  
 ```bash
 sed ~/.asoundrc.template -e 's/REPLACE_THIS_DEVICE_ID/'$(bluealsa-aplay -L | awk -F[,=] '{print $4;exit}')'/' > ~/.asoundrc
 ```
- set volume with:  
 `amixer -D bluealsa sset '<control name>' 70%`