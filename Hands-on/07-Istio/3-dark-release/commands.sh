kubectl delete -f ~/sre-fundamentals-may-23/Hands-on/05-Kubernetes/12-calculator-v2/kube-manifests
kubectl get all
kubectl apply -f ~/sre-fundamentals-may-23/Hands-on/05-Kubernetes/12-calculator-v2/kube-manifests
kubectl get all

cd ~/sre-fundamentals-may-23/Hands-on/07-Istio/3-dark-release/

kubectl delete -f .
kubectl apply -f .

kubectl get all  --all-namespaces | grep gateway
kubectl get pods  --all-namespaces | grep gateway

kubectl get pods -n istio-system | grep ingress
kubectl get service/istio-ingressgateway -n istio-system

kubectl logs -f pod/istio-ingressgateway-57988c96c4-xzz6n -n istio-system

curl --header "x-my-header: newrelease" http://4.227.229.62/

curl http://4.227.229.62/

kubectl delete -f .