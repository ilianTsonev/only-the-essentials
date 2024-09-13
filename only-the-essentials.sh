#!/bin/bash

# Check if the script is run by root
if [ "$EUID" -ne 0 ]; then
  echo "This script must be run as root. Exiting..."
  exit 1
fi
clear
# Welcome message with user-specific greeting
hour=$(date +"%H")
    if [ "$hour" -ge 5 ] && [ "$hour" -lt 12 ]; then
        greeting="Good Morning,"
    elif [ "$hour" -ge 12 ] && [ "$hour" -lt 17 ]; then
        greeting="Good Afternoon,"
    elif [ "$hour" -ge 17 ] && [ "$hour" -lt 21 ]; then
        greeting="Good Evening,"
    else
        greeting="Good Night,"
fi
echo "---$greeting $(id -un), Welcome to your Linux Distro!---"

# Attempt to detect the distribution using multiple methods
if command -v lsb_release &> /dev/null; then
    distro=$(lsb_release -d | awk -F"\t" '{print $2}')
elif [ -f /etc/os-release ]; then
    distro=$(grep -oP '(?<=^PRETTY_NAME=).+' /etc/os-release | tr -d '"')
elif [ -f /etc/issue ]; then
    distro=$(head -n 1 /etc/issue)
else
    distro="Unknown Distribution"
fi
echo "Detected Linux Distribution: $distro"
echo "What would you like to use your system for today?"

# List of Linux distributions
distros=(
    "Ångström distribution" "AntiX" "Armbian" "Astra Linux" "AV Linux"
    "BackBox" "Bharat Operating System Solutions" "BlankOn Linux" "Canaima"
    "Commodore OS" "Corel Linux" "CrunchBang Linux" "Damn Small Linux"
    "Debian Pure Blend" "Debian-Med" "Deepin" "Devuan" "DoudouLinux" "Dreamlinux"
    "Dyson" "Elementary OS" "Emdebian Grip" "Emmabuntüs" "Finnix" "FreedomBox"
    "GLinux" "GNewSense" "Google Cloud Shell" "Grml" "Guadalinex" "HandyLinux"
    "Huayra GNU/Linux" "Kaisen Linux" "Kali Linux" "Kali NetHunter" "Kanotix"
    "Knoppix" "Libranet" "LiMux" "Linspire" "Linux Mint Debian Edition"
    "The Linux Schools Project" "Maemo" "MEPIS" "Musix GNU+Linux" "MX Linux"
    "OpenZaurus" "Pardus" "Parrot OS" "Parsix" "Proxmox Virtual Environment"
    "Puavo" "PureOS" "Q4OS" "Raspberry Pi OS" "Slax" "SolydXK" "SONiC" "Ubuntu 24.04.1 LTS"
    "SparkyLinux" "SteamOS" "Subgraph" "Sunwah Linux" "Tails" "TurnKey Linux"
    "Ubuntu Core" "Univention Corporate Server" "Uruk GNU/Linux" "UserLinux"
    "USU" "Vyatta" "VyOS" "Webconverger" "Wienux" "Xandros Linux"
)

# Define color variables
RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Use the colors for various output sections
echo -e "${RED}This text is red - Critical information!${NC}"
echo -e "${BLUE}This text is blue - General information.${NC}"
echo -e "${GREEN}This text is green - Success messages.${NC}"
echo -e "${YELLOW}This text is yellow - Warnings and notices.${NC}"
echo -e "${CYAN}This text is cyan - Additional info.${NC}"

