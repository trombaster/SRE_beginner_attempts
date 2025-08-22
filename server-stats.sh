#!/usr/bin/env bash

echo "===== Total CPU Usage ===="
cpu_idle=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/")
echo "CPU load: $(echo "100-$cpu_idle")%"

echo 

echo "===== Memory Usage ===="
free | grep 'Mem:' | awk '{print "Total: " $2 "\nFree: " $4/$2 * 100.0"%\nUsed: " $3/$2 * 100.0"%"}'

echo 

echo "===== Disk Usage ===="
df | grep "/" -w | awk '{print "Total: " $3+$4 "\nFree: " $4/($4+$3) * 100.0 "%\nUsed: " $3/($4+$3) * 100.0 "%"}'

echo 

echo "====Top 5 Processes by CPU Usage===="
ps aux --sort -%cpu | head -n 6 | awk '{print $1 "\t" $2 "\t" $3 "\t" $11}'

echo 

echo "====Top 5 Processes by Memory Usage===="
ps aux --sort -%mem | head -n 6 | awk '{print $1 "\t" $2 "\t" $4 "\t" $11}'

echo

echo "====OS version===="
cat /etc/*release | grep "PRETTY_NAME"

echo 

echo "====Uptime===="
uptime -p

