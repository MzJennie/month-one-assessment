variable "region" {
  description = "AWS region to deploy resources"
  default     = "eu-west-2"
}

variable "instance_type_web" {
  description = "Instance type for web and bastion servers"
  default     = "t3.micro"
}

variable "instance_type_db" {
  description = "Instance type for database server"
  default     = "t3.small"
}

variable "key_pair_name" {
  description = "Name of the EC2 key pair"
  default     = "your-keypair"
}

variable "my_ip" {
  description = "Public IP address for SSH"
}