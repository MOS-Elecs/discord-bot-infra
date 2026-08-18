#!/usr/bin/env bash
set -euo pipefail

VMID=9000
IMG_URL="https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
STORAGE="local-lvm"

wget -O /tmp/ubuntu-noble.img "$IMG_URL"

qm create $VMID --name ubuntu-2404-cloudinit-template --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0
qm importdisk $VMID /tmp/ubuntu-noble.img $STORAGE
qm set $VMID --scsihw virtio-scsi-pci --scsi0 $STORAGE:vm-$VMID-disk-0
qm set $VMID --ide2 $STORAGE:cloudinit
qm set $VMID --boot c --bootdisk scsi0
qm set $VMID --serial0 socket --vga serial0
qm template $VMID
