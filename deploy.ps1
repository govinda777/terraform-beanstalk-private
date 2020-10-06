#!/bin/sh

Write-Host "----------------------------------------"

$ENV="dev"

$app_name="luan"
$beanstalk_application_name="eb-app-$($app_name)"
$beanstalk_env_name="eb-env-$($app_name)"
$api_gateway_vpc_link_name="api-gw-vpc-link-$($app_name)"
$api_gateway_rest_api_name="api-gw-$($app_name)"
$elasticache_replication_group_id="redis$($app_name)"

Write-Host "----------------------------------------"
Write-Host "Variables"

Write-Host $app_name
Write-Host $beanstalk_application_name
Write-Host $beanstalk_env_name
Write-Host $api_gateway_vpc_link_name
Write-Host $api_gateway_rest_api_name
Write-Host $elasticache_replication_group_id

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

terraform plan -var-file="$($ENV)/terraform.tfvars" -var app_name=$app_name -var beanstalk_application_name=$beanstalk_application_name -var beanstalk_env_name=$beanstalk_env_name -var api_gateway_vpc_link_name=$api_gateway_vpc_link_name -var api_gateway_rest_api_name=$api_gateway_rest_api_name -var elasticache_replication_group_id=$elasticache_replication_group_id -out="plan.tfout"

Write-Host "----------------------------------------"
Write-Host "Applying..."
#terraform apply plan.tfout
Write-Host "----------------------------------------"
Write-Host "Cleaning up plan file"
Remove-Item -Path plan.tfout
Write-Host "----------------------------------------"
