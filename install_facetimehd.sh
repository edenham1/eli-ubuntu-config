#!/bin/bash 

# Taken from https://andreafortuna.org/2024/08/24/from-faceless-to-facetime-installing-webcam-drivers-on-a-debian-powered-macbook-air
# and
# https://gist.github.com/xyb/879f3bdf93cb5e8fc3d9d9675ae272cb
apt install xz-utils curl cpio make curl xz-utils cpio unrar -y
apt-get install linux-headers-generic git kmod libssl-dev checkinstall
cd /tmp
git clone https://github.com/patjak/facetimehd-firmware.git
cd facetimehd-firmware
make
make install
cd /tmp
git clone https://github.com/patjak/bcwc_pcie.git
cd bcwc_pcie
make
make install
depmod

sudo modprobe facetimehd


# Fix Camera calebration
# Instructions here: https://github.com/patjak/facetimehd/wiki/Extracting-the-sensor-calibration-files
# Bootcam site: https://support.apple.com/en-us/106378
cd /tmp
mkdir camera_calebration
cd camera_calebration
wget https://download.info.apple.com/Mac_OS_X/031-30890-20150812-ea191174-4130-11e5-a125-930911ba098f/bootcamp5.1.5769.zip
unzip bootcamp5.1.5769.zip
cd BootCamp/Drivers/Apple/ && unrar x AppleCamera64.exe

dd bs=1 skip=1663920 count=33060 if=AppleCamera.sys of=9112_01XX.dat
dd bs=1 skip=1644880 count=19040 if=AppleCamera.sys of=1771_01XX.dat
dd bs=1 skip=1606800 count=19040 if=AppleCamera.sys of=1871_01XX.dat
dd bs=1 skip=1625840 count=19040 if=AppleCamera.sys of=1874_01XX.dat

cp *.dat /lib/firmware/facetimehd/
modprobe facetimehd -r
modprobe facetimehd
