#!/bin/bash

(cd rootfs && find . | cpio --quiet -o -H newc > ../rootfs.cpio)

# Compress the image with lz4
echo "Compressing lz4"
~/Projects/other/buildroot/target-beagleboneblack/host/bin/lz4 -9 -c rootfs.cpio > rootfs.cpio.lz4

# Create uboot image
~/Projects/other/buildroot/target-beagleboneblack/host/bin/mkimage -A arm -T ramdisk -C none -d rootfs.cpio.lz4 rootfs.cpio.uboot.bak

# Cleanup
rm rootfs.cpio
rm rootfs.cpio.lz4
