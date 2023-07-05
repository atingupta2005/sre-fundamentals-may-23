AKS_NAME="akstrng"
AKS_RG="rgtrngaks"
mylocation="EASTUS"

az login -u u13@atttrainings.com -p <Password>
az account set --subscription "113c97f4-2269-4ed9-8617-6d504b86719c"

#- Connect to AKS (If Required)
az aks get-credentials --resource-group $AKS_RG --name $AKS_NAME --admin --overwrite-existing

# Install Kubectl (First time)
#sudo snap install kubectl --classic

kubectl create namespace "ns-$USER"

kubectl config set-context --current --namespace="ns-$USER"

kubectl get namespaces

# Get all my pods
kubectl get pods
