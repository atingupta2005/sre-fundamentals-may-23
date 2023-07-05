cd ~/sre-fundamentals-may-23/Hands-on/05-Kubernetes/08-debugging

# Debugging in Kubernetes
## Obtaining Information About Your Clusters
```
kubectl cluster-info
```

## Getting the Status of Your Node
```
kubectl get nodes
```


## Getting Activities in Your Cluster
#- Viewing all of the events that have taken place on your cluster is another effective way to debug your cluster
#- You can spot any error that occurred while a particular action was carried out on your cluster namespace.
```
kubectl get events -A
```

## Pod Errors
```
kubectl get pods -A
kubectl describe pod <pod-name>
```


## Pod Level Logging
```
kubectl get logs <pod-name>
```

## Using Exec to Debug
```
kubectl exec -it <pod-name> -- /bin/bash
```

kubectl get service -o wide
kubectl get pods -A
kubectl describe svc <service-name>

kubectl explain pod
kubectl explain svc
