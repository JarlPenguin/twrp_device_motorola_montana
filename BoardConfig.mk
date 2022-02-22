#
# Copyright (C) 2015-2016 The Android Open-Source Project
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

DEVICE_PATH := device/motorola/montana

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8937
TARGET_NO_BOOTLOADER := true

# Crypto
TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/commonsys/cryptfs_hw
TARGET_HW_DISK_ENCRYPTION := true
TARGET_USES_METADATA_AS_FDE_KEY := true
TW_INCLUDE_CRYPTO := true

# Platform
TARGET_BOARD_PLATFORM := msm8937

# Kernel
BOARD_CUSTOM_BUILD_MAKEFILE := $(DEVICE_PATH)/dt_image.mk
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_PREBUILT_DT := true
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100
LZMA_RAMDISK_TARGETS := recovery
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/Image.gz
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/dt.img

ifeq ($(strip $(TARGET_PREBUILT_KERNEL)),)
TARGET_KERNEL_CONFIG := montana_defconfig
TARGET_KERNEL_SOURCE := kernel/motorola/msm8953
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CLANG_VERSION := 6.0.2
TARGET_CUSTOM_DTBTOOL := dtbTool_custom
BOARD_DTBTOOL_ARGS += --force-v3 --motorola 1
endif

# Logging
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16879616    #    16484 * 1024 mmcblk0p38
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Recovery
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true

# TWRP
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_ENCRYPTED_BACKUPS := true
TW_EXCLUDE_NANO := true
TW_HAS_EDL_MODE := true
TW_INCLUDE_FB2PNG := true
TW_INCLUDE_NTFS_3G := true
TW_NEW_ION_HEAP := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_SUPPORT_INPUT_1_2_HAPTICS := true
TW_THEME := portrait_hdpi
