#!/bin/sh

qemu-system-x86_64 -cpu qemu64 -bios OVMF.fd -drive file=boot.img,if=ide,format=raw -net none