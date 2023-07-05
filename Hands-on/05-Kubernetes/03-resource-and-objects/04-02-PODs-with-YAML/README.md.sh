cd ~/sre-fundamentals-may-23/Hands-on/05-Kubernetes/03-resource-and-objects/04-02-PODs-with-YAML

# PODs with YAML
# Create Pod
kubectl apply -f kube-manifests/02-pod-definition.yml

# List Pods
kubectl get pods

# Create Service
kubectl apply -f kube-manifests/03-pod-LoadBalancer-service.yml

# List Service
kubectl get svc

# Access Application

kubectl delete -f kube-manifests/02-pod-definition.yml
kubectl delete -f kube-manifests/03-pod-LoadBalancer-service.yml
