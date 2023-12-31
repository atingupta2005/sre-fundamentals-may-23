# RBAC in Kubernetes

## First Enable AKS Cluster with AKS-managed Azure Active Directory feature 
#- Create Azure AD Group - k8sadmins
#- Associate a User to this Group
#- Settings -> Cluster Configuration -> Authentication and Authorization -> Azure AD Authentication with Kubernetes RBAC
#- Cluster admin ClusterRoleBinding: k8sadmins
#- Click on Apply

## Connect to AKS using AD authentication
# Configure kubectl
az logout
sudo rm -rf ~/.kube
az login --use-device-code
az account set --subscription 113c97f4-2269-4ed9-8617-6d504b86719c
az aks get-credentials --resource-group rgtrngaks --name akstrng --overwrite-existing
#wget https://github.com/Azure/kubelogin/releases/download/v0.0.30/kubelogin-linux-amd64.zip
#unzip kubelogin-linux-amd64.zip 
#sudo mv bin/linux_amd64/kubelogin /usr/bin/

# View Cluster Information
kubectl cluster-info

# List Nodes
kubectl get nodes

# List Pods
kubectl get pods -A

# List Everything
kubectl get all --all-namespaces

# Create Namespaces dev-$USER and qa-$USER
kubectl delete namespace dev-$USER qa-$USER
kubectl create namespace dev-$USER
kubectl create namespace qa-$USER

# Deploy Sample Application by you
cd ~/sre-fundamentals-may-23/Hands-on/06-Helm-charts/02-rbac
kubectl delete -f kube-manifests/01-Sample-Application -n dev-$USER
kubectl delete -f kube-manifests/01-Sample-Application -n qa-$USER
kubectl apply -f kube-manifests/01-Sample-Application -n dev-$USER
kubectl apply -f kube-manifests/01-Sample-Application -n qa-$USER

# Access dev-$USER Application by you
kubectl get svc -n dev-$USER

# Access qa-$USER Application
kubectl get svc -n qa-$USER


## Create AD Group, Role Assignment and User for dev-$USER
AKS_CLUSTER_ID=$(az aks show --resource-group rgtrngaks --name akstrng --query id -o tsv)
az ad group delete -g devaksteam-$USER
DEV_AKS_GROUP_ID=$(az ad group create --display-name devaksteam-$USER --mail-nickname devaksteam-$USER --query objectId -o tsv)

cat kube-manifests/02-Roles-and-RoleBindings/rolebinding-dev-namespace.yaml | grep "4123d819-9ed6-460b-8321-39f02157536b"
sed -i "s/4123d819-9ed6-460b-8321-39f02157536b/$DEV_AKS_GROUP_ID/g" kube-manifests/02-Roles-and-RoleBindings/rolebinding-dev-namespace.yaml
cat kube-manifests/02-Roles-and-RoleBindings/rolebinding-dev-namespace.yaml | grep "4123d819-9ed6-460b-8321-39f02157536b"
cat kube-manifests/02-Roles-and-RoleBindings/rolebinding-dev-namespace.yaml | grep "$DEV_AKS_GROUP_ID"

# Create Role Assignment 
az role assignment create --assignee $DEV_AKS_GROUP_ID --role "Azure Kubernetes Service Cluster User Role" --scope $AKS_CLUSTER_ID

# Create dev-$USER User
az ad user delete --id aksdev-$USER@atttrainings.com
DEV_AKS_USER_OBJECT_ID=$(az ad user create --display-name "AKS Dev1 $USER" --user-principal-name aksdev-$USER@atttrainings.com --password @AKSDemo123  --query objectId -o tsv)
echo $DEV_AKS_USER_OBJECT_ID

# Associate dev-$USER User to dev-$USER AKS Group
az ad group member add --group devaksteam-$USER --member-id $DEV_AKS_USER_OBJECT_ID

# Create Kubernetes Role and Role Binding
kubectl apply -f kube-manifests/02-Roles-and-RoleBindings

# Verify Role and Role Binding
kubectl get role -n dev-$USER
kubectl get rolebinding -n dev-$USER

## Access dev-$USER Namespace using aksdev-$USER AD User
# Overwrite kubectl credentials
sudo ls ~/.kube
sudo rm -rf ~/.kube
az logout
az login -u aksdev-$USER@atttrainings.com -p @AKSDemo123
az account set --subscription 113c97f4-2269-4ed9-8617-6d504b86719c
az account show
az aks get-credentials --resource-group rgtrngaks --name akstrng --overwrite-existing

kubectl get pods -n dev-$USER
kubectl get svc -n dev-$USER

# List Services from qa-$USER Namespace
kubectl get svc -n qa-$USER
# Forbidden Message should come when we list qa-$USER Namespace resources

