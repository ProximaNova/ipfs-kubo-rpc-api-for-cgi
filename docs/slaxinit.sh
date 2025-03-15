#!/bin/bash
#docs/slaxinit.sh
#<s>Don't load the whole OS into RAM from the boot option! It seems that that leads to unfixable network problems! All loaded into RAM = uptime of like 2 days max before a problem, else, uptime of 6 days with on problems</s>
#[...]ctrl+alt+f1[...]
# Have to do this part manually
#umount /media/sd*
#mkdir /mnt/z5
#mount /dev/disk/by-id/usb-WD_easystore_2648_575831324433324B31455355-0:0-part1 /mnt/z5 # crappy model of 5TB HDD: don't use it because it fails very quickly
#cd /mnt/z5/hpc

#. ./thisscript.sh
rfkill unblock all
cp -n wlo1.conf /etc/wpa_supplicant/
wpa_supplicant -B -i wlo1 -c /etc/wpa_supplicant/wlo1.conf
adduser guest sudo
passwd guest # Have to do this manually? No, just enter the password correctly both times when it asks you
dhclient
apt install sudo openssh-server vlock -y
rsync -a --info=progress2 etc-ssh/ /etc/ssh/ # must rsync as root, otherwise it doesn't fully work
rsync -a --info=progress2 home-guest/.ssh/ /home/guest/.ssh/
dhcp="$(ifconfig wlo1 | grep "inet " | awk '{print $2}')"
ip link set wlo1 down
ip addr del $dhcp/24 dev wlo1
ip addr add 10.0.0.229/24 dev wlo1 #broadcast 10.0.0.255
ip link set wlo1 up
ip route add default via 10.0.0.1
echo -ne "\033[9;5]" > /dev/tty1
apt install vim xxd lynx curl htop screen nginx bc tor torsocks gpg jq apache2 pv tint ffmpeg -y
cp -n ipfs /usr/local/bin/
cp -n yt-dlp /usr/bin/ # version 2025.02.19
ipfs swarm peers | wc -l; ipfs stats bw; ps aux | grep ipfs | grep -v grep | grep ipfs; ps -o etime $(ps aux | grep "ipfs daemon" | grep -v grep | awk '{print $2}'); df --block-size=1 /; df -h /
p=0.85 # A thermal shutdown can still happen at 0.85; in fact, I'm not sure that this section does anything to prevent such shutdowns.
cpu0=/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq; cpumax=$(cat $cpu0); throttle=$(echo $cpumax \* $p | bc -l | sed "s/\..*//g"); echo $cpumax; echo $throttle; echo $throttle > $cpu0; cat $cpu0
cpu1=/sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq; cpumax=$(cat $cpu1); throttle=$(echo $cpumax \* $p | bc -l | sed "s/\..*//g"); echo $cpumax; echo $throttle; echo $throttle > $cpu1; cat $cpu1
cpu2=/sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq; cpumax=$(cat $cpu2); throttle=$(echo $cpumax \* $p | bc -l | sed "s/\..*//g"); echo $cpumax; echo $throttle; echo $throttle > $cpu2; cat $cpu2
cpu3=/sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq; cpumax=$(cat $cpu3); throttle=$(echo $cpumax \* $p | bc -l | sed "s/\..*//g"); echo $cpumax; echo $throttle; echo $throttle > $cpu3; cat $cpu3
apt update
grep security /etc/apt/sources.list | tee /etc/apt/security.sources.list
rsync -a --info=progress2 etc-ssl/ /etc/ssl/; rsync -a --info=progress2 etc-apache2/ /etc/apache2/; rsync -a --info=progress2 usr-lib-cgi-bin/ /usr/lib/cgi-bin/; rsync -a --info=progress2 etc-nginx/ /etc/nginx/; rsync -a --info=progress2 etc-tor/ /etc/tor/; rsync -a --info=progress2 var-lib-tor/ /var/lib/tor/
systemctl restart tor
sed -i "s/\/root:\/bin\/bash/\/root:\/usr\/sbin\/nologin/g" /etc/passwd
echo -e 'export PATH=$PATH:/usr/sbin\nalias utc="date -u +%Y-%m-%dT%H:%M:%S.%NZ"\nalias l="ls -CF"\nalias ws="wget --spider --no-check-certificate"\nexport IPFS_PATH=/mnt/z5/ipfs' >> /home/guest/.bashrc
systemctl restart sshd
apt remove chromium chromium-common chromium-sandbox galculator connman-gtk libfm-gtk4:i386 gtk-update-icon-cache gtk2-engines-murrine:i386 libdbusmenu-gtk3-4:i386 murrine-themes xarchiver libxfce4ui-common adwaita-icon-theme gconf2-common libfm-gtk-data libgtk-3-common libgtk2.0-common -y # dpkg -l | cat | grep -i "gtk\|xfce\|gnome"
# FUSE-mount IPFS (https://github.com/ipfs/kubo/issues/10340 - checklist)
#ipfs config --json Mounts.FuseAllowOther true # run once
sed -i "s/#user_allow_other/user_allow_other/g" /etc/fuse.conf
mkdir /ipfs /ipns; chown guest /ipfs /ipns

#apt upgrade -o Dir::Etc::SourceList=/etc/apt/security.sources.list -y # Don't run this in GNU Screen or over ssh
#sudo systemctl restart nginx; sudo systemctl restart apache2 # restart web servers and start up IPFS only after upgrading

#ssh guest@10.0.0.229 # from another computer
#a() { crontab -l; echo "#0 0 * * * find /home/guest/.ipfs -type f -name *.data -delete"; echo "0 0 * * * ipfs repo gc"; }
#a > cron; crontab "cron" # not ran as root
#ipfs daemon --mount & disown #; sleep 9; ipfs --timeout=60s resolve /ipns/k51qzi5uqu5diwzufekv38cynmdqlh0lwic1ve0d9w5a0glpy52qjc0l77h4t5; mfsroot=$(ssh u@10.0.0.232 "export IPFS_PATH=/zc/ipfs; ipfs files stat / | head -n1"); date -u; ipfs name publish $mfsroot; date -u; ipfs ls /ipns/k51qzi5uqu5diwzufekv38cynmdqlh0lwic1ve0d9w5a0glpy52qjc0l77h4t5
