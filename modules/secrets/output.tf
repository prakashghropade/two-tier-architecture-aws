output "db_password" {
    description = "Generated database password"
    value = random_password.db_password.id
    sensitive = true
}

output "secret_arn" {
    description = "ARN of the secret in secrets manager"
    value = aws_secretsmanager_secret_version.db_password.arn
}