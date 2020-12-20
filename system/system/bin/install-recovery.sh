#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:b437e37b3dd15229060e6c3488f15d2483dd26f2; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:134217728:92e9b25b8d4ca75facebdc083175ce4b33846a33 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:b437e37b3dd15229060e6c3488f15d2483dd26f2 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
