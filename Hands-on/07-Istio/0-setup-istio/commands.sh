cd ~/sre-fundamentals-may-23/Hands-on/07-Istio/0-setup-istio

kubectl get all

## Apply istio and kiali ## (Only one time)
kubectl delete -f .
kubectl apply -f 1-istio-init.yaml
sleep 10
kubectl apply -f 2-istio-kubernetes.yaml

## Label your namespace ##
kubectl label ns ns-$USER istio-injection=enabled

sleep 120

kubectl get pods -n istio-system

kubectl get svc -n istio-system

## Check Kiali in the browser
kubectl get nodes -o wide
kubectl get svc kiali -n istio-system

