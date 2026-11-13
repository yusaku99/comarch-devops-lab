#!/bin/bash
LOG_FILE=${1:-"/var/log/nginx/access.log"}

echo "=== Comarch Operations Log Analysis Report ==="
echo "Timestamp: $(date)"

if [ ! -f "$LOG_FILE" ]; then
    echo "[WARNING] Log file not found at $LOG_FILE. Generating sample check..."
    exit 0
fi

echo "--- Top 5 Client IPs ---"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5

echo "--- HTTP 5xx Server Errors Count ---"
grep -E " 50[0-4] " "$LOG_FILE" | wc -l


