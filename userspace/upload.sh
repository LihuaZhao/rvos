#!/bin/sh

if [ $# -ne 1 ]; then
	echo "You provied $# parameters, need 1"
	exit 1
fi

if [ ! -r $1 ]; then
	echo "Unknown file $1"
	exit 2
fi


losetup /dev/loop8 ../hdd.dsk
mount /dev/loop8 /mnt
cp $1 /mnt
stat /mnt/helloworld.elf
umount /dev/loop8
losetup -d /dev/loop8
