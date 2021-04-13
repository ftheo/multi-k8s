# Installing kubectl
Might already be with Docker unfortunatelly
If not downloaed it from homebrew with
brew install kubectl

# Installing minicube
Needed for development locally of kubernetes
brew install minikube


minikube start
kubectl cluster-info  # Should show connection to minikube


eval $(minikube docker-env) # To see inside the K8 containers via docker



usefull commands
minikube delete # Delete the entire cluster
minikube start --kubernetes-version=v1.19.8 --driver=hyperkit # As of April 13 GKE is on 1.18 but we were on 1.20 by default
minikube profile list  # To see VM Driver
kubectl version --short  # To see client and server version of kubernetes

kubectl config get-clusters  # See all the clusters available
kubectl config current-context  # See which cluster we are currently using
kubectl config use-context minikube  # Use the minikube

# Cluster upgrade
Upgrading the control plane requires upgrade to the nodes as well which is slow

# To start a new complex minikube locally
minikube delete # Delete the entire cluster
minikube start --kubernetes-version=v1.19.8 --driver=hyperkit
minikube addons enable ingress