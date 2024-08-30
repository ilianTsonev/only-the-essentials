#!/bin/bash
echo "Hello $(id -un), What would you like to use Your Debian distro for?"

# List of Linux distributions
distros=(
    "Ångström distribution"
    "AntiX"
    "Armbian"
    "Astra Linux"
    "AV Linux"
    "BackBox"
    "Bharat Operating System Solutions"
    "BlankOn Linux"
    "Canaima"
    "Commodore OS"
    "Corel Linux"
    "CrunchBang Linux"
    "Damn Small Linux"
    "Debian Pure Blend"
    "Debian-Med"
    "Deepin"
    "Devuan"
    "DoudouLinux"
    "Dreamlinux"
    "Dyson"
    "Elementary OS"
    "Emdebian Grip"
    "Emmabuntüs"
    "Finnix"
    "FreedomBox"
    "GLinux"
    "GNewSense"
    "Google Cloud Shell"
    "Grml"
    "Guadalinex"
    "HandyLinux"
    "Huayra GNU/Linux"
    "Kaisen Linux"
    "Kali Linux"
    "Kali NetHunter"
    "Kanotix"
    "Knoppix"
    "Libranet"
    "LiMux"
    "Linspire"
    "Linux Mint Debian Edition"
    "The Linux Schools Project"
    "Maemo"
    "MEPIS"
    "Musix GNU+Linux"
    "MX Linux"
    "OpenZaurus"
    "Pardus"
    "Parrot OS"
    "Parsix"
    "Proxmox Virtual Environment"
    "Puavo"
    "PureOS"
    "Q4OS"
    "Raspberry Pi OS"
    "Slax"
    "SolydXK"
    "SONiC"
    "SparkyLinux"
    "SteamOS"
    "Subgraph"
    "Sunwah Linux"
    "Tails"
    "TurnKey Linux Virtual Appliance Library"
    "Ubuntu Core"
    "Univention Corporate Server"
    "Uruk GNU/Linux"
    "UserLinux"
    "USU"
    "Vyatta"
    "VyOS"
    "Webconverger"
    "Wienux"
    "Xandros Linux"
)

# Define color variables
RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Use the colors
echo -e "${RED}This text is red!${NC}"
echo -e "${BLUE}This text is blue!${NC}"

# Define the function
continueshi() {
    echo "This snap will need root privileges"
    echo "The red means only for Debian OS, Blue for every Linux Distro"
    echo -e "What would you use your OS for?\n${RED}1. Development/Programming\n${BLUE}2. Photo Editing\n${RED}3. Gaming\n${BLUE}4. 3D Modeling\n${NC}5. ${GREEN}Feedback?"
    read -p "Please enter your choice (1-5): " choose

    case "$choose" in
        1)
            echo "You chose Development/Programming."
            echo "You should manually install code using 'snap install code --classic'"
            echo "You should manually install vim (form CLI Programming), git (for github usage like downloading source code), docker using 'apt install selected-packs'"
            ;;
        2)
            echo "You chose Photo Editing."
            echo "Opening Photopea in Firefox..."
            firefox https://www.photopea.com &
            echo "You should manually install GIMP using 'snap install gimp'"
            ;;
        3)
            echo "You chose Gaming."
            echo "You should manually install Steam, Proton, Lutris, and Wine using 'apt install steam proton lutris wine'"
            echo "you can search for some cool KDE and GNOME games which are very cool" # the ^ shall make the text little. as if ** would make the text bold
            ;;
        4)
            echo "You chose 3D Modeling."
            echo "To download Blender, you can go to their website and install the AppImage"
            echo "You should manually install FreeCAD using 'snap install freecad'"
            ;;
        5)
            echo "You chose Feedback."
            echo "For feedback, you can check out the command 'snap info only-the-essentials' and open the website!"
            echo "For more fast feedback, my discord account is .memelian4 with the dot"
            ;;
        *)
            echo "Invalid choice. Please select a number between 1 and 5."
            ;;
    esac
}

# Check the Linux distribution
if [ -f /etc/os-release ]; then
    . /etc/os-release
    distro=$NAME
    echo "Detected distro: $distro"  # Print the detected distribution for debugging
else
    distro=$(uname -s)
    echo "Detected OS: $distro"  # Print the detected OS for debugging
fi

# Check if the distro is in the list
distro_found=0
for d in "${distros[@]}"; do
    if [[ "$distro" == *"$d"* ]]; then
        distro_found=1
        break
    fi
done

if [ $distro_found -eq 1 ]; then
    continueshi
else
    echo "Your distro is not fully supported, but you can still use it partially."
    continueshi
fi
