# RBAC in Kubernetes

## First Enable AKS Cluster with AKS-managed Azure Active Directory feature 
- Create Azure AD Group - k8sadmins
- Associate a User to this Group
- Settings -> Cluster Configuration -> Authentication and Authorization -> Azure AD Authentication with Kubernetes RBAC
- Cluster admin ClusterRoleBinding: k8sadmins
- Click on Apply

## Connect to AKS using AD authentication
# Configure kubectl
az account set --subscription 113c97f4-2269-4ed9-8617-6d504b86719c
az aks get-credentials --resource-group rgtrngaks --name akstrng --overwrite-existing

sudo apt update
sudo apt install snapd
sudo snap install kubelogin

# View Cluster Information
kubectl cluster-info

# List Nodes
kubectl get nodes

# List Pods
kubectl get pods -A

# List Everything
kubectl get all --all-namespaces

# Create Namespaces dev and qa
kubectl create namespace dev
kubectl create namespace qa

# Deploy Sample Application by you
kubectl apply -f kube-manifests/01-Sample-Application -n dev
kubectl apply -f kube-manifests/01-Sample-Application -n qa

# Access Dev Application by you
kubectl get svc -n dev

# Access QA Application
kubectl get svc -n qa


## Create AD Group, Role Assignment and User for Dev
AKS_CLUSTER_ID=$(az aks show --resource-group rgtrngaks --name akstrng --query id -o tsv)
DEV_AKS_GROUP_ID=$(az ad group create --display-name devaksteam --mail-nickname devaksteam --query objectId -o tsv)

# Create Role Assignment 
az role assignment create --assignee $DEV_AKS_GROUP_ID --role "Azure Kubernetes Service Cluster User Role" --scope $AKS_CLUSTER_ID

# Create Dev User
az ad user delete --id aksdev1@atttrainings.com
DEV_AKS_USER_OBJECT_ID=$(az ad user create --display-name "AKS Dev1" --user-principal-name aksdev1@atttrainings.com --password @AKSDemo123  --query id -o tsv)
echo $DEV_AKS_USER_OBJECT_ID

# Associate Dev User to Dev AKS Group
az ad group member add --group devaksteam --member-id $DEV_AKS_USER_OBJECT_ID

# As AKS Cluster Admin (--admin)
az aks get-credentials --resource-group rgtrngaks --name akstrng --admin

# Create Kubernetes Role and Role Binding
kubectl apply -f kube-manifests/02-Roles-and-RoleBindings

# Verify Role and Role Binding
kubectl get role -n dev
kubectl get rolebinding -n dev

## Access Dev Namespace using aksdev1 AD User
# Overwrite kubectl credentials
ls C:/Users/atingupta2005/.kube/config
rm -rf C:/Users/atingupta2005/.kube/config
az aks get-credentials --resource-group rgtrngaks --name akstrng --overwrite-existing

kubectl get pods -n dev
kubectl get svc -n dev

# List Services from QA Namespace
kubectl get svc -n qa
# Forbidden Message should come when we list QA Namespace resources

