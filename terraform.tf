/*
The terraform block contains Terraform settings, including the required providers
used to provision the infrastructure. It is recommended to setting a version
constraint so that Terraform doesn't install a version of the provider that doesn't
work with the pre-defined configuration.
*/
terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.55.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.4.3"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.4"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.2.0"
    }
  }

  required_version = "~> 1.3"
}
