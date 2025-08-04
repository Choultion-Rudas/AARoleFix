MODDIR=${0%/*}
SOURCE_APK="$MODDIR/system/product/overlay/GmsCnConfigOverlay.apk"
TARGET_PATH="/system/product/overlay/GmsCnConfigOverlay.apk"
chcon u:object_r:system_file:s0 "$SOURCE_APK"
mount -o bind "$SOURCE_APK" "$TARGET_PATH"