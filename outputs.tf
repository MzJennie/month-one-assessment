output "vpc_id" {
  description = "The VPC ID"
  value       = aws_vpc.main.id
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.alb.dns_name
}

output "bastion_public_ip" {
  description = "Public IP of the Bastion Host"
  value       = aws_eip.bastion.public_ip
}