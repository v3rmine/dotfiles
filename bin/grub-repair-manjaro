#!/bin/bash
EFI_PART="$1"|"/dev/nvme0n1p2"
SYSTEM_PART="$2"|"/dev/sda2"
TARGET_DISK="$3"|"/dev/sda"

cryptsetup open --type luks "$SYSTEM_PART" crypto
mount /mnt /dev/mapper/crypto
mount /mnt/boot/efi $EFI_PART
modprobe efivarfs

echo "mount -t efivarfs efivarfs /sys/firmware/efi/efivarfs;grub-install "$TARGET_DISK" --target=x86_64-efi --bootloader-id=Manjaro --recheck;update-grub;exit" | manjaro-chroot /mnt

reboot
