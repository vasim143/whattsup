output "rds_endpoint" {
  value = aws_db_instance.this.endpoint
}

output "rds_security_group_id" {
  value = aws_security_group.rds_sg.id
}
