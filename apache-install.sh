sudo yum update -y -q

echo "Installing Apache..."
sudo yum install -y -q httpd

echo "Starting and enabling Apache..."
sudo systemctl start httpd
sudo systemctl enable httpd

STATUS=$(sudo systemctl is-active httpd)

echo "Status of Apache: $STATUS"