#!/bin/sh

Write-Host "----------------------------------------"

$ENV="dev"

$namespace="luan"
$beanstalk_application_name="eb-app-$($namespace)"
$beanstalk_env_name="eb-env-$($namespace)"
$api_gateway_vpc_link_name="api-gat-vpc-link-$($namespace)"
$api_gateway_rest_api_name="api-gat-$($namespace)"
$elasticache_cluster_name="redis-$($namespace)"

Write-Host "----------------------------------------"
Write-Host "Variables"

Write-Host $namespace
Write-Host $beanstalk_application_name
Write-Host $beanstalk_env_name
Write-Host $api_gateway_vpc_link_name
Write-Host $api_gateway_rest_api_name
Write-Host $elasticache_cluster_name


Write-Host "----------------------------------------"
Write-Host "Formatting terraform files"
terraform fmt
Write-Host "----------------------------------------"
terraform init
Write-Host "----------------------------------------"
Write-Host "Validating terraform files"
terraform validate
Write-Host "----------------------------------------"
Write-Host "Planning..."
terraform plan -var-file="$($ENV)/terraform.tfvars" -var namespace=$namespace -var beanstalk_application_name=$beanstalk_application_name -var beanstalk_env_name=$beanstalk_env_name -var api_gateway_vpc_link_name=$api_gateway_vpc_link_name -var api_gateway_rest_api_name=$api_gateway_rest_api_name -var elasticache_cluster_name=$elasticache_cluster_name -out="plan.tfout"
Write-Host "----------------------------------------"
Write-Host "Applying..."
#terraform apply plan.tfout
Write-Host "----------------------------------------"
Write-Host "Cleaning up plan file"
#Remove-Item -Path plan.tfout
Write-Host "----------------------------------------"
