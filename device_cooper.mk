# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#Build everything needed (languages plus the base)
$(call inherit-product, build/target/product/languages_full.mk)
$(call inherit-product, build/target/product/full_base.mk)

# Using our vendor (Superuser, hosts file and APNS)
$(call inherit-product, vendor/mmb/vendor_blobs.mk)
# Including GApps
$(call inherit-product, vendor/google/tiny.mk)

#Build GPS files
$(call inherit-product, device/common/gps/gps_ww_supl.mk)

#Overlay directory
DEVICE_PACKAGE_OVERLAYS := device/samsung/cooper/overlay

#Packages built and used by the ROM
PRODUCT_PACKAGES += \
    librs_jni \
    libOmxCore \    
    libOmxVidEnc \	
    make_ext4fs \
    brcm_patchram_plus \
    sec_touchscreen.kcm \
    copybit.cooper \
    lights.cooper \
    gralloc.cooper \
    gps.cooper \
    setup_fs \
    FM \
    SamsungServiceMode \
    rzscontrol \
    bdaddr_read \
    dump_image \
    e2fsck \
    setup_fs \
    toggleshutter \
    patchlcs \
    erase_image \
    flash_image \
    screencap \
    dexpreopt

#If exist a prebuilt kernel, use it
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/samsung/cooper/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

#Copy kernel
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Frameworks
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

# Init files
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/init.gt-s5830.rc:root/init.gt-s5830.rc \
    device/samsung/cooper/prebuilt/ueventd.gt-s5830.rc:root/ueventd.gt-s5830.rc \
    device/samsung/cooper/prebuilt/COOPER.rle:root/COOPER.rle \
    device/samsung/cooper/prebuilt/lib/modules/fsr.ko:root/lib/modules/fsr.ko \
    device/samsung/cooper/prebuilt/lib/modules/fsr_stl.ko:root/lib/modules/fsr_stl.ko \
    device/samsung/cooper/prebuilt/lib/modules/sec_param.ko:root/lib/modules/sec_param.ko
    device/samsung/cooper/prebuilt/cifs.ko:system/lib/modules/cifs.ko \
    device/samsung/cooper/prebuilt/tun.ko:system/lib/modules/tun.ko \
    device/samsung/cooper/prebuilt/zram.ko:system/lib/modules/zram.ko	

# Executables
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/system/bin/abtfilt:system/bin/abtfilt \
    device/samsung/cooper/prebuilt/system/bin/memsicd:system/bin/memsicd \
    device/samsung/cooper/prebuilt/system/bin/qmuxd:system/bin/qmuxd \
    device/samsung/cooper/prebuilt/system/bin/racoon:system/bin/racoon \
    device/samsung/cooper/prebuilt/system/bin/wmiconfig:system/bin/wmiconfig \
    device/samsung/cooper/prebuilt/system/bin/hostapd:system/bin/hostapd \
    device/samsung/cooper/prebuilt/system/bin/wlan_mac:system/bin/wlan_mac \
    device/samsung/cooper/prebuilt/system/bin/wlan_tool:system/bin/wlan_tool \
    device/samsung/cooper/prebuilt/system/bin/gpsd:system/bin/gpsd \
    device/samsung/cooper/prebuilt/system/bin/rild:system/bin/rild 

# Keyboard
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/system/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/cooper/prebuilt/system/usr/keylayout/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl \
    device/samsung/cooper/prebuilt/system/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/cooper/prebuilt/system/usr/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl

