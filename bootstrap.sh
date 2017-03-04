#!/bin/sh

GREP="/usr/bin/grep -q -i -l"
SYSRC="/usr/sbin/sysrc -q -f"

rm -rf /etc/ssh/ssh_host_*
rm -rf /usr/local/etc/rc.d/digitalocean*
rm -rf /usr/src
sync

install -v -o root -g wheel -m 0644 etc/rc.conf			/etc/rc.conf
install -v -o root -g wheel -m 0555 etc/rc.d/digitalocean	/etc/rc.d/digitalocean
install -v -o root -g wheel -m 0644 etc/ssh/banner		/etc/ssh/banner
install -v -o root -g wheel -m 0644 etc/ssh/sshd_config		/etc/ssh/sshd_config

pkg delete -y -a -f
env ASSUME_ALWAYS_YES=yes env PAGER=cat	freebsd-update fetch install
env ASSUME_ALWAYS_YES=yes		pkg bootstrap
pkg install -y sudo
pkg clean -y -a

if ((${GREP} zfs /boot/loader.conf*) && (${GREP} zroot /boot/loader.conf*)); then
  ${SYSRC} /etc/rc.conf zfs_enable="YES"
  zfs destroy -vr zroot/usr/src
fi

if ((/bin/freebsd-version | ${GREP} 10.3)); then
  patch -p0 /etc/defaults/rc.conf < etc/defaults/rc.conf_patch
fi

if ( ! (/sbin/ifconfig vtnet0 inet6 | ${GREP} disabled)); then
  ${SYSRC} /etc/rc.conf ifconfig_vtnet0_ipv6="inet6 -ifdisabled"
fi

echo "######################################################################" >> /etc/rc.conf

service sshd keygen
service digitalocean info

reboot
