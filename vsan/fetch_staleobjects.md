#1. Login to vCenter

#2. List the objects
/localhost/Datacenter/computers> vsan.check_state -r 0
#3
#2.Execute the command 
#3 Delete staled objects
/usr/lib/vmware/osfs/bin/objtool delete -u <object-id> -f -v 10
example : 
/usr/lib/vmware/osfs/bin/objtool delete -u 5cbc6460-09ea-baef-d51c-a4bf012facf3 -f -v 10
