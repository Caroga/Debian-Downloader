# Configuration for /etc/init.d/deluged
# The init.d script will only run if this variable is non-empty.
DELUGED_USER="{{deluged.user}}"
# Should we run at startup?
RUN_AT_STARTUP="{{deluged.run_at_startup}}"