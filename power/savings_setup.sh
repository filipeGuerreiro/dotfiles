touch /etc/rc.local
echo "sudo powertop --auto-tune" | sudo tee -a /etc/rc.local

# disable ethernet controller
controller=$(ifconfig | grep -B 3 Ethernet | grep -Eo '^[^ ][a-zA-Z0-9]+')
echo "iface ${controller} inet manual" | sudo tee -a /etc/network/interfaces

