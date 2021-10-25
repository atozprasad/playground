#!/bin/bash

echo -e "\n Source supervisor.env file"
source supervisor.env
echo -e "\n Login to vSphere supervisor cluster using \"kubectl vsphere login \" " 

kubectl vsphere login --server https://${SUPERVISOR_CLUSTER_IP} --insecure-skip-tls-verify  -u ${SUPERVISOR_CLUSTER_USER}
kubectl config use-context ${VS_NAMESPACE}

echo -e "\n configing tanzu CLI using the using \"tanzu login \" "
tanzu login --name supervisor --kubeconfig ~/.kube/config --context ${SUPERVISOR_CLUSTER_IP}

