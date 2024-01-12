module "mongodb"{
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "${local.ec2_name}-mongodb"
  instance_type          = "t3.small"
  vpc_security_group_ids = [data.aws_ssm_parameter.mongodb_sg_id]
  subnet_id              = local.databse_subnet_id
  tags = merge(
    var.common_tags,
    {
      component = "mongodb"
    },
    {
      name = "${local.ec2_name}-mongodb"
    }
  )
}