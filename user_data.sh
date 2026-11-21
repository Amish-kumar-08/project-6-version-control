#!/bin/bash
set -Eeuo pipefail

exec > >(tee -a /var/log/webserver-setup.log) 2>&1

echo "Starting setup: $(date)"

trap 'echo "SETUP FAILED at line $LINENO: $(date)"' ERR

# Update package lists
apt-get update -y

# Install Nginx
DEBIAN_FRONTEND=noninteractive apt-get install -y nginx

# Create custom website
cat > /var/www/html/index.html <<'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AWS Terraform Project</title>
</head>
<body>
    <h1>My AWS EC2 Web Server</h1>
    <h2>Successfully deployed using Terraform!</h2>
    <p>Operating System: Ubuntu 24.04 LTS</p>
    <p>Web Server: Nginx</p>
    <p>Infrastructure: AWS EC2 + Terraform</p>
    <p>Remote Management: AWS Systems Manager</p>
</body>
</html>
EOF

# Enable and start Nginx
systemctl enable nginx
systemctl restart nginx

# Verify Nginx
systemctl is-active --quiet nginx
curl -f http://localhost/

echo "Setup completed successfully: $(date)"

