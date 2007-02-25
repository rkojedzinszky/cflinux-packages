#!/bin/sh

## startup script for bind9

## defaults
bind_enable="NO"
bind_flags="-u bind"

[ -f /etc/rc.conf ] && . /etc/rc.conf

# start bind if needed
case "$bind_enable" in
	[yY][eE][sS])
		mkdir -p /var/cache/bind
		chown bind:bind /var/cache/bind
		chmod 750 /var/cache/bind

		mkdir -p /var/run/bind/run
		chown bind /var/run/bind/run

		echo -n 'Starting domain name server:'
		/usr/local/sbin/named $bind_flags
		echo ' bind'
	;;
esac
