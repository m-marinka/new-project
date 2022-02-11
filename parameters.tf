variable region {
  type = string
  default = "us-west-2"
}

provider "aws" {
  region = var.region
}

variable "ami_id" {
  type = string
  default = "ami-0892d3c7ee96c0bf7"
}

variable "ami_key_pair_name" {
  type = string
  default = "makar-hometask1-key"
}

