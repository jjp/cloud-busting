provider "aws" {
  version = "3.11.0"
}

terraform {
  backend "s3" {
    key     = "ecs-demo-bastion.tfstate"
    encrypt = true
  }
}

data "terraform_remote_state" "rds" {
  backend   = "s3"
  workspace = terraform.workspace
  config = {
    key    = "ecs-demo-rds.tfstate"
    bucket = var.state_bucket
  }
}

data "terraform_remote_state" "network" {
  backend   = "s3"
  workspace = terraform.workspace
  config = {
    key    = "ecs-demo-network.tfstate"
    bucket = var.state_bucket
  }
}