# Advanced options function
continueshi() {
    echo "The following actions require root privileges."
    echo "Red indicates Debian-specific actions, Blue is for general Linux distributions."
    echo "Choose what you'd like to install:"
    echo -e "${YELLOW}The following actions require root privileges.${NC}"
    echo -e "${YELLOW}Red indicates Debian-specific actions, Blue is for general Linux distributions.${NC}"
    echo -e "${CYAN}Choose what you'd like to install:${NC}"
    echo -e "${RED}1. Development/Programming${NC}"
    echo -e "${BLUE}2. Photo Editing${NC}"
    echo -e "${RED}3. Gaming${NC}"
    echo -e "${BLUE}4. 3D Modeling${NC}"
    echo -e "${BLUE}5. Feedback${NC}"
    echo -e "${BLUE}6. Advanced Options${NC}"
    echo -e "${RED}7. Exit${NC}"
    echo -e "${CYAN}9. System Information${NC}"
    echo -e "${RED}10. Network Diagnostics${NC}"
    echo -e "${BLUE}11. Package Management Helper${NC}"
    echo -e "${BLUE}12. Backup and Restore${NC}"
    echo -e "${RED}13. Web Development${NC}"
    echo -e "${BLUE}14. System Health Check (might not work)${NC}"
    echo -e "${RED}15. Virtualization Tools${NC}"
    echo -e "${RED}16. DevOps Tools${NC}"
    echo -e "${RED}17. Multimedia & Video Editing${NC}"
    echo -e "${RED}18. Security & Penetration Testing${NC}"
    echo -e "${RED}19. Networking Tools${NC}"
    echo -e "${RED}20. Office & Productivity${NC}"
    echo -e "${RED}21. Audio & Music Production${NC}"
    echo -e "${RED}22. Mobile App Development${NC}"
    echo -e "${BLUE}23. Advanced Gaming${NC}"

    read -p "Please enter your choice (1-23): " choose

    case "$choose" in
        1)
            echo "You chose Development/Programming."
            echo "Consider installing the following tools:"
            echo "- Visual Studio Code: 'snap install code --classic'"
            echo "- Vim (CLI Editor), Git (Version Control), Docker: 'apt install vim git docker.io'"
            ;;
        2)
            echo "You chose Photo Editing."
            echo "You can open Photopea in your browser."
            echo "Additionally, you may install GIMP: 'snap install gimp'"
            ;;
        3)
            echo "You chose Gaming."
            echo "Recommended installations:"
            echo "- Steam, Proton, Lutris, Wine: 'apt install steam proton lutris wine'"
            echo "- Explore KDE and GNOME games!"
            ;;
        4)
            echo "You chose 3D Modeling."
            echo "Blender is available at their website as an AppImage."
            echo "You can also install FreeCAD: 'snap install freecad'"
            ;;
        5)
            echo "You chose Feedback."
            echo "Check out 'snap info only-the-essentials' for more information."
            echo "Quick feedback? Contact me on Discord at .memelian4"
            echo "Want the FASTEST contact? E-mail me on this mail: Ilian.iliev.tsonev@gmail.com"
            ;;
        6)
            echo "You chose Advanced Options."
            echo -e "${YELLOW}Here are some additional advanced operations you can perform:${NC}"
            echo "1. System Update: Update your entire system with 'sudo apt update && sudo apt upgrade'."
            echo "2. Clean Up: Free up space with 'sudo apt autoremove && sudo apt autoclean'."
            echo "3. Install Essential Tools: 'apt install build-essential curl wget net-tools'"
            echo "4. Check System Logs: 'journalctl -p 3 -xb' (shows only errors)"
            ;;
        7)
            echo "Exiting. Have a great day!"
            exit 0
            ;;
        8)
            echo -e "${GREEN}You had found an easter egg!"
            ;;
        9) # System Information Section
            echo -e "${CYAN}Fetching System Information...${NC}"
            echo -e "CPU Info:"
            lscpu | grep 'Model name'
            echo -e "Memory Info:"
            free -h | grep 'Mem:'
            echo -e "Disk Usage:"
            df -h --total | grep 'total'
            echo -e "Uptime:"
            uptime -p
            ;;
        10) # Network Diagnostics Section
            echo -e "${BLUE}Network Information:${NC}"
            echo "Current IP Address:"
            ip addr show | grep 'inet ' | awk '{print $2}' | grep -v '127.0.0.1'
            echo "Public IP Address:"
            curl -s ifconfig.me
            echo -e "DNS Servers:"
            systemd-resolve --status | grep 'DNS Servers' -A 2
            echo -e "${YELLOW}Do you want to perform a ping test to Google? (y/n):${NC}"
            read -r ping_test
            if [[ "$ping_test" == "y" ]]; then
                ping -c 4 google.com
            fi
            ;;
        11) # Package Management Helper
            echo -e "${GREEN}Would you like to manage packages? (y/n):${NC}"
            read -r pkg_mgmt
            if [[ "$pkg_mgmt" == "y" ]]; then
                echo -e "${YELLOW}Choose your package manager:${NC}"
                echo "1. APT (for Debian/Ubuntu based)"
                echo "2. Snap"
                echo "3. Flatpak"
                read -p "Enter choice (1-3): " pkg_choice
                case $pkg_choice in
                    1)
                        echo "You chose APT. Let's update and install packages!"
                        sudo apt update && sudo apt upgrade
                        read -p "Enter the package name to install: " pkg_name
                        sudo apt install "$pkg_name"
                        ;;
                    2)
                        echo "You chose Snap. Let's install packages!"
                        read -p "Enter the snap package name to install: " snap_name
                        sudo snap install "$snap_name"
                        ;;
                    3)
                        echo "You chose Flatpak. Let's install packages!"
                        read -p "Enter the flatpak package name to install: " flatpak_name
                        sudo flatpak install "$flatpak_name"
                        ;;
                    *)
                        echo -e "${RED}Invalid choice!${NC}"
                        ;;
                esac
            fi
            ;;
        12) # Backup and Restore Section
            echo -e "${CYAN}Would you like to backup your important files or configurations? (y/n):${NC}"
            read -r backup_choice
            if [[ "$backup_choice" == "y" ]]; then
                echo -e "${GREEN}Select an option:${NC}"
                echo "1. Backup home directory"
                echo "2. Backup system configurations"
                echo "3. Restore previous backup"
                read -p "Choose an option (1-3): " backup_option
                case "$backup_option" in
                    1)
                        echo "Backing up home directory to ~/backup_home.tar.gz"
                        tar -czvf ~/backup_home.tar.gz ~/
                        ;;
                    2)
                        echo "Backing up system configuration files to ~/backup_configs.tar.gz"
                        sudo tar -czvf ~/backup_configs.tar.gz /etc/
                        ;;
                    3)
                        echo "Restoring backup from ~/backup_home.tar.gz"
                        tar -xzvf ~/backup_home.tar.gz -C ~/
                        ;;
                    *)
                        echo -e "${RED}Invalid choice!${NC}"
                        ;;
                esac
            fi
            ;;
            13) # Web Development Environment
    echo "You chose Web Development."
    echo "Setting up a basic web development environment with Node.js, Nginx, and MySQL."
    read -p "Do you want to install a full stack (Node.js, Nginx, MySQL, PHP)? (y/n): " full_stack
    if [[ "$full_stack" == "y" ]]; then
        echo "Installing Node.js, Nginx, MySQL, and PHP..."
        sudo apt install -y nodejs npm nginx mysql-server php-fpm
        echo "Installation complete!"
    else
        echo "Skipping full stack installation."
    fi
    ;;  
        14) # System Health Check
            echo -e "${CYAN}System Health Check:${NC}"
            echo "Checking CPU Temperature:"
            sensors | grep 'Package id 0:' || echo "Sensors not available on this system."
            echo "Top 5 processes by CPU usage:"
            ps -eo pid,comm,%cpu --sort=-%cpu | head -6
            ;;
            15) # Virtualization Tools
    echo "You chose Virtualization."
    echo "Installing VirtualBox and KVM..."
    sudo apt install -y virtualbox qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils
    sudo systemctl enable --now libvirtd
    echo "VirtualBox and KVM have been installed."
    echo "You can manage virtual machines using 'virt-manager'."
    ;;
