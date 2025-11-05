
# Script to silently install Nginx on Amzaon Linux

echo "Updating system packages..."
sudo yum update -y > /dev/null 2>&1

echo "Installing Nginx silently..."
sudo yum install -y nginx > /dev/null 2>&1

# Enable and start nginx service
echo "Enabling and starting Nginx..."
sudo systemctl enable nginx > /dev/null 2>&1
sudo systemctl start nginx > /dev/null 2>&1
#sudo systemctl status nginx

STATUS=$(sudo systemctl is-active nginx)
echo "status of Nginx: $STATUS"
