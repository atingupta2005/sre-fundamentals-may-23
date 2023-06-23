# get terraform version
terraform version
# Terraform v0.13.5

# get terraform commands
terraform

# init terraform's Azure provider (main.tf)
terraform init

# display the terraform template
cat main.tf

# plan and preview terraform changes
terraform plan -var="resoure_group_name=demorg" -var="resoure_group_location=westus" -var="virtual_network_name=demovnet" -var="subnet_name=demosubnet"


# deploy terraform infra
terraform apply -var="resoure_group_name=demorg" -var="resoure_group_location=westus" -var="virtual_network_name=demovnet" -var="subnet_name=demosubnet"

# destroy infra
terraform destroy
