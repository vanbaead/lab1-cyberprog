## Lab 1: CTI with MITRE ATT&CK, and Bash Scripting  
CSCI 5742/CSCY 4742: Cybersecurity Programming and Analytics, Spring 2026  

**Name & Student ID**: Adam Vanbaelinghem, 110367801  
- [ ] CSCI 5742 (Graduate)  
- [x] CSCY 4742

---

## **Part 1: Linux and Bash**

### **Screenshots**

![Script running 1](screenshots/script_ss_1.png)

![Script running 2](screenshots/script_ss_2.png)

---

### **Summary and Analysis**

#### **1. Purpose of the Script**

Automating the gathering of fundamental host and network security data from a Linux system and a specified target host is the goal of the `basic_security.sh` script. The program offers a repeatable and effective way to evaluate the security posture of a distant system as well as the exposure of the local machine by combining many frequently used reconnaissance and enumeration commands into a single executable script.

To provide situational awareness of the host environment, the script collects system and kernel data, network interface settings, ARP cache entries, routing rules, and locally listening ports. By locating active hosts on the local subnet, listing services and their versions on a target computer, and executing vulnerability detection scripts using Nmap, it subsequently carries out active network reconnaissance. 

#### **2. Challenges Faced**

Ensuring appropriate permissions for network-related commands like `netstat` and `nmap`, which need elevated rights to view low-level networking information, was one difficulty faced throughout development. This was fixed by only using `sudo` when absolutely required, which upheld the least privilege principle while preserving the script's functionality.

Verifying network connection in the virtualized lab environment presented another difficulty. Verifying IP addressing, routing data, and host discovery outcomes was necessary to ensure that the Kali attack virtual machine and the Metasploitable-2 target virtual machine were on the same subnet.

#### **3. Extensions Added**

Using the `ip route` command, routing table inspection was introduced as an addition to the script. By exposing the host's traffic routing, including the default gateway and active network pathways, this innovation adds more context that is pertinent to security. To identify configuration errors, unexpected gateways, or malicious route manipulation, one must have a thorough understanding of routing behavior.

---

## **Part 2: CTI Training with MITRE ATT&CK**

*(TBD)*