cd ~/sre-fundamentals-may-23/Hands-on/05-Kubernetes/04-Persistent-and-ephemeral-volumes/05-02-UserMgmt-WebApp-with-MySQLDB/

# Deploy UserManagement Web Application with MySQL Database

# Create Deployment & LoadBalancer Service
kubectl apply -f kube-manifests/

sleep 10

# List Pods
kubectl get pods

# Verify logs of Usermgmt Web Application Pod
kubectl logs -f POD_NAME
# Press CTRL+C to come out


# Verify sc, pvc, pv
kubectl get sc,pvc,pv


#- **Access Application**

# List Services
kubectl get svc usermgmt-webapp-service
kubectl get nodes -o wide

# Access Application
curl node_ip:port
#Username: admin101
#Password: password101


# Connect to MYSQL Database
kubectl run -it --rm --image=mysql:5.6 --restart=Never mysql-client -- mysql -h mysql -pdbpassword11


# Verify usermgmt schema got created which we provided in ConfigMap
show schemas;
use webappdb;
show tables;
select * from user;
exit

# Delete All
kubectl delete -f kube-manifests/

kubectl get all

# Delete PV Exclusively
kubectl get pv

kubectl delete pv PV_NAME

#- Delete Azure Disks
#  - Go to All Services -> Disks -> Select and Delete the Disk
