#!/bin/bash


# Function to get CPU usage
function 1_cpu_usage {
  top -n 1 | head -n 8 | awk '/CPU usage/ {print $1, $2, $3}'
}


function 2_disk_usage {
  x=$(df -h | grep /$ | awk '{print $5}')
  echo 'Disk usage:' $x
}

echo 'The displaying system information: ' 
1_cpu_usage
2_disk_usage

