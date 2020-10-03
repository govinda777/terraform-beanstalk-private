variable "region" {
  default = "us-east-1"
}

variable "env" {
  default = "dev"
}

variable "namespace" {
  default = "teste"
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


