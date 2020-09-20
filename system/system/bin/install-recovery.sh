#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:a785fb292313e9bfa7be01298de4b76bd97aeb18; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:134217728:febba62833eeea5520229c6cc4ee00b7b8af16da \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:a785fb292313e9bfa7be01298de4b76bd97aeb18 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
