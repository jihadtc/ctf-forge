#!/bin/bash

check_deps() {
    dependencies=("nmap" "gobuster" "dirsearch" "enum4linux")
    for tool in "${dependencies[@]}"; do
        if ! command -v $tool &> /dev/null; then
            echo -e "\033[0;31m[-] $tool is not installed! Please install it.\033[0m"
        fi
    done
}
