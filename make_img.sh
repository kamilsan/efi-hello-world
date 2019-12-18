#!/bin/sh

dd if=/dev/zero of=boot.img bs=512 count=93750
sudo parted boot.img -s -a minimal mklabel gpt
sudo parted boot.img -s -a minimal mkpart EFI FAT16 2048s 93716s
sudo parted boot.img -s -a minimal toggle 1 boot
dd if=/dev/zero of=tmp.img bs=512 count=91669
mformat -i tmp.img -h 32 -t 32 -n 64 -c 1
mcopy -i tmp.img main.efi ::
dd if=tmp.img of=boot.img bs=512 count=91669 seek=2048 conv=notrunc