#!/bin/sh

#this start stop scripts is resposible for showing a simple custom bootslpash

case "$1" in
    start)
        psplash &
        PSPLASH_PID=$!

        # create An effect of smooth update of progress bar
        for i in $(seq 0 2 100); do
            psplash-write "PROGRESS $i"
            psplash-write "MSG Loading... $i%"
            sleep 0.1
        done

        # Final boot message
        psplash-write "MSG Booting System..."

        # Quit splash and wait for it to finish
        psplash-write "QUIT"
        wait $PSPLASH_PID
        ;;

    stop)
        psplash &
        
        PSPLASH_PID=$!

        # create An effect of smooth update of progress bar
        for i in $(seq 0 2 100); do
            psplash-write "PROGRESS $i"
            psplash-write "MSG Rebooting... $i%"
            sleep 0.1
        done

        # Final shutdown message
        psplash-write "MSG System Shutdown"

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
