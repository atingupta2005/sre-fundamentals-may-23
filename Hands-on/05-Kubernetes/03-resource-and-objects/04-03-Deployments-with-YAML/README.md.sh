cd ~/sre-fundamentals-may-23/Hands-on/05-Kubernetes/03-resource-and-objects/04-03-Deployments-with-YAML/

# Deployments with YAML
# Create Deployment

kubectl apply -f kube-manifests/02-deployment-definition.yml

kubectl get deploy


kubectl get rs


kubectl get pods


# Create LoadBalancer Service
kubectl apply -f kube-manifests/03-deployment-LoadBalancer-service.yml


# List Service
kubectl get svc deployment-loadbalancer-service

kubectl get po


# Access Application

# Cleanup
kubectl delete -f kube-manifests/
