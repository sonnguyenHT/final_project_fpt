# pre config minikube
minikube config set driver virtualbox 
minikube config set cpus 2 
minikube config set memory 4000
minikube config set disk-size 10GB
# minikube config set host-only-cidr 192.168.100.0/24
minikube config set kubernetes-version v1.28.3
minikube config set container-runtime docker
minikube config set disable-driver-mounts true
#minikube config set -v 
minikube logs --file=logs.txt
minikube config set bootstrapper kubeadm
# create minikube cluster with 3 nodes and set static ip for each node
minikube start --nodes 3 -p minikube
#check cluster
kubectl get nodes
kubectl label node minikube-m02 node-role.kubernetes.io/worker=worker
kubectl label node minikube-m03 node-role.kubernetes.io/worker=worker
# start ingress add-on minikube
minikube addons enable ingress -p minikube
# check ingress
kubectl get pods -n ingress-nginx
# run components
# apply argocd
export KUBECONFIG=~/.kube/config

kubectl create namespace argocd
kubectl apply -f argocd/install.yaml -n argocd
# apply ingress argocd for minikube
kubectl create secret tls self-tls --key $path_cert/privkey1.pem --cert $path_cert/cert1.pem -n argocd 
kubectl apply -f argocd/ingress.yaml
# Get the current IP of argocd.thaison.cloud from /etc/hosts
current_ip=$(grep 'argocd.thaison.cloud' /etc/hosts | awk '{print $1}')

# Get the current IP of Minikube
minikube_ip=$(minikube ip)

# Compare the two IPs
if [ "$current_ip" != "$minikube_ip" ]; then
    # If they differ, delete the old entry from /etc/hosts
    sudo sed -i "/argocd.thaison.cloud/d" /etc/hosts

    # And add the new entry with the current Minikube IP
    echo "$minikube_ip argocd.thaison.cloud" | sudo tee -a /etc/hosts
fi
# create ingress argocd.thaison.cloud for minikube
# apply prometheus-grafana-stack
# application/prometheus/run.sh
