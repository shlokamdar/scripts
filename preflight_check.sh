#!/bin/bash

#Setting up variables
APP_ENV="production"
APP_PORT="8080"
DB_CONNECTION="postgresql://localhost"
CONF="/etc/nginx/nginx.conf"
LOG="/var/log/nginx"
START="start.sh"

echo "============================================"
echo "Starting preflight validation checks..."
echo "============================================"

# Check 1: Configuration file
if [ -f $CONF ] && [ -r $CONF ]; then
    echo "Configuration file check passed"
else
    if [ ! -f $CONF ]; then
            echo "Confguration file check failed: File not found"
            exit 1
    fi
    if [ ! -r $CONF ];then
            echo "Configuration file check failed: File not readable"
            exit 1
    fi
fi

# Check 2: Log directory
if [ -d $LOG ] && [ -w $LOG ]; then
    echo "Log directory check passed"
else
    if [ ! -d $LOG ]; then
            echo "Log directory check failed: Directory not found"
            exit 1
    fi
    if [ ! -w $LOG ];then
            echo "Log directory check failed: File not writeable"
            exit 1
    fi
fi

# Check 3: Startup script
if [ -f $START ] && [ -x $START ]; then
    echo "Startup script check passed"
else
    if [ ! -f $START ]; then
            echo "Startup script failed: Script not found"
    fi
    if [ ! -x $START ]; then
            echo "Startup script failed: Script not executable"
    fi
fi

# Check 4: Environment variable
if [ "$APP_ENV" = "production" ] || [ "$APP_ENV" = "staging" ]; then
    echo "Environment variable check passed"
else
    echo "Environment variable check failed"
    exit 1
fi

# Check 5: Port validation
if [ "$APP_PORT" -ge 1024 ] && [ "$APP_PORT" -le 65535 ]; then
    echo "Port validation check passed"
else
    echo "Port validation check failed"
    exit 1
fi

# Check 6: Database connection string
if [ ! -z "$DB_CONNECTION" ]; then
    echo "Database connection check passed"
else
    echo "Database connection check failed: DB_Connection not set"
    exit 1
fi

echo "============================================"
echo "All preflight checks completed successfully."
echo "============================================"
