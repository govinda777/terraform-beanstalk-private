resource "aws_api_gateway_vpc_link" "default" {
  name        = var.api_gateway_vpc_link_name
  description = var.api_gateway_vpc_link_description
  depends_on  = [aws_elastic_beanstalk_environment.default]
  target_arns = [aws_elastic_beanstalk_environment.default.load_balancers[0]]
}

resource "aws_api_gateway_rest_api" "default" {
  name        = var.api_gateway_rest_api_name
  description = var.api_gateway_rest_api_description

  endpoint_configuration {
    types = [var.api_gateway_rest_api_endpoint_configuration]
  }
}

resource "aws_api_gateway_resource" "default" {
  rest_api_id = aws_api_gateway_rest_api.default.id
  parent_id   = aws_api_gateway_rest_api.default.root_resource_id
  path_part   = "products"
}

resource "aws_api_gateway_method" "default" {
  rest_api_id      = aws_api_gateway_rest_api.default.id
  resource_id      = aws_api_gateway_resource.default.id
  http_method      = "GET"
  authorization    = "NONE"
  api_key_required = false
}

resource "aws_api_gateway_integration" "default" {
  rest_api_id = aws_api_gateway_rest_api.default.id
  resource_id = aws_api_gateway_resource.default.id
  http_method = aws_api_gateway_method.default.http_method

  request_templates = {
    "application/json" = ""
  }

  type                    = "HTTP_PROXY"
  uri                     = "https://${aws_elastic_beanstalk_environment.default.cname}"
  integration_http_method = "GET"

  connection_type = "VPC_LINK"
  connection_id   = aws_api_gateway_vpc_link.default.id

  #Use Proxy Integration ?
}

resource "aws_api_gateway_deployment" "default" {
  depends_on = [aws_api_gateway_integration.default]

  rest_api_id = aws_api_gateway_rest_api.default.id
  stage_name  = "v1"

  variables = {
    "mantisApiURL" = aws_elastic_beanstalk_environment.default.cname
  }

  lifecycle {
    create_before_destroy = true
  }
}