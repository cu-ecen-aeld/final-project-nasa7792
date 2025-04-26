#!/bin/sh

### BEGIN INIT INFO
# Provides:          bootsplash
# Required-Start:
# Required-Stop:
# Default-Start:     S
# Default-Stop:
# Short-Description: Display psplash boot progress
### END INIT INFO

case "$1" in
    start)
        echo "Starting psplash..."

        psplash &
        PSPLASH_PID=$!

        # Give psplash a moment to start
        sleep 1

        # Smooth progress update
        for i in $(seq 0 2 100); do
            psplash-write "PROGRESS $i"
            psplash-write "MSG Loading... $i%"
            sleep 0.1
        done

        # Final boot message
        psplash-write "MSG Booting System..."
        sleep 1

        # Quit splash and wait for it to finish
        psplash-write "QUIT"
        wait $PSPLASH_PID
        ;;

    stop)
        echo "Starting psplash..."

        psplash &
        
        PSPLASH_PID=$!

        # Give psplash a moment to start
        sleep 1

        # Smooth progress update
        for i in $(seq 0 2 100); do
            psplash-write "PROGRESS $i"
            psplash-write "MSG Rebooting... $i%"
            sleep 0.1
        done

        # Final boot message
        psplash-write "MSG System Shutdown"
        sleep 1

        # Quit splash and wait for it to finish
        psplash-write "QUIT"
        wait $PSPLASH_PID
        ;;

    *)
        echo "Usage: $0 {start|stop}"
        exit 1
        ;;
esac

exit 0
