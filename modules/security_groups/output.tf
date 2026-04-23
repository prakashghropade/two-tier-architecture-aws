# Security  group Model - Output

output "web_sg_id" {
    description = "ID of the web server security group"
    value = aws_security_group.web.id
}

output "db_sg_id" { 
    description = "ID of the db server security group"
    value = aws_security_group.db.id
}