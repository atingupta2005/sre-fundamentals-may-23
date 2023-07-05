cd ~/sre-fundamentals-may-23/Hands-on/05-Kubernetes/07-k8s-dashboard
kubectl apply -f kube-manifests/

kubectl get all -n kubernetes-dashboard
kubectl get svc -n kubernetes-dashboard
kubectl get svc kubernetes-dashboard -n kubernetes-dashboard
kubectl get nodes -o wide

## Open below URL in Firefox
curl https://<ip-address>

kubectl describe  secrets dashboard-admin-token  -n kubernetes-dashboard

kubectl delete -f kube-manifests/