# Wifi
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/system/wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin:system/wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin \
    device/samsung/cooper/prebuilt/system/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77:system/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77 \
    device/samsung/cooper/prebuilt/system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin \
    device/samsung/cooper/prebuilt/system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin.04:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin.04 \
    device/samsung/cooper/prebuilt/system/wifi/ath6k/AR6003/hw2.0/data.patch.bin:system/wifi/ath6k/AR6003/hw2.0/data.patch.bin \
    device/samsung/cooper/prebuilt/system/wifi/ath6k/AR6003/hw2.0/otp.bin.z77:system/wifi/ath6k/AR6003/hw2.0/otp.bin.z77 \
    device/samsung/cooper/prebuilt/system/wifi/ar6000.ko:system/wifi/ar6000.ko \
    device/samsung/cooper/prebuilt/system/etc/firmware/BCM2049C0_003.001.031.0088.0094.hcd:system/etc/firmware/BCM2049C0_003.001.031.0088.0094.hcd \
    device/samsung/cooper/prebuilt/system/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    device/samsung/cooper/prebuilt/system/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/samsung/cooper/prebuilt/system/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/cooper/prebuilt/system/etc/wifi/hostapd.conf:system/etc/wifi/hostapd.conf \
    device/samsung/cooper/prebuilt/system/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/samsung/cooper/prebuilt/system/etc/vold.fstab:system/etc/vold.fstab 

# Audio/GPS/Lights/egl/modules/RIL
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/system/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/samsung/cooper/prebuilt/system/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/samsung/cooper/prebuilt/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/samsung/cooper/prebuilt/system/lib/hw/gps.cooper.so:system/lib/hw/gps.cooper.so \
    device/samsung/cooper/prebuilt/system/lib/hw/lights.cooper.so:system/lib/hw/lights.cooper.so \
    device/samsung/cooper/prebuilt/system/lib/hw/sensors.default.so:system/lib/hw/sensors.default.so \
    device/samsung/cooper/prebuilt/system/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    device/samsung/cooper/prebuilt/system/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    device/samsung/cooper/prebuilt/system/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    device/samsung/cooper/prebuilt/system/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    device/samsung/cooper/prebuilt/system/lib/modules/ramzswap.ko:system/lib/modules/ramzswap.ko \
    device/samsung/cooper/prebuilt/system/lib/modules/tun.ko:system/lib/modules/tun.ko \
    device/samsung/cooper/prebuilt/system/lib/libgsl.so:system/lib/libgsl.so \
    device/samsung/cooper/prebuilt/system/lib/libril.so:system/lib/libril.so \
    device/samsung/cooper/prebuilt/system/lib/libsec-ril.so:system/lib/libsec-ril.so \
    device/samsung/cooper/prebuilt/system/lib/libsecril-client.so:system/lib/libsecril-client.so 

# Camera/Video    
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/system/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    device/samsung/cooper/prebuilt/system/lib/libmmipl.so:system/lib/libmmipl.so \
    device/samsung/cooper/prebuilt/system/lib/libmmjpeg.so:system/lib/libmmjpeg.so \
    device/samsung/cooper/prebuilt/system/lib/liboemcamera.so:system/lib/liboemcamera.so \
    device/samsung/cooper/prebuilt/system/lib/libcamera.so:system/lib/libcamera.so \
    device/samsung/cooper/prebuilt/system/lib/libcameraservice.so:system/lib/libcameraservice.so \
    device/samsung/cooper/prebuilt/system/lib/libseccameraadaptor.so:system/lib/libseccameraadaptor.so \
    device/samsung/cooper/prebuilt/system/lib/libcamera_client.so:system/lib/libcamera_client.so \
    device/samsung/cooper/prebuilt/system/lib/libarccamera.so:system/lib/libarccamera.so \
    device/samsung/cooper/prebuilt/system/lib/libCaMotion.so:system/lib/libCaMotion.so \
    device/samsung/cooper/prebuilt/system/lib/libcaps.so:system/lib/libcaps.so \
    device/samsung/cooper/prebuilt/system/lib/libdiag.so:system/lib/libdiag.so \
    device/samsung/cooper/prebuilt/system/lib/libPanoraMax1.so:system/lib/libPanoraMax1.so \
    device/samsung/cooper/prebuilt/system/lib/libActionShot.so:system/lib/libActionShot.so \
    device/samsung/cooper/prebuilt/system/lib/libPlusMe.so:system/lib/libPlusMe.so \
    device/samsung/cooper/prebuilt/system/lib/libs3cjpeg.so:system/lib/libs3cjpeg.so \
    device/samsung/cooper/prebuilt/system/lib/libs3cjpeg.so:system/lib/libs3cjpeg.so \
    device/samsung/cooper/prebuilt/system/lib/libacc.so:system/lib/libacc.so \
    device/samsung/cooper/prebuilt/system/lib/libaccelcal.so:system/lib/libaccelcal.so \
    device/samsung/cooper/prebuilt/system/lib/libaccsensorcal.so:system/lib/libaccsensorcal.so \
    device/samsung/cooper/prebuilt/system/lib/libaccsensorcaltest.so:system/lib/libaccsensorcaltest.so 

