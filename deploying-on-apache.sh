#copying index.html to apache server
echo "moving index.html to the var/www/html directory"
sudo cp index.html /var/www/html/index.html

echo "restarting apache server"
sudo systemctl restart httpd

echo "check public IP of the server"