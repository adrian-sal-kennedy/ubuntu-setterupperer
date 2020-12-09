#!/bin/bash
mkdir -p ~/src/ffmpeg && ~/src/ffmpeg
git clone git@github.com:FFmpeg/FFmpeg.git .
sudo apt build-dep ffmpeg
# above line is equivalent to below line
# sudo apt install cleancss comerr-dev doxygen flite1-dev frei0r-plugins-dev krb5-multidev ladspa-sdk libaom-dev libarchive-dev libaribb24-dev libavc1394-dev libbluray-dev libbs2b-dev libc-ares2 libcaca-dev libcdio-cdda-dev libcdio-dev libcdio-paranoia-dev libchromaprint-dev libcodec2-dev libdc1394-22-dev libdrm-dev libffmpeg-nvenc-dev libgcrypt20-dev libgles2-mesa-dev libgme-devlibgmp-dev libgmpxx4ldbl libgnutls-dane0 libgnutls-openssl27 libgnutls28-dev libgnutlsxx28 libgpg-error-dev libgssrpc4 libibus-1.0-dev libidn2-dev libiec61883-dev libjs-inherits libjs-source-maplibkadm5clnt-mit11 libkadm5srv-mit11 libkdb5-9 libkrb5-dev liblept5 libleptonica-dev liblilv-dev libmp3lame-dev libmpg123-dev libmysofa-dev libnode64 libnorm-dev libogg-dev libomxil-bellagio-devlibomxil-bellagio0 libopenal-dev libopenmpt-dev libopus-dev libout123-0 libp11-kit-dev libpgm-dev libraw1394-dev librubberband-dev libsctp-dev libsctp1 libsdl2-dev libserd-dev libset-scalar-perl libshine-devlibslang2-dev libsnappy-dev libsndio-dev libsodium-dev libsord-dev libsoxr-dev libsoxr-lsr0 libsratom-dev libssh-gcrypt-dev libtasn1-6-dev libtesseract-dev libtesseract4 libtheora-dev libtwolame-dev libunbound8libva-dev libva-glx2 libvdpau-dev libvidstab-dev libvo-amrwbenc-dev libvo-amrwbenc0 libvorbis-dev libvpx-dev libwavpack-dev libx265-dev libxapian30 libxss-dev libxt-dev libxv-dev libxvmc-dev libxxf86vm-devlibzmq3-dev libzvbi-dev nettle-dev node-balanced-match node-brace-expansion node-clean-css node-commander node-concat-map node-fs.realpath node-glob node-inflight node-inherits node-lessnode-minimatch node-once node-path-is-absolute node-source-map node-wrappy nodejs ocl-icd-opencl-dev opencl-c-headers x11proto-scrnsaver-dev x11proto-xf86vidmode-dev
sudo apt install -y nasm yasm libass-dev libgsm1-dev libopencore-amrnb-dev libopencore-amrwb-dev libxvidcore-dev libfdk-aac-dev libssl-dev 


./configure --extra-libs="-ldl" --enable-gpl --enable-version3 --enable-nonfree --enable-shared \
--enable-openssl \
--enable-libfdk_aac \
--enable-libmp3lame \
--enable-libtheora \
--enable-libvorbis \
--enable-libvpx \
--enable-libopus \
--enable-libx264 \
--enable-libx265 \
--enable-libopencore-amrnb \
--enable-libopencore-amrwb \
--enable-libgsm \
--enable-libxvid \
--enable-ffplay \
--enable-libass \
--enable-libfreetype \
$1

# --disable-static
# --enable-x11grab \

make -j$(nproc) && sudo make install