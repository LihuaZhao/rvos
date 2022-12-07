#!/bin/sh

if [ $# -ne 1 ]; then
	echo "You provied $# parameters, need 1"
	exit 1
fi

if [ ! -r $1 ]; then
	echo "Unknown file $1"
	exit 2
fi

rm -f ../hdd.dsk
fallocate -l 32M ../hdd.dsk
chmod 777 ../hdd.dsk
sudo losetup /dev/loop8 ../hdd.dsk
sudo mkfs.minix -3 /dev/loop8
sudo mount /dev/loop8 /mnt
sudo cp $1 /mnt
stat /mnt/helloworld.elf
sudo umount /dev/loop8
sudo losetup -d /dev/loop8
