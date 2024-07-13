function whoup() {
  lan_ip=$(ip addr | rg -o "(192\.168\.[0-9]{1,3}\.[0-9]{1,3}|10\.0\.[0-9]{1,3}\.[0-9]{1,3})/24")
  echo "lan_ip: $lan_ip"
  lan_ip=$(echo "$lan_ip" | sed 's/\.[0-9]\{1,3\}\/[0-9]\{1,2\}$/.0\/24/')
  nmap -sL "$lan_ip" | rg "\("
}

