cd ~/sre-fundamentals-may-23/Hands-on/05-Kubernetes/12-calculator-v1

kubectl delete -f kube-manifests
kubectl apply -f kube-manifests

kubectl get pods
kubectl get svc

kubectl delete -f kube-manifests
