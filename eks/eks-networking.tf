 module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.13.0"

  name =  var.vpc_name
  cidr = var.cidr_block

  azs            = var.azs
  private_subnets = var.private_subnets
  public_subnets = var.public_subnets

  enable_nat_gateway = true
  single_nat_gateway = true


  tags = var.tags
}

/* resource "aws_security_group" "ng_sg_ssh" {
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Cambia esto para restringir el acceso SSH
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge (var.tags, {
     Name = "${var.node_group_name}-sg-ssh"
  })
} */