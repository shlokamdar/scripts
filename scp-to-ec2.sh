SERVER_IP='3.110.90.121'
USER='ec2-user'
SERVER_KEY='test111.pem'
LOCAL_FILE='shloka.html'
PATH=':/home/ec2-user'

#print them 
echo "Server's IP:" $SERVER_IP
echo "User:" $USER
echo "Server key" $SERVER_KEY
echo "Local file" $LOCAL_FILE

#scp the file to server 
scp -i $SERVER_KEY $LOCAL_FILE $USER'@'$i$PATH
echo "scp successful"
