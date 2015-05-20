#
# Copyright (C) 2015 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/lenovo/a6000

-include vendor/lenovo/a6000/BoardConfigVendor.mk

TARGET_BOARD_PLATFORM := msm8916
TARGET_BOARD_PLATFORM_GPU := qcom-adreno306

USE_CAMERA_STUB := false
BOARD_USES_GENERIC_AUDIO := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8916
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_NO_KERNEL := false

# Architecture
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
TARGET_HAVE_HDMI_OUT := false

#Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

#Kernel
BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/mkbootimg.mk
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x3F ehci-hcd.park=3 vmalloc=400M androidboot.bootdevice=soc.0 utags.blkdev=/dev/block/platform/soc.0/by-name/utags utags.backup=/dev/block/platform/soc.0/by-name/utagsBackup movablecore=160M androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
TARGET_KERNEL_SOURCE := kernel/lenovo/a6000
TARGET_KERNEL_CONFIG := msm8916_defconfig

BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100

# Audio
BOARD_USES_ALSA_AUDIO := true
TARGET_QCOM_AUDIO_VARIANT := caf

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Bluetooth

#camera

# Crypto
#TARGET_HW_DISK_ENCRYPTION := true

# Display
BOARD_EGL_CFG := $(LOCAL_PATH)/egl.cfg
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_HAVE_NEW_GRALLOC := true
TARGET_QCOM_DISPLAY_VARIANT := caf-new
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true
TARGET_CONTINUOUS_SPLASH_ENABLED := true

OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# Enable suspend during charger mode
BOARD_CHARGER_ENABLE_SUSPEND := true

# Add NON-HLOS files for ota upgrade
ADD_RADIO_FILES ?= true

# FM
TARGET_QCOM_NO_FM_FIRMWARE := false

# GPS

# Insecure boot
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0

# Lights

# Liblight
TARGET_PROVIDES_LIBLIGHT := true

# Media
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
TARGET_QCOM_MEDIA_VARIANT := caf-new

# Partitions
BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/mkbootimg.mk
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 838860800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2631680000
BOARD_CACHEIMAGE_PARTITION_SIZE := 134217728
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# Qualcomm support
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP
BOARD_USES_QCOM_HARDWARE := true
TARGET_NO_RPC := true
TARGET_USES_QCOM_BSP := true

# Power
TARGET_POWERHAL_VARIANT := qcom

# RIL

# SELinux
#BOARD_SEPOLICY_DIRS += \
#    device/lenovo/a6000/sepolicy

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# QC PROPRIETARY
ifneq ($(QCPATH),)
BOARD_USES_QCNE := true
endif

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"
TARGET_USES_WCNSS_CTRL := true
