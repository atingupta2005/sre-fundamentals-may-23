#-------Deploy Docker image in Kubernetes
kubectl create deployment hello-world-rest-api --image=atingupta2005/hello-world-rest-api:0.0.1.RELEASE
kubectl expose deployment hello-world-rest-api --type=NodePort --port=8080
kubectl get service
kubectl get pods
kubectl scale deployment hello-world-rest-api --replicas=3
kubectl get pods

#--------Pods
#Pod is the smallest deployable unit. Can not have container without Pod. Container lives inside Pod
kubectl get pods
kubectl get pods -o wide

# To get details about the artifact
kubectl explain pods

# Get more details of the pod
kubectl describe pod <pod-name>

kubectl get pods
kubectl delete pod <pod-name>
kubectl get pods

#--------Get list of various artifacts
kubectl get all
kubectl get events
kubectl get pods
kubectl get replicaset
kubectl get deployment
kubectl get service

#------Replicaset
kubectl get replicasets
# Since we are telling that how much replicas we need, a replicaset will take care of it.
kubectl scale deployment hello-world-rest-api --replicas=4
kubectl get pods
kubectl get replicaset
kubectl get events --sort-by=.metadata.creationTimestamp
kubectl get rs -o wide

# Lets delete one Pod and see how its auto created. Please note that use correct Pod ID
kubectl delete pod <pod-name>
kubectl get pods -o wide
kubectl delete pod <pod-name>
kubectl get pods -o wide

#4.------------Deployment
# Deployment ensures the release upgrades without any issue.
# We don’t want to have the downtime while release upgrade and Deployment plays a key role in achieving that
# There are many deployment strategies - Rolling Update
# Whenever we want to deploy new release of our existing application, we desire zero downtime
# If we change the image and that image is not existing, it will not deploy that
kubectl set image deployment hello-world-rest-api hello-world-rest-api=DUMMY_IMAGE:TEST

kubectl get service
# Now if we check in browser the old version is still running

#If we check our replicasets, then there are 2 replicasets. One with old image, other for error image
kubectl get rs -o wide

#We will see that there are 4 Pods, 3 are for old image, and new one has invalid status
kubectl get pods

#Check the details of the error pod
kubectl describe pod <pod-name>

#Check the series of events and notice in the last that how image has been marked as invalid
kubectl get events --sort-by=.metadata.creationTimestamp

#So there is rolling update is in force, it create 1 more replicaset and initiate 1 pod at a time and deletes 1 pod.
# Now let's set the correct image and see the effect
kubectl set image deployment hello-world-rest-api hello-world-rest-api=atingupta2005/hello-world-rest-api:0.0.2.RELEASE

#Now check in the browser, how the app version is changing gradually
kubectl get service

# Lets see the events which occurred. 
# You will notice that Deployment is regularly updating the replication configuration like:
# Old:2/New:1
# Old:1/New:2
# Old:0/New:3
kubectl get events --sort-by=.metadata.creationTimestamp

# Summary: Deployment is really useful to make sure that we are able to 
# update new releases of application without downtime
# Strategy used by Deployment is called "Rolling Update"

kubectl get pods -o wide
kubectl get rs

#5.---------------Services
#If we delete the Pod then its auto created. Also each time the Private IP of Pod is changed
kubectl delete pod <pod-name>
kubectl get pods -o wide
kubectl delete pod <pod-name>
kubectl get pods -o wide

#We don't want to give a new IP every time.
#We need a single IP. Kubernetes provides Service for that purpose.
#It does the mapping of Single IP with the POD IP
#Role of the service is to always provide the single IP

kubectl get service -o wide

#-----------Generate Kubernetes YAML Configuration for Deployment and Service
#Till now we have used command line to create our pods and services
#In real world scenario we need to use YAML files

kubectl get deployment hello-world-rest-api

kubectl get deployment hello-world-rest-api -o wide
kubectl get deployment hello-world-rest-api -o yaml
kubectl get deployment hello-world-rest-api -o yaml > deployment.yaml
kubectl get service hello-world-rest-api -o yaml
kubectl get service hello-world-rest-api -o yaml > service.yaml

#-------------Playing with Kubernetes Commands - Top Node and Pod
#Fetches PODS from all namespaces
kubectl get pods --all-namespaces

kubectl get services --all-namespaces

#To get the utilization details of the nodes
kubectl top node

#To get the utilization details of the pods
kubectl top pod

#Short commands
kubectl get services
kubectl get svc
kubectl get ev  #Events 
kubectl get rs  # Replicaset

kubectl get ns  #Namespace
kubectl get nodes
kubectl get no  #Nodes
kubectl get po  #Pods
