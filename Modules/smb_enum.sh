#!/bin/bash
# ==============================================
# CTF-Forge - SMB Enumeration Module
# ==============================================

TARGET="$1"

if [[ -z "$TARGET" ]]; then
    echo "Usage: smb_enum.sh <target-ip>"
    exit 1
fi

OUT_DIR="Output/$TARGET/smb"
mkdir -p "$OUT_DIR"

echo "[+] SMB enumeration started on $TARGET"
echo "----------------------------------"

# Check if SMB port is open
if ! nc -z "$TARGET" 445 2>/dev/null; then
    echo "[-] SMB (445) is not open on $TARGET"
    exit 0
fi

echo "[+] SMB service detected on port 445"

# Enum4Linux
echo "[*] Running enum4linux..."
enum4linux "$TARGET" > "$OUT_DIR/enum4linux.txt"

# SMB client anonymous listing
echo "[*] Attempting anonymous SMB share listing..."
smbclient -L "//$TARGET/" -N > "$OUT_DIR/smbclient_list.txt" 2>/dev/null

echo "[+] SMB enumeration completed."
echo "[+] Results saved in $OUT_DIR"
