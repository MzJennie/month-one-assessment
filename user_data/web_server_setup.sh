#!/bin/bash
yum update -y
yum install -y httpd

# Enable password authentication for bastion access
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl restart sshd

# Set a password for ec2-user (password masked)
echo "ec2-user:****" | chpasswd

# Get instance metadata
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
AZ=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)

# Create web page
cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head><title>TechCorp Web Server</title></head>
<body>
  <h1>TechCorp Web Application</h1>
  <p><strong>Instance ID:</strong> ${INSTANCE_ID}</p>
  <p><strong>Availability Zone:</strong> ${AZ}</p>
</body>
</html>
EOF

systemctl start httpd
systemctl enable httpd