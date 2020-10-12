#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:c66c4d2941eb764fde22559be43a8df009c0b5f1; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:134217728:b2172ab4c68f70c525966c43b3d7df03cbabda8a \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:c66c4d2941eb764fde22559be43a8df009c0b5f1 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
