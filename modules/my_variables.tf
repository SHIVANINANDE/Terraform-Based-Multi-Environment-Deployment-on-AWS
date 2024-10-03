variable "my-env" {
  description = "This is environment for infra"
  type=string
}

variable "ami_id" {
    description = "This is ami_id for EC2"
    type = string
}

variable "instance_type" {
  description = "This is the type of instance for EC2"
  type = string
}