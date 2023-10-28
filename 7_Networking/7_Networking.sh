function DNS {
  x=$(cat /etc/resolv.conf | grep "nameserver" | awk '{print $2}')
  echo "1. DNS Name server IP is:" $x

}

function IP {
  IPv4=$(ifconfig | grep -A 5 "en0" | grep inet | awk 'NR==2 {print $2}')
  IPv6=$(ifconfig | egrep 'en0' | awk '/fe80/ {print $2}')
  echo "2. IPv6 address is:" $IPv6
  echo "3. IPv4 address is:" $IPv4
}

function PORTS {
 echo "4. Open port can be see: "
 netstat | head -n 10


}



DNS
IP
PORTS
