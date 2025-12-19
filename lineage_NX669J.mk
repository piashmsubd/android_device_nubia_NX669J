#
# Copyright (C) 2021-2024 The LineageOS Project
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
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Inherit common halium configuration
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/halium.mk)

# Inherit some LineageOS stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_NX669J
PRODUCT_DEVICE := NX669J
PRODUCT_BRAND := nubia
PRODUCT_MODEL := RedMagic 6S Pro
PRODUCT_MANUFACTURER := nubia

PRODUCT_GMS_CLIENTID_BASE := android-nubia

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="NX669J-user 12 SKQ1.211006.001 eng.nubia.20220408.154424 release-keys"

BUILD_FINGERPRINT := nubia/NX669J/NX669J:12/SKQ1.211006.001/eng.nubia.20220408.154424:user/release-keys
