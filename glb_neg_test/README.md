
# README.md 

## Overview
This Terraform configuration is designed to set up a basic infrastructure on Google Cloud Platform (GCP). It focuses on creating a Global Load Balancer (GLB) with associated backend services and network endpoint groups (NEGs). This setup is ideal for handling distributed, global traffic to your application.

## Prerequisites
- Terraform installed on your local machine.
- Access to a GCP account with permission to create and manage resources.
- GCP SDK and CLI tools configured for your project.

## Files Description
- **main.tf**: Defines the Google Cloud provider, a global compute address, and a backend service. It utilizes variables for project configuration.
- **outputs.tf**: Specifies outputs from the Terraform configuration, such as the IP address of the GLB.
- **terraform.tfvars**: Contains values for the variables defined in the configuration, such as the GCP project ID, region, NEGs, and GLB name.
- **variables.tf**: Defines variables used in the Terraform configuration, including their types and descriptions.

## Usage
1. **Initialization**: Run `terraform init` to initialize the Terraform working directory and download necessary plugins.
2. **Planning**: Execute `terraform plan` to preview the changes Terraform will make to your GCP infrastructure.
3. **Applying**: Use `terraform apply` to apply the changes. This will create the configured resources in your GCP project.
4. **Outputs**: After successful application, the IP address of the GLB will be displayed as an output.

## Customization
- You can modify the `terraform.tfvars` file to customize the project ID, region, NEGs, and GLB name according to your requirements.
- Additional customization can be done in `main.tf` to change or add more resources.

## Cleanup
To remove all the resources created by this Terraform configuration, run `terraform destroy`.
