$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/galaxys2plus-common/galaxys2plus-common-vendor.mk)

# Use high-density artwork where available
PRODUCT_LOCALES += hdpi

DEVICE_PACKAGE_OVERLAYS += device/samsung/s2ve/overlay

# Init files
PRODUCT_COPY_FILES += \
	device/samsung/s2ve/ramdisk/init.capri_ss_s2ve.rc:root/init.capri_ss_s2vep.rc \
	device/samsung/s2ve/ramdisk/init.bcm281x5.usb.rc:root/init.bcm281x5.usb.rc \
	device/samsung/s2ve/ramdisk/init.log.rc:root/init.log.rc \
	device/samsung/s2ve/ramdisk/init.recovery.capri_ss_s2ve.rc:root/init.recovery.capri_ss_s2vep.rc \
	device/samsung/s2ve/ramdisk/lpm.rc:root/lpm.rc \
	device/samsung/s2ve/ramdisk/ueventd.capri_ss_s2ve.rc:root/ueventd.capri_ss_s2vep.rc \
	device/samsung/s2ve/ramdisk/fstab.capri_ss_s2ve:root/fstab.capri_ss_s2vep 

PRODUCT_COPY_FILES += \
	device/samsung/s2ve/media_codecs.xml:system/etc/media_codecs.xml \

# Prebuilt kl keymaps
PRODUCT_COPY_FILES += \
	device/samsung/s2ve/keylayouts/bcm_headset.kl:system/usr/keylayout/bcm_headset.kl \
	device/samsung/s2ve/keylayouts/bcm_keypad_v2.kl:system/usr/keylayout/bcm_keypad_v2.kl \
	device/samsung/s2ve/keylayouts/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
	device/samsung/s2ve/keylayouts/samsung-keypad.kl:system/usr/keylayout/samsung-keypad.kl \
	device/samsung/s2vep/keylayouts/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
	device/samsung/s2ve/keylayouts/sii9234_rcp.kl:system/usr/keylayout/sii9234_rcp.kl

# Filesystem management tools
PRODUCT_PACKAGES += \
	setup_fs

# F2FS
PRODUCT_PACKAGES += \
	mkfs.f2fs \
	fsck.f2fs \
	fibmap.f2fs

# Filesystem management tools
PRODUCT_PACKAGES += \
	setup_fs \
	e2fsck

# Usb accessory
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# Misc other modules
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default \
	audio_policy_s2ve.capri

# Device-specific packages
PRODUCT_PACKAGES += \
	SamsungServiceMode \
	Torch \

# Charger
PRODUCT_PACKAGES += \
	charger \
	charger_res_images

# Device Settings
PRODUCT_PACKAGES += \
	BCMSettings

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Support for Browser's saved page feature. This allows
# for pages saved on previous versions of the OS to be
# viewed on the current OS.
PRODUCT_PACKAGES += \
    libskia_legacy

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    mobiledata.interfaces=rmnet0 \
    ro.telephony.ril_class=SamsungBCMRIL \
    ro.zygote.disable_gl_preload=true \

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

# MTP
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Dalvik heap config
include frameworks/native/build/phone-hdpi-512-dalvik-heap.mk

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)



PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_s2ve
PRODUCT_DEVICE := s2ve
