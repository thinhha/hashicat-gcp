locals {
  network_name = "sad"
  subnet_01 = "${local.network_name}-subnet-01"
  subnet_02 = "${local.network_name}-subnet-02"
  subnet_03 = "${local.network_name}-subnet-03"
}


module "test-vpc-module" {
  source       = "https://github.com/thinhha/terraform-google-network"
  project_id   = var.project_id
  network_name = var.network_name

  subnets = [
    {
      subnet_name   = "${local.subnet_01}"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = "us-west1"
    },
    {
      subnet_name           = "${local.subnet_02}"
      subnet_ip             = "10.10.20.0/24"
      subnet_region         = "us-west1"
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
    },
    {
      subnet_name               = "${local.subnet_03}"
      subnet_ip                 = "10.10.30.0/24"
      subnet_region             = "us-west1"
      subnet_flow_logs          = "true"
      subnet_flow_logs_interval = "INTERVAL_10_MIN"
      subnet_flow_logs_sampling = 0.7
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
    }
  ]
}
