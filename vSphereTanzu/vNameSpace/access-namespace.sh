#!/bin/bash
source namespace.env
kubectl vsphere login --server https://${NS_INGRESS_IP} --insecure-skip-tls-verify  -u ${NS_ADMIN_UNAME} 
kubectl config use-context ${VS_NAMESPACE}
