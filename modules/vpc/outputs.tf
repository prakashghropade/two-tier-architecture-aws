# VPC Module - Output

output "vpc_id" {
    description = "ID of the vpc"
    value = aws_vpc.main.id
}

output "public_subnet_id" {
    description = "ID of the public subnet"
    value = aws_subnet.pubic.id 
}

output "private_subnet_ids" {
    description = "IDs of the private subnets"
    value = [ aws_subnet.private_1.id, aws_subnet.private_2.id]
}

output "vpc_cider" {
    description = "CIDER block of the vpc"
    value = aws_vpc.main.cidr_block
}