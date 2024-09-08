resource "aws_security_group" "rds-sg" {
  name = "rds-sg"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups = [aws_security_group.terraform-sg.id]
  }

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [var.ip_externo]
  }
}

resource "aws_db_instance" "rds_instance2" {
  identifier        = "projetodevops1"
  engine            = "postgres"
  engine_version    = var.aws_rds_engine_version
  instance_class    = "db.t3.micro"
  db_name           = "postgresql"
  username          = "dbadmin" #nome para acessar no pgadmin
  password          = var.aws_rds_password #senha para acessar no pgadmin
  parameter_group_name = "default.postgres12"
  vpc_security_group_ids = [aws_security_group.rds-sg.id]
  allocated_storage = 20

  # tornar a instância RDS acessível publicamente ao ip_externo da máquina configurado no security group rds-sg
  publicly_accessible = true

  # configuração de backup retentição de 7 dias
  backup_retention_period = 7  

  # Para restaurar em algum snapsho
  #snapshot_identifier = "strapi-cms"

  # Apaga pulando snapshot final
  skip_final_snapshot      = true

  # Nome do snapshot final caso skip_final_snapshot = false
  #final_snapshot_identifier = "strapi-cms"

  tags = {
    Name = "rds-instance"
  }
}