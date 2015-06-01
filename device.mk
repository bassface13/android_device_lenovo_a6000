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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# call the proprietary setup
$(call inherit-product, vendor/lenovo/a6000/a6000-vendor.mk)

# call the gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.environ.rc:root/init.environ.rc \
    $(LOCAL_PATH)/init.qti.carrier.rc:root/init.qti.carrier.rc \
    $(LOCAL_PATH)/init.qcom.usb.rc:root/init.qcom.usb.rc \
    $(LOCAL_PATH)/init.qcom.rc:root/init.qcom.rc \
    $(LOCAL_PATH)/init.recovery.qcom.rc:root/init.recovery.qcom.rc \
    $(LOCAL_PATH)/init.target.rc:root/init.target.rc

$(call inherit-product, frameworks/native/build/phone-hdpi-2048-dalvik-heap.mk)
