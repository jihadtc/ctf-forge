#!/bin/bash
# ==============================================
# CTF-Forge - Global Configuration
# ==============================================

# -------- Colors --------
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
NC="\e[0m"   # No Color

# -------- Directories --------
BASE_DIR="$(pwd)"
CORE_DIR="$BASE_DIR/Core"
MODULES_DIR="$BASE_DIR/Modules"
OUTPUT_DIR="$BASE_DIR/Output"

# -------- Wordlists (System Paths) --------
WORDLIST_COMMON="/usr/share/wordlists/dirb/common.txt"
WORDLIST_DIRBUSTER="/usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt"
WORDLIST_ROCKYOU="/usr/share/wordlists/rockyou.txt"

# -------- Nmap --------
NMAP_FAST="-p- --min-rate 10000 -Pn"
NMAP_DEFAULT="-sC -sV -Pn"

# -------- Tool Settings --------
TIMEOUT=5
THREADS=50

# -------- Banner Settings --------
TOOL_NAME="CTF-Forge"
VERSION="1.0"
AUTHOR="Jihad Tichti"
