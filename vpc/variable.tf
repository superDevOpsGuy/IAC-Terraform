variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "subnet_cidr_01" {
  type =  string
  default = "10.0.1.0/24"
}

variable "subnet_cidr_02" {
  type =  string
  default = "10.0.2.0/24"
}