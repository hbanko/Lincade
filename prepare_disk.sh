#!/bin/bash
size=`sfdisk -s /dev/hda 2> /dev/null`
echo $size
let "size=$size/1024"
echo Festplatte: $size MB
mem=`cat /proc/meminfo|grep MemTotal|tr -d [:alpha:][:blank:]:`
let "mem=$mem/1024"
echo Arbeitsspeicher: $mem MB
echo ,10,83,* >table.txt
let "root=$size-10-2*$mem"
let "swap=$mem*2"
echo ,$swap,82 >>table.txt
echo ,,83 >>table.txt
echo ; >>table.txt
echo EOF>>table.txt

# Doppelte Menge Speicher für SWAP
#cat /proc/meminfo
# Partitionen erzeugen
# sfdisk -uM %s < partitiontable
#mke2fs /dev/hda1
#mkswap /dev/hda2
#mkreiserfs /dev/hda3
#mount /dev/hda3 /mnt/gentoo
#mkdir /mnt/gentoo/boot
#mount /dev/hda1 /mnt/gentoo/boot
#tar /mnt/livecd/lincade.tar.bz2 -C /mnt/gentoo
#chroot /mnt/gentoo /bin/grubbatch
