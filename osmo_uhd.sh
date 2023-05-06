sudo apt install build-essential gcc g++ make automake autoconf libtool pkg-config libtalloc-dev libpcsclite-dev libortp-dev libsctp-dev libssl-dev libdbi-dev libdbd-sqlite3 libsqlite3-dev libpcap-dev libc-ares-dev libgnutls28-dev libsctp-dev sqlite3 libsofia-sip-ua-glib-dev libusb-1.0-0-dev libfftw3-dev libgsm1-dev
sudo apt install autoconf automake build-essential ccache cmake cpufrequtils doxygen ethtool g++ git inetutils-tools libboost-all-dev libncurses5 libncurses5-dev libusb-1.0-0 libusb-1.0-0-dev libusb-dev python3-dev python3-mako python3-numpy python3-requests python3-scipy python3-setuptools python3-ruamel.yaml
sudo apt install asterisk telnet python3-pip
sudo pip3 install smpplib

mkdir -p $HOME/SOFTWARE/OSMO_UHD
cp -r osmo-nitb-scripts $HOME/SOFTWARE/OSMO_UHD
cd $HOME/SOFTWARE/OSMO_UHD

git clone --depth 1 -b v3.15.0.0 https://github.com/EttusResearch/uhd
git clone --depth 1 -b 0.9.31 https://gitea.osmocom.org/cellular-infrastructure/libasn1c
git clone --depth 1 -b 0.6.0 https://gitea.osmocom.org/osmocom/libosmo-abis
git clone --depth 1 -b 1.0.1 https://gitea.osmocom.org/osmocom/libosmocore
git clone --depth 1 -b 0.4.0 https://gitea.osmocom.org/osmocom/libosmo-netif
git clone --depth 1 -b 1.0.0 https://gitea.osmocom.org/osmocom/libosmo-sccp
git clone --depth 1 -b 1.13.0 https://gitea.osmocom.org/cellular-infrastructure/libsmpp34
git clone --depth 1 -b 1.3.0 https://gitea.osmocom.org/cellular-infrastructure/openbsc
git clone --depth 1 -b 1.0.0 https://gitea.osmocom.org/cellular-infrastructure/osmo-bts
git clone --depth 1 -b 1.3.0 https://gitea.osmocom.org/cellular-infrastructure/osmo-ggsn
git clone --depth 1 -b 1.0.0 https://gitea.osmocom.org/cellular-infrastructure/osmo-hlr
git clone --depth 1 -b 0.4.0 https://gitea.osmocom.org/cellular-infrastructure/osmo-iuh
git clone --depth 1 -b 0.6.0 https://gitea.osmocom.org/cellular-infrastructure/osmo-pcu
git clone --depth 1 -b 1.4.0 https://gitea.osmocom.org/cellular-infrastructure/osmo-sgsn
git clone --depth 1 -b 1.2.0 https://gitea.osmocom.org/cellular-infrastructure/osmo-sip-connector
git clone --depth 1 -b 1.0.0 https://gitea.osmocom.org/cellular-infrastructure/osmo-trx

tar -cJvf osmocom_uhd.tar.xz l* o* u*

cd uhd/host
mkdir build
cd build
cmake ..
make -j4
sudo make install
sudo ldconfig

cd ../../../libosmocore
autoreconf -fi
./configure
make -j4
make check
sudo make install
sudo ldconfig
# 51/51

cd ../libosmo-abis
autoreconf -fi
./configure
make -j4
make check
sudo make install
sudo ldconfig
# 2/2

cd ../libosmo-netif
autoreconf -fi
./configure
make -j4
make check
sudo make install
sudo ldconfig
# 3/3

cd ../libosmo-sccp
autoreconf -fi
./configure
make -j4
make check
sudo make install
sudo ldconfig
# 5/5

cd ../libasn1c
autoreconf -fi
./configure
make -j4
make check
sudo make install
sudo ldconfig
#

cd ../libsmpp34
autoreconf -fi
./configure
make -j4
make check
sudo make install
sudo ldconfig
#

cd ../osmo-iuh
autoreconf -fi
./configure
make -j4
make check
sudo make install
sudo ldconfig
# 3/3

cd ../osmo-ggsn
autoreconf -fi
./configure
make -j4
make check
sudo make install
sudo ldconfig
# 5/5

cd ../osmo-sip-connector
autoreconf -fi
./configure
make -j4
make check
sudo make install
sudo ldconfig
#

cd ../osmo-trx
autoreconf -fi
./configure --with-uhd
make -j4
make check
sudo make install
sudo ldconfig
# 5/7

cd ../osmo-bts
autoreconf -fi
./configure --enable-trx
make -j4
make check
sudo make install
sudo ldconfig
# 8/8

cd ../osmo-pcu
autoreconf -fi
./configure
make -j4
make check
sudo make install
sudo ldconfig
# 12/12

cd ../openbsc/openbsc
autoreconf -fi
./configure --enable-mgcp-transcoding --enable-nat --enable-smpp --enable-osmo-bsc
make -j4
make check
sudo make install
sudo ldconfig
# 15/15

cd ../../osmo-hlr
autoreconf -fi
./configure
make -j4
make check
sudo make install
sudo ldconfig
# 5/5

cd ../osmo-sgsn
autoreconf -fi
./configure
make -j4
make check
sudo make install
sudo ldconfig
# 8/8

cd ../osmo-nitb-scripts
sudo bash install_services.sh

sudo uhd_images_downloader
