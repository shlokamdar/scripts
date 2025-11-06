SERVERS='43.204.212.217 3.110.101.142 3.110.51.109 3.108.51.187 65.2.122.203'
FILES='index_shloka.html about_shloka.html contact_shloka.html blog_shloka.html new_shloka.html'
KEY_FILE='test111.pem'
USER='ec2-user'

for i in $SERVERS
do 
	echo "========================"
        echo "Deploying to $i"	
	echo "========================"

	for j in $FILES
	do
		echo "--> Copying File: $j"
		scp -i $KEY_FILE $j $USER@$i:/home/ec2-user
		ssh -i $KEY_FILE $USER@$i "sudo cp /home/ec2-user/$j /var/www/html/"
		echo "$j --> File Deployed"
	done
	echo "========================"
	echo " all files deployed"
	echo "========================"
	echo "Deployement completed "
	echo "========================"
done
