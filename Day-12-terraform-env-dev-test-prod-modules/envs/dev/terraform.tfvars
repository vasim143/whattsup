key_name               = "your-keypair-name"
engine                 = "mysql"
engine_version         = "8.0"
allocated_storage      = 20
db_instance_class      = "db.t3.micro"
db_name                = "akram"
db_username            = "admin"
db_password            = "admin123"
subnet_ids = ["subnet-083ee9f50fa1a1bee", "subnet-0d6ab2977cd6b449d"] 
# where subnet-0abc1234def56789a is in a different AZ like us-east-1a or us-east-1b



vpc_security_group_ids = ["sg-0abc123456789def0"]  # Replace with your actual SG ID
