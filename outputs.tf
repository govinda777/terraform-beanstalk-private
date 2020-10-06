
output "beanstalk_id" {
  description = "beanstalk_id"
  value       = aws_elastic_beanstalk_environment.default.id
}

output "beanstalk_name" {
  description = "beanstalk_name"
  value       = aws_elastic_beanstalk_environment.default.name
}

output "beanstalk_instances" {
  description = "beanstalk_instances"
  value       = aws_elastic_beanstalk_environment.default.instances
}

output "balancers_load_balancers" {
  description = "balancers_load_balancers"
  value       = aws_elastic_beanstalk_environment.default.load_balancers
}

output "api_gateway_vpc_link_id" {
  description = "api_gateway_vpc_link_id"
  value       = aws_api_gateway_vpc_link.default.id
}

output "api_gateway_vpc_link_name" {
  description = "api_gateway_vpc_link_name"
  value       = aws_api_gateway_vpc_link.default.name
}