# OMX
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/system/lib/libOmxCore.so:system/lib/libOmxCore.so \
    device/samsung/cooper/prebuilt/system/lib/libmm-omxcore.so:system/lib/libmm-omxcore.so \
    device/samsung/cooper/prebuilt/system/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
    device/samsung/cooper/prebuilt/system/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    device/samsung/cooper/prebuilt/system/lib/libOmxWmvDec.so:system/lib/libOmxWmvDec.so \
    device/samsung/cooper/prebuilt/system/lib/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so \
    device/samsung/cooper/prebuilt/system/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
    device/samsung/cooper/prebuilt/system/lib/libOmxAdpcmDec.so:system/lib/libOmxAdpcmDec.so \
    device/samsung/cooper/prebuilt/system/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
    device/samsung/cooper/prebuilt/system/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    device/samsung/cooper/prebuilt/system/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
    device/samsung/cooper/prebuilt/system/lib/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \
    device/samsung/cooper/prebuilt/system/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    device/samsung/cooper/prebuilt/system/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
    device/samsung/cooper/prebuilt/system/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
    device/samsung/cooper/prebuilt/system/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    device/samsung/cooper/prebuilt/system/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    device/samsung/cooper/prebuilt/system/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
    device/samsung/cooper/prebuilt/system/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
    device/samsung/cooper/prebuilt/system/lib/libomx_aacdec_sharedlibrary.so:system/lib/libomx_aacdec_sharedlibrary.so \
    device/samsung/cooper/prebuilt/system/lib/libomx_amrdec_sharedlibrary.so:system/lib/libomx_amrdec_sharedlibrary.so \
    device/samsung/cooper/prebuilt/system/lib/libomx_amrenc_sharedlibrary.so:system/lib/libomx_amrenc_sharedlibrary.so \
    device/samsung/cooper/prebuilt/system/lib/libomx_avcdec_sharedlibrary.so:system/lib/libomx_avcdec_sharedlibrary.so \
    device/samsung/cooper/prebuilt/system/lib/libomx_m4vdec_sharedlibrary.so:system/lib/libomx_m4vdec_sharedlibrary.so \
    device/samsung/cooper/prebuilt/system/lib/libomx_mp3dec_sharedlibrary.so:system/lib/libomx_mp3dec_sharedlibrary.so \
    device/samsung/cooper/prebuilt/system/lib/libomx_sharedlibrary.so:system/lib/libomx_sharedlibrary.so

#Lights lib
PRODUCT_COPY_FILES += \
    device/samsung/cooper/files/lights.cooper.so:system/lib/hw/lights.cooper.so
	
# Some configs	(Time-GPRS-SIM-JPEG)
PRODUCT_PROPERTY_OVERRIDES := \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.media.dec.jpeg.memcap=10000000

# Interfaces + RIL
PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=pdp0,wlan0,gprs,ppp0 \
    ro.telephony.ril_class=samsung \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=60 \
    ro.com.android.dataroaming=false

# Screen configs
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160 \
    qemu.sf.lcd_density=160

# Camera fix
PRODUCT_PROPERTY_OVERRIDES += \
    ro.device.screenrotation=270

# Location settings + Performance (check in CMSettings)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.heapsize=48m \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.dexopt-data-only=1 \
    ro.opengles.version=131072 \
    ro.compcache.default=0

# Audio attenuation
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.fm-attn=0 \
    persist.sys.headset-attn=0 \
    persist.sys.speaker-attn=0

# Product infos
PRODUCT_NAME := cooper
PRODUCT_DEVICE := cooper
PRODUCT_MODEL := GT-S5830
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
