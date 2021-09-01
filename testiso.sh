#!/bin/bash
#first, load the kqemu kernel module
modprobe kqemu
export XLIB_SKIP_ARGB_VISUALS=1
#simple example of qemu usage
# qemu -cdrom livecd.iso

#give more ressources on the host systems (you need to be root for this)
#nice -n 2 qemu -boot d -cdrom lincade.iso -m 192 -localtime lincadehd.img
qemu -boot c -cdrom lincade.iso -m 192 -localtime lincadehd.img

#give more (emulated) memory, here: 512 megs
# qemu -cdrom livecd.iso -m 128

