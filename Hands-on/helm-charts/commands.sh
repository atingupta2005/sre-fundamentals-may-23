## Install Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
helm version


## Helm-Repo-Introduction
helm repo add stable https://charts.helm.sh/stable
helm repo update

## 02-Helm-Chart-Install
helm repo list
helm search hub mysql
helm show chart stable/mysql
helm inspect stable/mysql

### helm install test ./portail-web -n test-namespace --dry-run    --values=values.yml  --wait
###             <name>   <helm chart>  [namespace]       [test debug] [new values]         [synchronous]


helm install stable/mysql --generate-name
kubectl get all 

helm install myairflow stable/airflow
helm status myairflow

helm ls 

helm uninstall airflow

helm ls 

## helm-chart-template-getting-started
helm create mychart

tree mychart

helm install mychart2 ./mychart

helm upgrade mychart2 ./mychart --values=new-values.yml

helm status mychart2

helm history mychart2

helm rollback mychart2 1

helm ls

kubectl get all

helm get manifest mychart2

kubectl describe configmaps mychart2

helm uninstall mychart2

## Helm-Chart-Template-Read-Value
cat mychart/values.yaml
  
helm install --debug --dry-run firstdryrun ./mychart
helm install firstvalue ./mychart
helm get manifest firstvalue


## Helm-Chart-Template-Value-Set
helm install --dry-run --debug --set costCode=CC00000 valueseteg ./mychart

helm install valueseteg ./mychart --set costCode=CC00000 

helm get manifest valueseteg

kubectl describe configmaps valueseteg-configmap

helm ls

helm uninstall valueseteg


