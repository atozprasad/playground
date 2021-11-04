#!/bin/bash
USERNAME=root
#Only Hostnames not the IP address 
HOSTS="db-vcf-nesx01.vsanpe.vmware.com db-vcf-nesx02.vsanpe.vmware.com db-vcf-nesx03.vsanpe.vmware.com db-vcf-nesx04.vsanpe.vmware.com "
for HOSTNAME in ${HOSTS} ; do
SCRIPT="reboot -f"
    ssh -o StrictHostKeyChecking=no -l ${USERNAME} ${HOSTNAME} "${SCRIPT}"
done

