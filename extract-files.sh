#!/bin/bash
#
# Copyright (C) 2018-2019 The LineageOS Project
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

function blob_fixup() {
    case "${1}" in

        # Load ZAF configs from vendor
        vendor/lib/libzaf_core.so)
            sed -i "s|/system/etc/zaf|/vendor/etc/zaf|g" "${2}"
            ;;

        # Add uhid group for fingerprint service
        vendor/etc/init/android.hardware.biometrics.fingerprint@2.1-service.rc)
            sed -i "s/input/uhid input/" "${2}"
            ;;

        # Correct mods gid
        etc/permissions/com.motorola.mod.xml)
            sed -i "s|mot_mod|oem_5020|g" "${2}"
            ;;

        # Replace libcutils with libprocessgroup
        vendor/lib/hw/audio.primary.sdm660.so)
            patchelf --replace-needed "libcutils.so" "libprocessgroup.so" "${2}"
            ;;

    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
else
    MY_DIR="${BASH_SOURCE%/*}"
    if [ ! -d "${MY_DIR}" ]; then
        MY_DIR="${PWD}"
    fi
fi

set -e

# Required!
export DEVICE=beckham
export DEVICE_COMMON=sdm660-common
export VENDOR=motorola

export DEVICE_BRINGUP_YEAR=2018

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"

