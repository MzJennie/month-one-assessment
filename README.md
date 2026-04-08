# TechCorp Infrastructure — Terraform Assessment

## Prerequisites
Ensure the following tools are installed:
- Terraform >= 1.5
- AWS CLI configured with appropriate credentials
- SSH Client 
- An EC2 Key Pair
- Git

# Set up AWS Configuration
Run:'aws configure'

Provide:
- AWS Access Key
- AWS Secret Key
- Region (e.g., eu-west-2)
- Output format: json

# Set up the folder $ file structure as defined in the assessment
- use mkdir to create folders
- use touch to create the files

## Deployment Steps

1. Clone this repository
2. Copy the example vars file: `cp terraform.tfvars.example terraform.tfvars`
3. Edit `terraform.tfvars` and set your public IP in `my_ip`
4. Run: `terraform init`
5. Run: `terraform validate`
6. Run: `terraform plan`
7. Run: `terraform apply`
8. Note the outputs: VPC ID, ALB DNS name, Bastion IP

## Accessing the Application
- Open the `alb_dns_name` output in a browser to see the web app

## SSH Access
- Bastion: `ssh -i key_pair.pem ec2-user@<bastion_public_ip>`
- Web/DB from bastion: `ssh ec2-user@<private-ip>` (use the set password)

## Cleanup
Run `terraform destroy` to remove all created resources.