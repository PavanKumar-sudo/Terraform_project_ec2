# outputs.tf

# Output the public IP address of the EC2 instance
output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.server.public_ip
}

# Output the VPC ID
output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.myvpc.id
}

# Output the Subnet ID
output "subnet_id" {
  description = "The ID of the created Subnet"
  value       = aws_subnet.sub1.id
}

# Output the Security Group ID
output "security_group_id" {
  description = "The ID of the created Security Group"
  value       = aws_security_group.webSg.id
}

# Output the EC2 Instance ID
output "instance_id" {
  description = "The ID of the created EC2 Instance"
  value       = aws_instance.server.id
}
