#!/bin/bash 
# ^ This loads the bash which CANNOT RUN THE SCRFIPT without putting it in there

# yes

# no
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
echo "---$greeting $(id -un), Welcome to your Linux Distro!---" # this is a simple greeting and depending on the date of your current Computer.

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
echo "Detected Linux Distribution: $distro" # The detected Distro might not be at it's best accuracy  because every distro is putting their codename in a different place
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
    echo "Choose what you'd like to install:" #whole lotta blue
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

    read -p "Please enter your choice (1-23): " choose #the read line is here for reading the user choice, which if it is an string... god help us

    case "$choose" in
    1)
        echo "You chose Development/Programming."
        echo "Consider installing the following tools:"
        echo "- Visual Studio Code: 'if you want to install Visual Studio Code, use snap install code --classic'"
        echo "- Vim (CLI Editor), Git (Version Control), Docker: 'if you want to install Vim, Git, and Docker, use apt install vim git docker.io'"
        ;;
    2)
        echo "You chose Photo Editing."
        echo "You can open Photopea in your browser."
        echo "Additionally, you may install GIMP: 'if you want to install GIMP, use snap install gimp'"
        ;;
    3)
        echo "You chose Gaming."
        echo "Recommended installations:"
        echo "- Steam, Proton, Lutris, Wine: 'if you want to install Steam, Proton, Lutris, and Wine, use apt install steam proton lutris wine'"
        echo "- Explore KDE and GNOME games!"
        ;;
    4)
        echo "You chose 3D Modeling."
        echo "Blender is available at their website as an AppImage."
        echo "You can also install FreeCAD: 'if you want to install FreeCAD, use snap install freecad'"
        ;;
    5)
        echo "You chose Feedback."
        echo "Check out 'snap info only-the-essentials' for more information."
        echo "Quick feedback? Contact me on Discord at .memelian4"
        echo "Want the FASTEST contact? E-mail me at Ilian.iliev.tsonev@gmail.com"
        ;;
    6)
        echo "You chose Advanced Options."
        echo -e "${YELLOW}Here are some additional advanced operations you can perform:${NC}"
        echo "1. System Update: 'if you want to update your entire system, use sudo apt update && sudo apt upgrade'"
        echo "2. Clean Up: 'if you want to free up space, use sudo apt autoremove && sudo apt autoclean'"
        echo "3. Install Essential Tools: 'if you want to install essential tools, use apt install build-essential curl wget net-tools'"
        echo "4. Check System Logs: 'if you want to check system logs for errors, use journalctl -p 3 -xb'"
        ;;
    7)
        echo "Exiting. Have a great day!"
        exit 0
        ;;
    8)
        echo -e "${GREEN}You had found an easter egg! That's rarely gonna ever happen! You are lucky to find it! You might be the first person who saw it!${NC}"
        ;;
    9) # System Information Section
        echo -e "${CYAN}Fetching System Information...${NC}"
        echo -e "CPU Info:"
        echo "Use 'lscpu | grep \"Model name\"' to get CPU information."
        echo -e "Memory Info:"
        echo "Use 'free -h | grep \"Mem:\"' to get memory information."
        echo -e "Disk Usage:"
        echo "Use 'df -h --total | grep \"total\"' to check disk usage."
        echo -e "Uptime:"
        echo "Use 'uptime -p' to check system uptime."
        ;;
    10) # Network Diagnostics Section
        echo -e "${BLUE}Network Information:${NC}"
        echo "Current IP Address:"
        echo "Use 'ip addr show | grep \"inet \" | awk \'{print \$2}\' | grep -v \"127.0.0.1\"' to get your current IP address."
        echo "Public IP Address:"
        echo "Use 'curl -s ifconfig.me' to get your public IP address."
        echo -e "DNS Servers:"
        echo "Use 'systemd-resolve --status | grep \"DNS Servers\" -A 2' to view DNS servers."
        echo -e "${YELLOW}Do you want to perform a ping test to Google? (y/n):${NC}"
        read -r ping_test
        if [[ "$ping_test" == "y" ]]; then
            echo "Use 'ping -c 4 google.com' to perform a ping test."
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
                    echo "You chose APT. To update and install packages, use 'sudo apt update && sudo apt upgrade'."
                    echo "Enter the package name to install:"
                    read -r pkg_name
                    echo "To install $pkg_name, use 'sudo apt install $pkg_name'."
                    ;;
                2)
                    echo "You chose Snap. To install packages, use 'sudo snap install [package_name]'."
                    echo "Enter the snap package name to install:"
                    read -r snap_name
                    echo "To install $snap_name, use 'sudo snap install $snap_name'."
                    ;;
                3)
                    echo "You chose Flatpak. To install packages, use 'sudo flatpak install [package_name]'."
                    echo "Enter the flatpak package name to install:"
                    read -r flatpak_name
                    echo "To install $flatpak_name, use 'sudo flatpak install $flatpak_name'."
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
                    echo "To back up the home directory, use 'tar -czvf ~/backup_home.tar.gz ~/'"
                    ;;
                2)
                    echo "To back up system configuration files, use 'sudo tar -czvf ~/backup_configs.tar.gz /etc/'"
                    ;;
                3)
                    echo "To restore from a backup, use 'tar -xzvf ~/backup_home.tar.gz -C ~/'"
                    ;;
                *)
                    echo -e "${RED}Invalid choice!${NC}"
                    ;;
            esac
        fi
        ;;
    13) # Web Development Environment
        echo "You chose Web Development."
        echo "To set up a basic web development environment with Node.js, Nginx, and MySQL:"
        echo "Use 'sudo apt install -y nodejs npm nginx mysql-server php-fpm' for a full stack installation."
        echo "Skipping full stack installation."
        ;;
    14) # System Health Check
        echo -e "${CYAN}System Health Check:${NC}"
        echo "To check CPU temperature, use 'sensors | grep \"Package id 0:\"'."
        echo "To list top 5 processes by CPU usage, use 'ps -eo pid,comm,%cpu --sort=-%cpu | head -6'."
        ;;
    15) # Virtualization Tools
        echo "You chose Virtualization."
        echo "To install VirtualBox and KVM, use 'sudo apt install -y virtualbox qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils'."
        echo "To enable and start libvirtd, use 'sudo systemctl enable --now libvirtd'."
        echo "Manage virtual machines using 'virt-manager'."
        ;;
    16) # DevOps Tools
        echo "You chose DevOps."
        echo "To install Docker and Ansible, use 'sudo apt install -y docker.io ansible'."
        echo "For Kubernetes setup, use Minikube or MicroK8s."
        echo "To install Minikube, use 'curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64' and 'sudo install minikube-linux-amd64 /usr/local/bin/minikube'."
        echo "To install MicroK8s, use 'sudo snap install microk8s --classic' and 'sudo usermod -aG microk8s \$USER'."
        ;;
    17) # Multimedia & Video Editing Tools
        echo "You chose Multimedia & Video Editing."
        echo "To install OBS Studio, Kdenlive, and FFmpeg, use 'sudo apt install -y obs-studio kdenlive ffmpeg'."
        echo "You can now start editing videos or stream using OBS Studio."
        ;;
    18) # Security & Penetration Testing Tools
        echo "You chose Security & Penetration Testing."
        echo "To install Wireshark, Nmap, and Metasploit Framework, use 'sudo apt install -y wireshark nmap' may not work roperly if not installed git or any other ."
        echo "To install Metasploit Framework, use 'curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate | sudo bash'."
        ;;
    19) # Networking Tools
        echo "You chose Networking Tools."
        echo "To install OpenVPN, WireGuard, and Netcat, use 'sudo apt install -y openvpn wireguard netcat'."
        ;;
    20) # Office & Productivity Tools
        echo "You chose Office & Productivity."
        echo "To install LibreOffice, Thunderbird, and Nextcloud, use 'sudo apt install -y libreoffice thunderbird nextcloud-desktop'."
        ;;
    21) # Audio & Music Production Tools
        echo "You chose Audio & Music Production."
        echo "To install Audacity, Ardour, and LMMS, use 'sudo apt install -y audacity ardour lmms'."
        ;;
    22) # Mobile App Development Tools
        echo "You chose Mobile App Development."
        echo "To install Android Studio and Flutter, use 'sudo apt install -y openjdk-11-jdk', 'sudo snap install android-studio --classic', and 'sudo snap install flutter --classic'."
        ;;
    23) # Advanced Gaming Tools
        echo "You chose Advanced Gaming."
        echo "To install Lutris and Wine for Windows game compatibility, use 'sudo apt install -y lutris wine'."
        ;;
        *)
        echo "Invalid option. Please choose a number between 1 and 23."
        ;;
    esac
}
continueshi #This will pull the function, which starts the whole app itself. removing this will cause a crashout
