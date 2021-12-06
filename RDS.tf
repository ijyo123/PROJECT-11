resource "aws_db_instance" "my-p11sql-db" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "admin1"
  password             = "admin124"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.my-p11rds-db-subnet.id
}

#Create RDS subnet
resource "aws_db_subnet_group" "my-p11rds-db-subnet" {
  name       = "my-p11rds-db-subnet"
  subnet_ids = [aws_subnet.p11-privsub1.id, aws_subnet.p11-privsub2.id]

  tags = {
    Name = var.my-p11rds-db-subnet-tagname
  }
}

resource "aws_security_group" "my-p11rds-sg" {
  name        = "my-p11rds-sg"
  description = "Allow inbound traffic db"
  vpc_id      = aws_vpc.project11VPC.id
}

resource "aws_security_group_rule" "my-p11rds-sg-rule" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"
  ]
  
  security_group_id = aws_security_group.my-p11rds-sg.id
}

resource "aws_security_group_rule" "outbound_rule" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  security_group_id = aws_security_group.my-p11rds-sg.id
  cidr_blocks       = ["0.0.0.0/0"
  ]
}