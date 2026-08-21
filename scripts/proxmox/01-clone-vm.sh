#!/usr/bin/env bash
set -euo pipefail

TEMPLATE_ID=9010
NEW_VMID=501
NEW_NAME="discord-bot-host"

qm clone $TEMPLATE_ID $NEW_VMID --name $NEW_NAME --full
qm resize $NEW_VMID scsi0 +18G
qm set $NEW_VMID --memory 2048 --cores 2
qm set $NEW_VMID --ipconfig0 ip=dhcp
qm set $NEW_VMID --sshkeys ~/.ssh/id_ed25519.pub
qm set $NEW_VMID --ciuser ubuntu

qm start $NEW_VMID
