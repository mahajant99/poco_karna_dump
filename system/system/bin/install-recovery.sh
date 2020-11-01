#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:2cd8768e00f4a9d10c999015417dd0213ba0b4ef; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:134217728:c3fe3113633d536862f6039b13869d2d33f32cb6 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:2cd8768e00f4a9d10c999015417dd0213ba0b4ef && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
