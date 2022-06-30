#!/bin/bash
killall -q polybar
polybar left &
polybar middle &
polybar right &
echo "Polybar launched..."
