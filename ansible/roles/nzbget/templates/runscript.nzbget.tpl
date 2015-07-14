#!/bin/sh
### BEGIN INIT INFO
# Provides:          nzbget
# Required-Start:    $local_fs $network $remote_fs
# Required-Stop:     $local_fs $network $remote_fs
# Should-Start:      $NetworkManager
# Should-Stop:       $NetworkManager
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: starts instance of NZBGet
# Description:       starts instance of NZBGet using start-stop-daemon
### END INIT INFO

# Source init functions
. /lib/lsb/init-functions
# Start/stop the NZBget daemon.
#
case "$1" in
start)   echo -n "Start services: NZBget"
/usr/bin/nzbget -D -c /home/{{nzbget.user}}/.nzbget
;;
stop)   echo -n "Stop services: NZBget"
/usr/bin/nzbget -Q
;;
restart)
$0 stop
$0 start
;;
*)   echo "Usage: $0 start|stop|restart"
exit 1
;;
esac
exit 0