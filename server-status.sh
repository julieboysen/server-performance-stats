echo "OS version"
hostnamectl | grep "Operating System"
echo

echo "Uptime"
uptime | awk '{print substr($3, 1, length($3)-1)}'
echo

echo "Load average"
uptime | awk '{print "Past minute: " substr($8, 1, length($8)-1)}'
uptime | awk '{print "Past 5 minutes: " substr($9, 1, length($9)-1)}'
uptime | awk '{print "Past 15 minutes: " $10}'
echo

echo "Logged in users"
uptime | awk '{print $4}'
echo

echo "Total CPU usage"
top -bn1 | grep "%Cpu(s):" | cut -d ',' -f 4 | awk '{print "Usage: " 100-$1 "%"}'
echo

echo "Total memory usage"
free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'
echo

echo "Total disk usage"
df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)\n", $3,$2,$5}'
echo

echo "Top 5 processes by CPU usage"
top -b -n 1 | head -n 11  | tail -n 5
echo 

echo "Top 5 processes by memory usage"
top -b -o +%MEM | head -n 11 | tail -n 5
