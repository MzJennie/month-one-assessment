#!/bin/bash
yum update -y

# Enable password authentication for bastion access
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl restart sshd

# Set a password for ec2-user (password masked)
echo "ec2-user:****" | chpasswd

# Install PostgreSQL 14
amazon-linux-extras enable postgresql14
yum install -y postgresql-server postgresql

# Initialize and start PostgreSQL
postgresql-setup initdb
systemctl start postgresql
systemctl enable postgresql

# Create a default database and user
sudo -u postgres psql <<EOF
CREATE DATABASE techcorp_db;
CREATE USER techcorp_user WITH ENCRYPTED PASSWORD 'altSOE_TechCorp@2026';
GRANT ALL PRIVILEGES ON DATABASE techcorp_db TO techcorp_user;
EOF