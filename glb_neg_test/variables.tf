variable "project_id" {
  description = "The GCP project ID."
}

variable "region" {
  description = "The region where the GKE cluster and NEGs are located."
}

variable "negs" {
  type        = map(string)
}


variable "glb_name" {
  description = "The name of the Global Load Balancer."
}
