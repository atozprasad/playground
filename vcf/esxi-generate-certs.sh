#!/bin/bash
USERNAME=root
#Only Hostnames not the IP address 

FILENAME=./host_names.env
HOSTS=`cat $FILENAME`

for ESXIHOSTNAME in $HOSTS
do
	echo -e "\nEnter Password for ssh root@${ESXIHOSTNAME}"
	SCRIPT="esxcli vsan cluster leave;esxcli system settings advanced set -o /VSAN/FakeSCSIReservations -i 1; esxcli system hostname set --fqdn=${ESXIHOSTNAME};/etc/init.d/ntpd restart;/sbin/generate-certificates && /etc/init.d/hostd restart && /etc/init.d/vpxa restart"
	ssh -o StrictHostKeyChecking=no -l ${USERNAME} ${ESXIHOSTNAME} ${SCRIPT}
done
