#!/bin/sh
#this script Adds i2c modules
case "$1" in
    start)
        echo "load i2c modules"
        modprobe i2c-dev
        modprobe i2c-bcm2835
        modprobe snd_bcm2835
        ;;
    stop)
        echo "unloading i2c module"
        rmmod snd_bcm2835
        rmmod i2c-bcm2835 
        rmmod i2c-dev
        ;;
    *)
        echo "Usage: $0 {start|stop}"
        exit 1
        ;;
esac

exit 0
