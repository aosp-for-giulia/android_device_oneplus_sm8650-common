#!/vendor/bin/sh
last=""
while true; do
    cur=$(cat /sys/class/power_supply/usb/online 2>/dev/null)
    if [ "$cur" != "$last" ]; then
        stop vendor.health-default
        start vendor.health-default
        last="$cur"
    fi
    sleep 5
done
