cd ~/sre-fundamentals-may-23/Hands-on/05-Kubernetes/06-todo-web-app

# Deploy UserManagement Web Application with MySQL Database

# Create Deployment & LoadBalancer Service
kubectl apply -f kube-manifests/mysql
sleep 60
kubectl apply -f kube-manifests/web-app
sleep 10

# List Pods
kubectl get pods

# Verify logs of Usermgmt Web Application Pod
kubectl logs -f pod_name
# Press CTRL+C to come out


# Verify sc, pvc, pv
kubectl get sc,pvc,pv


#- **Access Application**

# List Services
kubectl get svc
kubectl get nodes -o wide

# Access Application
curl node_ip:port

#Username: admin101
#Password: password101


# Delete All
kubectl delete -f kube-manifests/mysql/
kubectl delete -f kube-manifests/web-app/

kubectl get all


# Verify sc, pvc, pv
kubectl get sc,pvc,pv


# Delete PV Exclusively
kubectl get pv

kubectl delete pv PV_NAME

#- Delete Azure Disks
#  - Go to All Services -> Disks -> Select and Delete the Disk

