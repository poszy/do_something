#!/bin/env zsh

# Setup a raspberrypi 4b emulator with qemu
sudo pacman -S qemu-full # Base software for emulation

# aarch64-linux-gnu-as -o add_numbers.o add_numbers.s
# aarch64-linux-gnu-ld -o add_numbers add_numbers.o
sudo pacman -S aarch64-linux-gnu-binutils # needed to compile arm64, 

# qemu-aarch64 ./add_numbers
sudo pacman -S qemu-user # needed to run as user

