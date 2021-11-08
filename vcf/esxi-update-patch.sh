#!/bin/bash
USERNAME=root
#Only Hostnames not the IP address 

FILENAME=./host_names.env
HOSTS=`cat $FILENAME`

for ESXIHOSTNAME in $HOSTS
do
	### Trim Hostname string
	ESXIHOSTNAME=`echo $ESXIHOSTNAME | sed -e 's/^[[:space:]]*//'`
	### Ignoring any comments
	if [ ${ESXIHOSTNAME}::1 == '#' ]  
	then 
		continue;
	fi 
	echo -e "\nEnter Password for ssh root@${ESXIHOSTNAME}"
	echo "#Updating to ESXi-7.0U1d-17551050-standard "
	SCRIPT="esxcli software profile update -p ESXi-7.0U1d-17551050-standard -d https://hostupdate.vmware.com/software/VUM/PRODUCTION/main/vmw-depot-index.xml; reboot -f " 
	ssh -o StrictHostKeyChecking=no -l ${USERNAME} ${ESXIHOSTNAME} ${SCRIPT}
done
