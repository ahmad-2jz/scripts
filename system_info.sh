#!/bin/bash

timestamp=$(date +"%Y%m%d_%H%M%S")
logfile="system_info_${timestamp}.log"

name="Ahmed"
hostname=$(hostname)
cpu_info=$(lscpu | grep -E '^Model name|^CPU\(s\)')
memory_info=$(free -h | grep ^Mem: | awk '{print "Total Memory: " $2}')
os_info=$(lsb_release -d | awk -F"\t" '{print $2}')
storage_info=$(df -h --total | grep total | awk '{print "Total SSD Storage: " $2}')

echo "System Information Report" | tee -a $logfile
echo "=========================" | tee -a $logfile
echo "Your Name: $name" | tee -a $logfile
echo "System Name: $hostname" | tee -a $logfile
echo "$cpu_info" | tee -a $logfile
echo "$memory_info" | tee -a $logfile
echo "Operating System: $os_info" | tee -a $logfile
echo "$storage_info" | tee -a $logfile

echo "System Information saved to: $logfile" | tee -a $logfile

