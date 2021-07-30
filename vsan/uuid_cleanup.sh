#Below script cleans up inaccsiable vsan objets ( uuids in the list) from the ESXI Hosts
#1. Login to ESXI Host
#2. Execute the following command on the ESXI shell
#3. Repeate the commands on all ESXI hosts part of the cluster 

### Example to delete the followning UUID objects
/usr/lib/vmware/osfs/bin/objtool delete -u 5cbc6460-09ea-baef-d51c-a4bf012facf3 -f -v 10
/usr/lib/vmware/osfs/bin/objtool delete -u 918e6460-5705-e2ef-fdb9-a4bf01304646 -f -v 10
/usr/lib/vmware/osfs/bin/objtool delete -u 6baedc60-a29c-b9f1-5f8c-a4bf01304696 -f -v 10
/usr/lib/vmware/osfs/bin/objtool delete -u 7f8e6460-ca8b-16f3-ddb0-a4bf01304646 -f -v 10
/usr/lib/vmware/osfs/bin/objtool delete -u 7d8e6460-e69d-22f7-6204-a4bf01304646 -f -v 10
