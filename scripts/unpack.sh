#!/bin/bash
# Strip uboot header from the uImage
echo "Strip uboot header"
dd if=rootfs.cpio.uboot of=rootfs.cpio.lz4 bs=64 skip=1

# Decompress the lz4 image
echo "Decompressing lz4"
~/Projects/other/buildroot/target-beagleboneblack/host/bin/lz4 -d rootfs.cpio.lz4 rootfs.cpio

mkdir -p rootfs

echo "Extracting rootfs"
(cd rootfs && cpio -idv -H newc < ../rootfs.cpio)

# Cleanup
rm rootfs.cpio.lz4
rm rootfs.cpio
