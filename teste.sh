#!/bin/bash

send_email() {
    local to_addr="$1"       # Primary recipient(s), comma-separated
    local subject="$2"       # Email subject
    local body="$3"          # Email body
    local attach="$4"        # Attachment file (optional)

    if [ -n "$attach" ] && [ -f "$attach" ]; then
        echo "$body" | sendmail -f "your_email@example.com" -t "$to_addr" -u "$subject" -a "$attach"
    else
        echo "$body" | sendmail -f "your_email@example.com" -t "$to_addr" -u "$subject"
    fi

    if [ $? -eq 0 ]; then
        echo "Email sent successfully to $to_addr"
    else
        echo "Error: Failed to send email to $to_addr"
        return 1
    fi
}

# List all recipients separated by commas
RECIPIENTS="gustavodcdamas@gmail.com,kadegiovani@gmail.com,giovanikade@hotmail.com"

send_email "$RECIPIENTS" "Backup Iniciado" "Backup Iniciado às $(date +'%Y-%m-%d %H:%M:%S')" "/var/reverse-proxy/logs/backup_incremental.log"