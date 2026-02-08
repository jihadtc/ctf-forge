#!/bin/bash

GREEN="\033[0;32m"
YELLOW="\033[1;33m"
NC="\033[0m"

# Print a message in green
info() {
    echo -e "${GREEN}[+] $1${NC}"
}

# Print a warning in yellow
warn() {
    echo -e "${YELLOW}[!] $1${NC}"
}

# Create output folders
create_output() {
    TARGET_IP=$1
    mkdir -p output/$TARGET_IP/{nmap,web,smb,privesc,flags}
}
