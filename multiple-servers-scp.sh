#initializing variables
USER='ec2-user'
SERVER_KEY='shloka-nixace.pem'
LOCAL_FILE='shloka.html'
REMOTE_PATH='/home/ec2-user'

#loop through multiple server IPs and scp the file to each server
for i in 3.111.42.99 35.154.73.99 3.110.191.192 13.204.85.9 13.203.86.50 13.235.90.210 65.0.32.100
do
    echo "Copying to $i ..."
    scp -i "$SERVER_KEY" "$LOCAL_FILE" "$USER@$i:$REMOTE_PATH"
done