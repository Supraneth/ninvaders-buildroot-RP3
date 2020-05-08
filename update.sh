
#!/bin/sh

if [ "$1" = "-m" ]
then
  make
fi


##
# Write the git commit version on /etc/build_id
##

printf "[o-o-o-o-o-o-o] Writing the current git version...\n"
cd /home/linuxembedded/buildrootGIT/buildroot && git show | grep commit > /home/linuxembedded/ProjetLinuxEmbedded/buildroot-2019.08.1/board/raspberrypi3/rootfs_overlay/etc/build_id


#!/bin/sh
##
# Update script
##


printf "[o-o-o-o-o-o-o] Updating...\n"
printf "[x] Copy zImage file and RPI firmware...\n"
scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null /home/linuxembedded/ProjetLinuxEmbedded/buildroot-2019.08.1/output/images/zImage root@192.168.0.3:/tmp/
rsync -r -a -v -e ssh --delete /home/linuxembedded/ProjetLinuxEmbedded/buildroot-2019.08.1/output/images/rpi-firmware root@192.168.0.3:/tmp/rpi
printf "[x] Copy OK.\n"
printf "[x] Mount SD card and cp zImage on FS and RPI Firmware.\n"
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@192.168.0.3 "mount /dev/mmcblk0p1 /mnt && cp /tmp/zImage /mnt && cp -r /tmp/rpi/rpi-firmware/* /mnt && umount /mnt && /sbin/reboot"
printf "[x] Success.\n"
printf "[o-o-o-o-o-o-o] Updated ! Reboot now...\n"