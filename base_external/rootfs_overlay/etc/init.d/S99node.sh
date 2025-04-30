#!/bin/sh
#this scripts starts the node js server

SERVER_JS="/usr/bin/server.js"

case "$1" in
    start)
        echo "Starting server.js"
        node "$SERVER_JS" & 
        echo $! > /var/run/server.pid
        ;;
    stop)
        echo "Stopping server.js"
        if [ -f /var/run/server.pid ]; then
            kill "$(cat /var/run/server.pid)"
            rm -f /var/run/server.pid
        else
            pkill -f "$SERVER_JS"  
        fi
        ;;
    *)
        echo "Usage: $0 {start|stop}"
        exit 1
        ;;
esac

exit 0
