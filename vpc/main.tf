module "vpc_main" {
  source = "../../../../modules/networking/vpc/"

  name = var.vpc_main["name"]
  cidr = var.vpc_main["cidr"]

  azs                      = var.vpc_main["azs"]
  public_subnets           = var.vpc_main["public_subnets"]
  private_subnets          = var.vpc_main["private_subnets"]
  private_subnet_name_tags = var.vpc_main["private_subnet_name_tags"]
  public_subnet_name_tags  = var.vpc_main["public_subnet_name_tags"]
  single_nat_gateway       = true
  enable_nat_gateway       = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(
    var.tags,
    tomap({
      "purpose" = "main"
    })
  )
}