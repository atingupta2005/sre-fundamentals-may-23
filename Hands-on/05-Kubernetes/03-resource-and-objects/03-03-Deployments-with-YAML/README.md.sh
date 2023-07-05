cd ~/sre-fundamentals-may-23/Hands-on/05-Kubernetes/03-resource-and-objects/03-03-Deployments-with-YAML/

# Deployments with YAML
# Create Deployment

kubectl apply -f kube-manifests/02-deployment-definition.yml

kubectl get deploy


kubectl get rs


kubectl get pods


# Create LoadBalancer Service
kubectl apply -f kube-manifests/03-deployment-LoadBalancer-service.yml

kubectl get po

# List Service
kubectl get svc deployment-loadbalancer-service

kubectl get nodes -o wide

# Access Application
#curl node_ip:port
curl 20.124.183.28:30765

# Cleanup
kubectl delete -f kube-manifests/

kubectl get all
