#!/bin/bash

LOG_FILE="/var/log/device.log"
ERROR_FILE="error_report.log"

echo "Initializing error report: $ERROR_FILE"
> "$ERROR_FILE"  

while true; do
    echo "$(date): Checking log file: $LOG_FILE"

    if grep -q "ERROR" "$LOG_FILE"; then
        echo "Error detected! Extracting new error messages..."
        
        grep "ERROR" "$LOG_FILE" | grep -Fvxf "$ERROR_FILE" >> "$ERROR_FILE"

        echo "New errors saved to $ERROR_FILE"
    else
        echo "No errors found."
    fi

    sleep 5  
done
