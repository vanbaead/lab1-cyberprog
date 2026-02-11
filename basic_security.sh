#!/bin/bash
# basic_security.sh
# Purpose: Automate basic host and network reconnaissance tasks for cybersecurity analysis.

# Variables
SUBNET="192.168.64.0/24"   # Local subnet used to discover active hosts on the network
TARGET="192.168.64.5"      # Target host (Metasploitable-2 VM) for service and vulnerability scanning

echo "Enhanced Security Script"
echo "========================="
echo

# Part 1: Collect Information About the Local Machine
echo "Part 1: Information About My Own Machine"
echo "========================================="
echo

echo "[*] System Information:"
# uname -a displays detailed system and kernel information including OS version and architecture.
# Security use: helps identify kernel versions that may be vulnerable or require patching.
uname -a
echo

echo "[*] Network Interfaces and IP Addresses:"
# ip addr show lists all network interfaces along with assigned IP and MAC addresses.
# Security use: confirms the system’s network configuration and active interfaces.
ip addr show
echo

echo "[*] ARP Table:"
# arp -a shows the ARP cache, mapping IP addresses to MAC addresses on the local network.
# Security use: helps identify nearby hosts and detect abnormal ARP entries.
arp -a
echo

echo "[*] Routing Table:"
# ip route displays the system’s routing rules including the default gateway.
# Security use: verifies how traffic leaves the host and helps identify unexpected or malicious routes.
ip route
echo

echo "[*] Open Ports on Local Machine:"
# netstat -tuln lists listening TCP and UDP ports without resolving names.
# Flags: -t (TCP), -u (UDP), -l (listening), -n (numeric output).
# Security use: identifies services exposed on the local machine.
sudo netstat -tuln
echo

# Part 2: Collect Information About a Target
echo "Part 2: Information About a Target"
echo "=================================="
echo

echo "[*] Active Hosts in Subnet ($SUBNET):"
# nmap -sn performs host discovery only (ping scan) to identify live systems.
# Security use: supports asset discovery and network enumeration.
sudo nmap -sn "$SUBNET"
echo

echo "[*] Service Scan on Target ($TARGET):"
# nmap -sV detects open ports and attempts to identify running service versions.
# Security use: enables identification of outdated or vulnerable services.
sudo nmap -sV "$TARGET"
echo

echo "[*] Vulnerability Scan on Target ($TARGET):"
# nmap --script vuln runs vulnerability detection scripts against the target.
# Security use: flags common misconfigurations and known vulnerabilities.
sudo nmap --script vuln "$TARGET"
echo