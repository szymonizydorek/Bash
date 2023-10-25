#!/bin/bash

# Function to get CPU usage
function 1_cpu_usage {
  top -n 1 | head -n 8 | awk '/CPU usage/ {print $1, $2, $3}'
}


# Funcion to get memoty usage
function 2_memory {
  free
}
echo 'The displaying system information below:' 
1_cpu_usage
