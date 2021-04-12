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