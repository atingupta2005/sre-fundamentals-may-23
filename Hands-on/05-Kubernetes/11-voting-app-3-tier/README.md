Refer the architecture of the app in Kubernetes is shown in architecture.png


Starting the application services and deployments:

<!-- deployments -->
kubectl create -f db_deployment.yaml
kubectl create -f redis_deployment.yaml
kubectl create -f worker_deployment.yaml
kubectl create -f voting_app_deployment.yaml
kubectl create -f result_app_deployment.yaml
<!-- ClusterIP services -->
kubectl create -f redis_service.yaml
kubectl create -f db_service.yaml
<!-- NodePort services to expose and make accissible -->
kubectl create -f voting_app_service.yaml
kubectl create -f result_app_service.yaml


<!-- To get the URL -->
<!-- use the result to open in browser -->
minikube service voting-app-service  --url  
minikube service result-app-service  --url 