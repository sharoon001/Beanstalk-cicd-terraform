resource "aws_elastic_beanstalk_application" "demo-app" {
  name = "app2"
}
 
resource "aws_elastic_beanstalk_environment" "beanstalkappenv" {
  name                = "app2Evn"
  application         = aws_elastic_beanstalk_application.demo-app.name
  solution_stack_name = "64bit Amazon Linux 2 v5.5.4 running Node.js 16"
 
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = "vpc-0f9833fb3acaeefc3"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     =  "aws-elasticbeanstalk-ec2-role"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "AssociatePublicIpAddress"
    value     =  "True"
  }
 
  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "subnet-0d4c9560a56253431, subnet-04c2fbade59344147, subnet-0527fd42778d40a95, subnet-05d077813500f66ad" 
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "MatcherHTTPCode"
    value     = "200"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = "application"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.medium"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBScheme"
    value     = "internet facing"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = 1
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = 2
  }
}