variable "region" {
  default = "us-east-1"
}

variable "env" {
  default = "dev"
}

variable "app_name" {
  default = "mantis"
}

######## VPC ########

variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.1.0/24"
  description = "Range IP"
}

variable "vpc_name" {
  type        = string
  default     = "Mantis VPC"
  description = "VPC Tag name"
}

#######################

######## Subnet ########

variable "subnet_a_cidr_block" {
  type        = string
  default     = "10.0.1.0/24"
  description = "Subnet cidr block"
}

variable "subnet_b_cidr_block" {
  type        = string
  default     = "10.0.1.0/24"
  description = "Subnet cidr block"

}

variable "subnet_c_cidr_block" {
  type        = string
  default     = "10.0.1.0/24"
  description = "Subnet cidr block"
}

#######################

variable "az_count" {
  default = 2
}


variable "beanstalk_application_name" {
  default = "beanstalk-application"
}

variable "beanstalk_application_description" {
  default = "desc"
}

variable "beanstalk_env_name" {
  default = "beanstalk_env"
}

variable "beanstalk_env_ec2_subnet" {
  default = ""
}

variable "beanstalk_env_elb_subnet" {
  default = ""
}

variable "autoscale_max" {
  type        = number
  default     = 3
  description = "Maximum instances to launch"
}

variable "autoscale_min" {
  type        = number
  default     = 1
  description = "Min instances to launch"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Instances type"
}

########## Api Gateway #############

variable "api_gateway_vpc_link_name" {
  type    = string
  default = "api-gateway-vpc-link"
}

variable "api_gateway_vpc_link_description" {
  type    = string
  default = "testevpclink desc"
}

variable "api_gateway_rest_api_name" {
  type    = string
  default = "api-gateway-rest"
}

variable "api_gateway_rest_api_description" {
  type    = string
  default = "Descrição api Rest"
}

variable "api_gateway_rest_api_endpoint_configuration" {
  type    = string
  default = "REGIONAL"
}

########## Redis #############

variable "elasticache_replication_group_id" {
  type    = string
  default = "redis-group"
}

variable "elasticache_replication_group_description" {
  type    = string
  default = "elasticache_replication_group_description"
}

variable "elasticache_replication_group_port" {
  type    = number
  default = 3389
}

