cd ~/sre-fundamentals-may-23/Hands-on/05-Kubernetes/12-calculator-v2

kubectl delete -f kube-manifests
kubectl get all

kubectl apply -f kube-manifests
sleep 10
kubectl get pods

kubectl describe pod calculator-1-deployment-v2-7c9cc5dc8f-pkh45

kubectl get svc

kubectl delete -f kube-manifests
