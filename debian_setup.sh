if [ "$(id -u)" -ne 0 ]
then
	echo "Run this script as root"
	exit 1
fi

echo "PATH=\$PATH:/usr/local/sbin:/usr/sbin:/sbin" | tee -a /home/$USER/.bashrc /root/.bashrc
echo "LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/usr/local/lib" | tee -a /home/$USER/.bashrc /root/.bashrc

/sbin/usermod -aG sudo $USER

mv /etc/apt/sources.list /etc/apt/sources.list.origin
echo "deb http://deb.debian.org/debian/ buster main contrib" | tee /etc/apt/sources.list
echo "Activate only useful repo in /etc/apt sources.list, to avoid futures incompatibilities, old configuration is stored in /etc/apt/sources.list.origin"

echo "Don't run this script again, this PC will reboot after 15s to take effect"

sleep 15

/sbin/reboot
