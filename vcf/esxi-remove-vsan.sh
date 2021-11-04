#!/bin/bash
USERNAME=root
#Only Hostnames not the IP address 
ESXIHOSTS="db-vcf-nesx01.vsanpe.vmware.com db-vcf-nesx02.vsanpe.vmware.com db-vcf-nesx03.vsanpe.vmware.com db-vcf-nesx04.vsanpe.vmware.com "
SCRIPT=" esxcli vsan storage list; esxcli vsan cluster leave; esxcli system settings advanced set -o /VSAN/FakeSCSIReservations -i 1; esxcli system hostname set --fqdn=${HOSTNAME};/etc/init.d/ntpd restart; /sbin/generate-certificates && /etc/init.d/hostd restart && /etc/init.d/vpxa restart; "
for ESXIHOSTNAME in ${ESXIHOSTS} ; do
echo "Enter password for ${ESXIHOSTNAME}"
    ssh -o StrictHostKeyChecking=no -l ${USERNAME} ${ESXIHOSTNAME} "${SCRIPT}"
done

