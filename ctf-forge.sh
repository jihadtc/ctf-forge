#!/bin/bash
# ==============================================
# CTF-Forge: Automated Recon & Enumeration Tool
# Developed and customized by Jihad Tichti
# Based on common CTF enumeration techniques
# ==============================================

# Load core functions
source core/config.sh
source core/banner.sh
source core/check_deps.sh
source core/utils.sh

# Ask for target IP
read -p "Enter target IP: " TARGET_IP
create_output "$TARGET_IP"

# Show Banner
banner

# Check Dependencies
check_deps

# Main Menu
main_menu() {
    echo -e "${GREEN}Select an option:${NC}"
    echo "1) Full Recon"
    echo "2) Web Enumeration"
    echo "3) SMB Enumeration"
    echo "4) Privilege Escalation Check"
    echo "5) Flag Finder"
    echo "6) Exit"
    echo -n "Choice: "
    read choice

    case $choice in
        1) full_recon ;;
        2) web_enum ;;
        3) smb_enum ;;
        4) privesc ;;
        5) flag_finder ;;
        6) exit 0 ;;
        *) 
            echo -e "${RED}Invalid choice!${NC}"
            main_menu
            ;;
    esac
}

# Module Functions
full_recon() {
    info "Running full recon..."
    ./modules/recon.sh "$TARGET_IP"
    ./modules/web_enum.sh "$TARGET_IP"
    ./modules/smb_enum.sh "$TARGET_IP"
    main_menu
}

web_enum() {
    info "Running web enumeration..."
    ./modules/web_enum.sh "$TARGET_IP"
    main_menu
}

smb_enum() {
    info "Running SMB enumeration..."
    ./modules/smb_enum.sh "$TARGET_IP"
    main_menu
}

privesc() {
    info "Running privilege escalation check..."
    ./modules/privesc.sh "$TARGET_IP"
    main_menu
}

flag_finder() {
    info "Searching for flags..."
    ./modules/flag_finder.sh "$TARGET_IP"
    main_menu
}

# Start Menu
main_menu
