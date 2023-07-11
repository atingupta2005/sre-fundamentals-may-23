# Install Kubernetes using Minikube
sudo apt-get update -y
sudo apt-get install curl
sudo apt-get install apt-transport-https
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube version

# Install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version -o json

# Start Kubernetes Server
minikube start

# Important commands
kubectl get po -A
kubectl config view
kubectl cluster-info
kubectl get nodes
kubectl get pod

# Install and configure Kubernetes master and nodes
kubectl get nodes
minikube status -p minikube
minikube node add
kubectl get nodes
minikube node list
minikube status -p minikube

# Stop and Delete Minikube
minikube stop
minikube status
