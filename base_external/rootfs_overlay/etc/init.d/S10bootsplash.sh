#!/bin/sh
psplash &
PSPLASH_PID=$!

# Give psplash a moment to start up
sleep 1

madplay -o raw:-/usr/bin/sound.mp3 | aplay -D hw:1,0 -f cd &

# Smooth progress update
for i in $(seq 0 2 100); do
    psplash-write "PROGRESS $i"
    psplash-write "MSG Loading... $i%"
    sleep 0.1
done

# Final message
psplash-write "Booting System..."
sleep 1

psplash-write "QUIT"
wait $PSPLASH_PID
