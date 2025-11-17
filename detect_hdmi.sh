#!/bin/bash

hdmi="HDMI-2"
dual_mon_sh="dual_mon_side_by_side.sh"
single_mon_sh="single_mon.sh"

if xrandr | grep -E -q "HDMI-2 connected"; then
  prev=1
  echo "HDMI Connected to 2nd Monitor"
  $HOME/Scripts/update_monitor/$dual_mon_sh
else
  prev=0
  echo "HDMI Disconnected, using only laptop monitor"
  $HOME/Scripts/update_monitor/$single_mon_sh
fi

while true; do
  if xrandr | grep -E -q "HDMI-2 connected"; then
    cur=1
  else
    cur=0
  fi

  if [ "$cur" -ne "$prev" ]; then
    if [ $cur -eq 1 ]; then
      echo "HDMI Connected to 2nd Monitor"
      $HOME/Scripts/update_monitor/$dual_mon_sh
    elif [ $cur -eq 0 ]; then
      echo "HDMI Disconnected, using only laptop monitor"
      $HOME/Scripts/update_monitor/$single_mon_sh
    fi

    prev=$cur
  fi
  sleep 7
done
