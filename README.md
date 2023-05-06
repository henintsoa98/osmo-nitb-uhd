# osmo-nitb-uhd
Install osmo-nitb with UHD on debian 10.13.0

# REQUIREMENTS
[Debian 10.13.0](https://cdimage.debian.org/mirror/cdimage/archive/10.13.0/amd64/iso-dvd/debian-10.13.0-amd64-DVD-1.iso)
GNOME (over may work)
bash as default shell
Best with fresh install to avoid dependancy errors

# INSTALLATION
## PRE-INSTALLATION
#### Before install :
$PATH need to be set to contains /usr/local/sbin /usr/sbin /sbin
$LD_LIBRARY_PATH need to be set to contains /usr/local/lib
and the $USER in sudo group
To configure all stuff, change directory into this repo, and run debian_setup.sh as root
```
su -c "bash debian_setup.sh"
```
after reboot, run the installation

## INSTALLATION
Change directory into this repo, and run osmo_uhd.sh
```
bash osmo_uhd.sh
```
This step may ask password many times

# RUN
```
cd $HOME/SOFTWARE/OSMO_UHD/osmo-nitb-scripts
sudo ./main.py
```
