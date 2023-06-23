# get terraform version
terraform version
# Terraform v0.13.5

# get terraform commands
terraform

# init terraform's Azure provider (main.tf)
terraform init

# display the terraform template
cat main.tf

# Review the terraform plan
terraform plan -var-file="dev.tfvars"
terraform plan -var-file="qa.tfvars"

# Terraform Apply - Dev Environment
terraform apply -var-file="dev.tfvars"

# Terraform Apply - QA Environment
# DONT DO THIS FROM SAME WORKING DIRECTORY AS OF NOW
terraform apply -var-file="qa.tfvars"

# destroy infra
terraform destroy
