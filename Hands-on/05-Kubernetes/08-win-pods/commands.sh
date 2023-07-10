cd Hands-on/05-Kubernetes/08-win-pods

#-------Deploy Docker image in Kubernetes
kubectl get all
kubectl apply -f kube-manifests/
kubectl get pods -o wide
kubectl get deployment -o wide

kubectl get service
kubectl get pods -o wide

kubectl delete -f kube-manifests/
