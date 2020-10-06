
resource "aws_elastic_beanstalk_application" "default" {
  name        = var.beanstalk_application_name
  description = var.beanstalk_application_description

  tags = merge({ Name = "${local.app_name}-beanstalk-app" }, local.tags)
}

resource "aws_elastic_beanstalk_environment" "default" {
  name                = var.beanstalk_env_name
  application         = aws_elastic_beanstalk_application.default.name
  solution_stack_name = "64bit Amazon Linux 2 v3.1.2 running Docker"

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = aws_vpc.default.id
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = join(",", aws_subnet.private.*.id)
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBSubnets"
    value     = join(",", aws_subnet.private.*.id)
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = "network"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = var.autoscale_max
    resource  = ""
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = var.autoscale_min
    resource  = ""
  }

  setting {
    namespace = "aws:ec2:instances"
    name      = "InstanceTypes"
    value     = var.instance_type
    resource  = ""
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }

  tags = merge({ Name = "${local.app_name}-beanstalk-env" }, local.tags)
}
