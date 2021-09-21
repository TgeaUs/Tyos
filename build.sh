#!/bin/sh


echo "Compiling..."
nasm -I include/ -o mbr.bin mbr.asm
nasm -I include/ -o loader.bin loader.asm

echo "Writing mbr and loader to disk..."
dd if=mbr.bin of=hd60M.img bs=512 count=1 conv=notrunc
dd if=loader.bin of=hd60M.img bs=512 count=4 seek=2 conv=notrunc

