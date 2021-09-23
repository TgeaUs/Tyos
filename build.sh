#!/bin/sh


echo "Compiling..."
nasm -I include/ -o mbr.bin mbr.asm
nasm -I include/ -o loader.bin loader.asm

echo "Writing mbr and loader to disk..."
dd if=mbr.bin of=hd60M.img bs=512 count=1 conv=notrunc
dd if=loader.bin of=hd60M.img bs=512 count=4 seek=2 conv=notrunc


echo "编译内核..."
nasm -f elf -o lib/print.o lib/print.asm
gcc -m32 -I ./lib/ -c -o lib/main.o lib/main.c
ld -m elf_i386 -Ttext 0xc0001500 -e main -o kernel.bin lib/main.o lib/print.o


dd if=kernel.bin of=hd60M.img bs=512 count=200 seek=9 conv=notrunc