# Terraform

## Prerequisites
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- [Terraform CLI](https://developer.hashicorp.com/terraform/install)
- [1Password CLI](https://developer.1password.com/docs/cli/get-started)

## Resources
- [Documentation of AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/bedrock_provisioned_model_throughput)
- [Detecting and Managing Drift with Terraform](https://www.hashicorp.com/blog/detecting-and-managing-drift-with-terraform)
- [Modules in Package Sub-directories](https://developer.hashicorp.com/terraform/language/modules/sources#modules-in-package-sub-directories)
- [MySQL module](https://github.com/petoju/terraform-provider-mysql)
- [1Password Terraform docs](https://developer.1password.com/docs/terraform/)

## How to
Navigate to the desired example and edit the example to your liking. The run the following commands to apply
```shell
terraform init
terraform plan -var-file="./../secrets.tfvars" (change path to correct location of `secrets.tfvars`)
terraform apply -var-file="./../secrets.tfvars"
```

## TODO's
- [ ] Add remote backend
- [ ] README for modules
- [ ] README for examples
