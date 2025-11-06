HTTP_CODE=$(curl -s -o /dev/null -w"%{http_code}" http://65.2.122.203/)
SERVER="65.2.122.203"
KEY_FILE="test111.pem"
USER="ec2-user"
CURRENT_DATE=$(date)

echo "===================================="
echo "Starting the script: $CURRENT_DATE"
echo "===================================="

while [ $HTTP_CODE != "200" ]; do
  # Commands to be executed
  echo "Apache is not active, trying to restart the apache server"
  ssh -i $KEY_FILE $USER@$SERVER "sudo systemctl restart httpd"
  sleep 2
  break
done



echo "====================================================="
echo "Apache is live, check public IP to access the webpage"
echo "====================================================="
echo "Ending the script, deployed succesfully: $CURRENT_DATE"
