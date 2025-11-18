#!/bin/bash

cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'.' -f1)

disk_space_used=$(df -h | grep -w "/dev/nvme0n1p1" | awk '{print $3}')

memory_used=$(free -h | grep "Mem" | awk '{print $ 3}' )

load_average=$(awk '{print $1, $2, $3}' /proc/loadavg)

echo "================== System Health Monitor Check ========================"

echo "CPU Usage: $cpu_usage%"
echo "Disk Space Used: $disk_space_used"
echo "Memory Used: $memory_used"
echo "Load average of the CPU: $load_average"

echo "======================================================================="
