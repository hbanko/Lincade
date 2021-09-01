#!/bin/bash
echo "++ Deleting old Files"
rm image/image.squashfs
rm lincade.iso
echo "++ Building sqaushfs"
mksquashfs source/ image/image.squashfs
echo "++ Creating bootable ISO Image"
mkisofs -R -b /boot/grub/stage2_eltorito -no-emul-boot -boot-load-size 4 -boot-info-table -iso-level 4 -hide boot.catalog -o lincade.iso lincade.img
mkisofs -R -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o lincade.iso image/ 
echo "++ End of script"	
