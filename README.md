# Build user program
fallocate -l 32M hdd.dsk
mkfs.minix hdd.dsk
cd userspae
export PATH=$PWD:$PATH
which riscv64-unknown-linux-gnu-as
cd /team/LihuaZhao/proj/rtp.rust/osblog/risc_v/userspace
vi Makefile (channge cross toolchain)
cd startlib/
make
cd ..
riscv64-unknown-linux-gnu-g++ -Wall -O0 -ffreestanding -nostartfiles -nostdlib
-static -march=rv64g -mabi=lp64d -I./startlib -L./startlib -o helloworld.elf
helloworld.cpp -lstart
sudo upload.sh helloworld.elf

  File: /mnt/helloworld.elf
  Size: 18920           Blocks: 40         IO Block: 1024   regular file
Device: 708h/1800d      Inode: 2           Links: 1
Access: (0755/-rwxr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2022-12-07 16:42:27.000000000 +0800
Modify: 2022-12-07 16:42:27.000000000 +0800
Change: 2022-12-07 16:42:27.000000000 +0800
 Birth: -

