
#!/bin/bash


# Step 1: Check config file
echo "Checking config files"

if [ -f /etc/app/config.json ]; then
    echo "Config file check passed"
else
    echo "Config file check failed"
    echo "Deployment validation failed at step 1"
    exit 1
fi

# Step 2: Check nginx process
pgrep nginx > /dev/null
if [ $? -eq 0 ]; then
    echo "Nginx process check passed"
else
    echo "Nginx process check failed"
    echo "Deployment validation failed at step 2"
    exit 1
fi

# Step 3: Check web directory
if [ -d /var/www/html ]; then
    echo "Web directory check passed"
else
    echo "Web directory check failed"
    echo "Deployment validation failed at step 3"
    exit 1
fi

# Step 4: Test network connectivity
ping -c 1 google.com > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Network connectivity check passed"
else
    echo "Network connectivity check failed"
    echo "Deployment validation failed at step 4"
    exit 1
fi

# Final success message
echo "All validations successful!"