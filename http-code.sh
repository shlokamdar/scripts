#get current user
WHOAMI=$(whoami)

#present working directory
PWD=$(pwd)

#numbers of users logged in
W=$(w)

#current date of the system
CURRENT_DATE=$(date)

#get http code
HTTP_CODE=$(curl -s -o /dev/null -w"%{http_code}" nixacetech.com)


#ouputs:
echo "logged in user:" $WHOAMI
echo "present directory:" $PWD
echo "logged in users:" $W
echo "current date:" $CURRENT_DATE
echo "HTTP Status:" $HTTP_CODE

#print deployment info
echo ":======================================="
echo "Deployment Information:"
echo ":======================================="
echo "Current Date:" $CURRENT_DATE
echo ":======================================="
