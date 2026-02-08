#!/bin/bash
# ==============================================
# CTF-Forge - Web Enumeration Module
# ==============================================

TARGET="$1"

if [ -z "$TARGET" ]; then
    echo "Usage: web_enum.sh <target-ip>"
    exit 1
fi

OUT_DIR="Output/$TARGET/web"
NMAP_OUT="$OUT_DIR/nmap_http.txt"
GOBUSTER_OUT="$OUT_DIR/gobuster.txt"
HEADERS_OUT="$OUT_DIR/headers.txt"

# System wordlists (Kali)
WORDLIST_COMMON="/usr/share/wordlists/dirb/common.txt"

mkdir -p "$OUT_DIR"

echo "[+] Web Enumeration started on $TARGET"
echo "----------------------------------"

# Scan common web ports
echo "[*] Scanning web ports..."
nmap -p 80,443,8080,8000,8888 -Pn "$TARGET" -oN "$NMAP_OUT"

# Check if any web service is open
if ! grep -q "open" "$NMAP_OUT"; then
    echo "[-] No web service detected. Skipping web enumeration."
    exit 0
fi

# Enumerate HTTP headers
echo "[*] Fetching HTTP headers..."
for port in 80 443 8080 8000 8888; do
    curl -I --connect-timeout 5 "http://$TARGET:$port" 2>/dev/null \
        | sed "s/^/[Port $port] /" >> "$HEADERS_OUT"
done

# Directory brute-force
echo "[*] Running gobuster..."
gobuster dir \
    -u "http://$TARGET" \
    -w "$WORDLIST_COMMON" \
    -t 50 \
    -q \
    -o "$GOBUSTER_OUT"

echo "[+] Web Enumeration completed."
echo "[+] Results saved in $OUT_DIR/"
