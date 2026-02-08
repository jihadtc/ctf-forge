#!/bin/bash
# ==============================================
# CTF-Forge - Privilege Escalation Enumeration
# ==============================================

TARGET="$1"

# Check target
if [ -z "$TARGET" ]; then
    echo "Usage: privesc.sh <target-ip>"
    exit 1
fi

OUT_DIR="Output/$TARGET"
OUT_FILE="$OUT_DIR/privesc.txt"

mkdir -p "$OUT_DIR"

echo "[+] Privilege Escalation Enumeration" | tee "$OUT_FILE"
echo "-----------------------------------" >> "$OUT_FILE"

# Current user info
echo "[*] User information" | tee -a "$OUT_FILE"
whoami >> "$OUT_FILE"
id >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

# Sudo permissions
echo "[*] Sudo permissions (sudo -l)" | tee -a "$OUT_FILE"
sudo -l 2>/dev/null >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

# SUID binaries
echo "[*] SUID binaries" | tee -a "$OUT_FILE"
find / -perm -4000 -type f 2>/dev/null >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

# Writable files owned by root
echo "[*] Writable files owned by root" | tee -a "$OUT_FILE"
find / -writable -user root -type f 2>/dev/null >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

# Cron jobs
echo "[*] Cron jobs" | tee -a "$OUT_FILE"
cat /etc/crontab 2>/dev/null >> "$OUT_FILE"
ls -la /etc/cron* 2>/dev/null >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

# Kernel & OS info
echo "[*] System information" | tee -a "$OUT_FILE"
uname -a >> "$OUT_FILE"
cat /etc/os-release 2>/dev/null >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

echo "[+] Privilege escalation enumeration completed." | tee -a "$OUT_FILE"
