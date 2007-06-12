#!/bin/sh

## startup script for dnscache

## defaults
dnscache_enable="NO"
dnscache_root="/usr/local/etc/dnscache/root"
dnscache_cachesize="33554432"	# 32M
dnscache_ip="0.0.0.0"		# ip to bind to
dnscache_ipsend="0.0.0.0"	# ip used to send packets
dnscache_user="nobody"		# user to run as
dnscache_seed="/usr/local/etc/dnscache/seed"

[ -f /etc/rc.conf ] && . /etc/rc.conf

# start dnscache if needed
case "$dnscache_enable" in
	[yY][eE][sS])
		echo -n 'Starting domain name cache server:'
		while sleep 1 ; do
			env ROOT=$dnscache_root CACHESIZE=$dnscache_cachesize \
				IP=$dnscache_ip IPSEND=$dnscache_ipsend \
				UID=$(id -u $dnscache_user) GID=$(id -g $dnscache_user) \
				/usr/local/bin/dnscache \
				< $dnscache_seed > /dev/null 2>&1
		done < /dev/null > /dev/null 2>&1 &
		echo ' dnscache'
	;;
esac
