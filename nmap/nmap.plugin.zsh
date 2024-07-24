function whoup() {
  ip4_addr=$(nmcli device show wlan0 | rg IP4.ADDRESS | sed 's/IP4.ADDRESS\[1\]:\s*//')
  echo "IP4 ADDRESS: $ip4_addr"
  ip4_addr=$(echo "$ip4_addr" | sed 's/\.[0-9]\{1,3\}\/[0-9]\{1,2\}$/.0\/24/')
  nmap -sL "$ip4_addr" | rg "\("
}
