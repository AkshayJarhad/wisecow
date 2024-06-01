#!/bin/bash

# Thresholds
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

# Check CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" |bc -l) )); then
  echo "CPU usage is above threshold: $CPU_USAGE%"
fi

# Check memory usage
MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
if (( $(echo "$MEM_USAGE > $MEM_THRESHOLD" |bc -l) )); then
  echo "Memory usage is above threshold: $MEM_USAGE%"
fi

# Check disk usage
DISK_USAGE=$(df -h | grep '/dev/sda1' | awk '{print $5}' | sed 's/%//g')
if (( DISK_USAGE > DISK_THRESHOLD )); then
  echo "Disk usage is above threshold: $DISK_USAGE%"
fi
