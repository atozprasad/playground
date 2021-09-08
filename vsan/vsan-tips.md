#VSAN TIPS N TRICKS


** Removing stale objects from VSAN data store **
Stale objects are VSAN objects from the previous life of ESXI server, and will be shown as error in the ESXI Skyline health report for not able to refer these obejcts anymore. We need to delete these stale objects in order to make VSAN healthy and usable. 
1. Login to vCenter using SSH
---
ssh root@vsphere-host-ip-or-dns
---
2. List the objects
---
/localhost/Datacenter/computers> vsan.check_state -r 0
---
3. Delete staled objects
---
/usr/lib/vmware/osfs/bin/objtool delete -u <object-id> -f -v 10
example : 
/usr/lib/vmware/osfs/bin/objtool delete -u 5cbc6460-09ea-baef-d51c-a4bf012facf3 -f -v 10
---

** Unsubscring ESXI Host from VSAN Clustera **
1. Login to esxi using SSH
---
ssh root@vsphere-host-ip-or-dns-name
---

2. List out VSAN Datastores before you leave the cluster
---
esxcli vsan storage list
---

3.Command to leave the vsane data store
---
esxcli vsan cluster leave
---

