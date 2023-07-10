# Helm Charts

## What is?
- The package manager for Kubernetes; Helm is the best way to find, share, and use software built for Kubernetes
- A tool for Kubernetes packages called charts
- A chart contains pre-configured Kubernetes resources such as ConfigMaps, Deployments , and StatefulSet manifests, PersistentVolumes , and editable settings for them
- As such, a chart may be seen as a bundle of resources that, if connected together, can create a complex Kubernetes deployment with multiple prerequisites
- Charts are the convenient way to tell the Kubernetes api-server which resources a given application needs to properly run in Kubernetes.

## Chart Structure
```
├── Chart.yaml (meta info about chart)
├── templates (the actual template files)
│   ├── service.yaml
│   └── replicaset.yaml
├── charts (chart dependencies)
│   ├── nginx-ingress-1.1.2.tgz
├── requirements.yaml
└── values (values for template files)
```

## Securing Helm Charts
- Store the charts in a Git repository.
- Use helm lint or any other linter you prefer to verify the Helm charts are properly formed
- Use consistent versioning on your charts
- There are two different versions you can use: the version of the chart itself (version in the Chart.yaml file) and the version of the application (appVersion).
- Create test scenarios for your Helm charts to cover your use cases.
- Use Role-based access control (RBAC) to limit the object's permissions
- Don't trust the Helm charts blindly, especially third-party ones.
- Use helm verify to check the digital signatures of the charts you use to make sure you are using the charts you are supposed to.
- Always try to keep the Helm Charts you use updated