16) # DevOps Tools
    echo "You chose DevOps."
    echo "Installing Docker, Kubernetes, and Ansible..."
    sudo apt install -y docker.io ansible
    echo "For Kubernetes setup, you can use Minikube or MicroK8s."
    read -p "Do you want to install Minikube or MicroK8s? (1 for Minikube, 2 for MicroK8s): " k8s_choice
    if [[ "$k8s_choice" == "1" ]]; then
        curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
        sudo install minikube-linux-amd64 /usr/local/bin/minikube
        echo "Minikube installed!"
    elif [[ "$k8s_choice" == "2" ]]; then
        sudo snap install microk8s --classic
        sudo usermod -aG microk8s $USER
        echo "MicroK8s installed!"
    else
        echo "Skipping Kubernetes installation."
    fi
    ;;
17) # Multimedia & Video Editing Tools
    echo "You chose Multimedia & Video Editing."
    echo "Installing OBS Studio, Kdenlive, and FFmpeg..."
    sudo apt install -y obs-studio kdenlive ffmpeg
    echo "You can now start editing videos or stream using OBS Studio."
    ;;
18) # Security & Penetration Testing Tools
    echo "You chose Security & Penetration Testing."
    echo "Installing Wireshark, Nmap, and Metasploit Framework..."
    sudo apt install -y wireshark nmap
    curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate | sudo bash
    echo "Tools installed! You can run 'wireshark', 'nmap', and 'msfconsole' to start using them."
    ;;
19) # Networking Tools
    echo "You chose Networking Tools."
    echo "Installing OpenVPN, WireGuard, and Netcat..."
    sudo apt install -y openvpn wireguard netcat
    echo "You can now configure and use OpenVPN or WireGuard for secure networking."
    ;;
20) # Office & Productivity Tools
    echo "You chose Office & Productivity."
    echo "Installing LibreOffice, Thunderbird, and Nextcloud..."
    sudo apt install -y libreoffice thunderbird nextcloud-desktop
    echo "You can now start using LibreOffice for documents and Thunderbird for email."
    ;;
21) # Audio & Music Production Tools
    echo "You chose Audio & Music Production."
    echo "Installing Audacity, Ardour, and LMMS..."
    sudo apt install -y audacity ardour lmms
    echo "You can now start producing music with these tools!"
    ;;
22) # Mobile App Development Tools
    echo "You chose Mobile App Development."
    echo "Installing Android Studio and Flutter..."
    sudo apt install -y openjdk-11-jdk
    sudo snap install android-studio --classic
    sudo snap install flutter --classic
    echo "You can now develop mobile apps using Android Studio and Flutter."
    ;;
23) # Advanced Gaming Tools
    echo "You chose Advanced Gaming."
    echo "Installing Lutris and Wine for Windows game compatibility..."
    sudo apt install -y lutris wine
    echo "You can now use Lutris and Wine to play Windows games on Linux."
    ;;

        *)
            echo "Invalid option. Please choose a number between 1 and 14."
            ;;
    esac
}
continueshi
