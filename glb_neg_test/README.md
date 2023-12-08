
### README.md for Terraform Configuration

#### Overview
This Terraform configuration is designed to set up a Global Load Balancer (GLB) in Google Cloud Platform. It includes the creation of necessary resources such as global addresses, backend services, health checks, URL maps, HTTP proxies, and forwarding rules.

#### File Descriptions

##### `main.tf`
- **Provider Configuration**: Specifies the Google Cloud provider, including project ID and region, which are defined as variables.
- **Resource Definitions**: 
  - `google_compute_global_address`: Creates a global IP address for the GLB.
  - `google_compute_backend_service`: Sets up a backend service for the GLB, with a dynamic block to handle multiple network endpoint groups (NEGs).
  - `google_compute_health_check`: Configures a health check for the GLB.
  - `google_compute_url_map`: Defines a URL map for routing requests to the backend service.
  - `google_compute_target_http_proxy`: Establishes an HTTP proxy for the GLB.
  - `google_compute_global_forwarding_rule`: Sets up a forwarding rule for the GLB to direct traffic to the HTTP proxy.

##### `outputs.tf`
- Defines output variables for the Terraform configuration.
- **Outputs**:
  - `glb_ip`: The IP address of the Global Load Balancer.

##### `terraform.tfvars`
- Specifies the actual values for the variables used in the Terraform configuration.
- **Variables**:
  - `project_id`: The GCP project ID.
  - `region`: The region where resources will be deployed.
  - `negs`: A map of network endpoint groups (NEGs) to be used in the backend service.
  - `glb_name`: The name assigned to the Global Load Balancer.

##### `variables.tf`
- Declares the variables that are used in the Terraform configuration.
- **Variable Declarations**:
  - `project_id`: GCP project ID.
  - `region`: Region for deployment.
  - `negs`: Map type variable for NEGs.
  - `glb_name`: Name for the GLB.

#### Usage Instructions
1. **Initialization**: Run `terraform init` to initialize the Terraform working directory.
2. **Planning**: Execute `terraform plan` to preview the changes Terraform will make.
3. **Applying Changes**: Use `terraform apply` to apply the changes and set up the infrastructure.

#### Notes
- Ensure you have the necessary permissions in your GCP account to create and manage these resources.
- Modify `terraform.tfvars` as needed to fit your specific project and regional requirements.

