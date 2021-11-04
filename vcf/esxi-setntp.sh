#!/bin/bash
USERNAME=root
#Only Hostnames not the IP address 
ESXIHOSTS="db-vcf-nesx01.vsanpe.vmware.com db-vcf-nesx02.vsanpe.vmware.com db-vcf-nesx03.vsanpe.vmware.com db-vcf-nesx04.vsanpe.vmware.com"

echo $ESXIHOSTS
for ESXIHOSTNAME in ${ESXIHOSTS} ; do
echo ${ESXIHOSTNAME}
SCRIPT="esxcli system ntp set --reset; esxcli system ntp set --server time2.vmware.com --server 10.166.1.120 --enabled true; ntpq -p; /etc/init.d/ntpd restart;"
    ssh -o StrictHostKeyChecking=no -l ${USERNAME} ${ESXIHOSTNAME} "${SCRIPT}"
done

