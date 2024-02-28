export KUBECONFIG=~/.kube/config

# kubectl apply -f crds/*.yaml
kubectl create namespace prometheus
kubectl apply -f prometheus.yaml
