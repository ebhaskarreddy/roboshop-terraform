module "mongodb" {
  source = "../../terraform-aws-securitygroup"
  project_name = var.project_name
  environment = var.environment
  sg_description = "sg for mongodb"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "mongodb"
  #sg_ingress_rules = var.mongodb_sg_ingress_rules
}
module "catalogue" {
  source = "../../terraform-aws-securitygroup"
  project_name = var.project_name
  environment = var.environment
  sg_description = "sg for catalogue"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "catalogue"
  #sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "user" {
  source = "../../terraform-aws-securitygroup"
  project_name = var.project_name
  environment = var.environment
  sg_description = "sg for user"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "user"
  #sg_ingress_rules = var.mongodb_sg_ingress_rules
}
module "redis" {
  source = "../../terraform-aws-securitygroup"
  project_name = var.project_name
  environment = var.environment
  sg_description = "sg for user"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "redis"
  #sg_ingress_rules = var.mongodb_sg_ingress_rules
}
module "mysql" {
  source = "../../terraform-aws-securitygroup"
  project_name = var.project_name
  environment = var.environment
  sg_description = "sg for user"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "mysql"
  #sg_ingress_rules = var.mongodb_sg_ingress_rules
}
module "rabbitmq" {
  source = "../../terraform-aws-securitygroup"
  project_name = var.project_name
  environment = var.environment
  sg_description = "sg for user"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "rabbitmq"
  #sg_ingress_rules = var.mongodb_sg_ingress_rules
}
module "cart" {
  source = "../../terraform-aws-securitygroup"
  project_name = var.project_name
  environment = var.environment
  sg_description = "sg for user"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "cart"
  #sg_ingress_rules = var.mongodb_sg_ingress_rules
}
module "shipping" {
  source = "../../terraform-aws-securitygroup"
  project_name = var.project_name
  environment = var.environment
  sg_description = "sg for user"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "shipping"
  #sg_ingress_rules = var.mongodb_sg_ingress_rules
}
module "payment" {
  source = "../../terraform-aws-securitygroup"
  project_name = var.project_name
  environment = var.environment
  sg_description = "sg for user"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "payment"
  #sg_ingress_rules = var.mongodb_sg_ingress_rules
}
module "web" {
  source = "../../terraform-aws-securitygroup"
  project_name = var.project_name
  environment = var.environment
  sg_description = "sg for user"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "web"
  #sg_ingress_rules = var.mongodb_sg_ingress_rules
}
# mongodb accepting connection from catalogue instance
resource "aws_security_group_rule" "mongodb_catalogue" {
  source_security_group_id = module.catalogue.sg_id
 type = "ingress"
 from_port = 27017
 to_port = 27017
 protocol = "tcp"
 security_group_id = module.mongodb.sg_id

}
resource "aws_security_group_rule" "mongodb_user" {
  source_security_group_id = module.user.sg_id
  type = "ingress"
  from_port = 27017
  to_port = 27017
  protocol = "tcp"
  security_group_id = module.mongodb.sg_id

}

resource "aws_security_group_rule" "redis_user" {
  source_security_group_id = module.user.sg_id
  type = "ingress"
  from_port = 6379
  to_port = 6379
  protocol = "tcp"
  security_group_id = module.redis.sg_id

}
resource "aws_security_group_rule" "redis_cart" {
  source_security_group_id = module.cart.sg_id
  type = "ingress"
  from_port = 27017
  to_port = 27017
  protocol = "tcp"
  security_group_id = module.redis.sg_id

}

