/var/log/deluge-*.log {
    weekly
    missingok
    rotate 7
    compress
    notifempty
    copytruncate
    create 600
}