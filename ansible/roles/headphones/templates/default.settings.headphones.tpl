## HP_USER=         #$RUN_AS, username to run headphones under, the default is headphones
## HP_HOME=         #$APP_PATH, the location of Headphones.py, the default is /opt/headphones
## HP_DATA=         #$DATA_DIR, the location of headphones.db, cache, logs, the default is /opt/headphones
## HP_PIDFILE=      #$PID_FILE, the location of headphones.pid, the default is /var/run/headphones/headphones.pid
## PYTHON_BIN=      #$DAEMON, the location of the python binary, the default is /usr/bin/python
## HP_OPTS=         #$EXTRA_DAEMON_OPTS, extra cli option for headphones, i.e. " --config=/home/headphones/config.ini"
## SSD_OPTS=        #$EXTRA_SSD_OPTS, extra start-stop-daemon option like " --group=users"
## HP_PORT=         #$PORT_OPTS, hardcoded port for the webserver, overrides value in config.ini
##
## EXAMPLE if want to run as different user
## add HP_USER=username to /etc/default/headphones
## otherwise default headphones is used
HP_USER={{headphones.user}}
HP_HOME={{headphones.home}}
HP_DATA={{headphones.home}}
HP_PIDFILE={{headphones.home}}/headphones.pid