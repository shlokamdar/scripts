HTTP_CODE=$(curl -s -o /dev/null -w"%{http_code}" http://65.2.122.203/)
SERVER="65.2.122.203"
KEY_FILE="test111.pem"
USER="ec2-user"
COUNT=1
CURRENT_DATE=$(date)

while [ $COUNT -le 30 ]; do
  echo "===================================="
  echo "Starting the script: $CURRENT_DATE"
  echo "===================================="
  # Commands to be executed repeatedly
  if [ $HTTP_CODE != '200' ]; then
          echo "Restarting the server"
          ssh -i $KEY_FILE $USER@$SERVER "sudo systemctl restart httpd"

          echo "Ending the script, deployed succesfully: $CURRENT_DATE"
          break
  fi
  sleep 2
  $COUNT + 1 = $COUNT

done
