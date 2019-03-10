#
# vendor props for beckham
#

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.audio.calfile0=/vendor/etc/acdbdata/Bluetooth_cal.acdb \
    persist.vendor.audio.calfile1=/vendor/etc/acdbdata/General_cal.acdb \
    persist.vendor.audio.calfile2=/vendor/etc/acdbdata/Global_cal.acdb \
    persist.vendor.audio.calfile3=/vendor/etc/acdbdata/Handset_cal.acdb \
    persist.vendor.audio.calfile4=/vendor/etc/acdbdata/Hdmi_cal.acdb \
    persist.vendor.audio.calfile5=/vendor/etc/acdbdata/Headset_cal.acdb \
    persist.vendor.audio.calfile6=/vendor/etc/acdbdata/Speaker_cal.acdb

# Mods
PRODUCT_PROPERTY_OVERRIDES += \
    sys.mod.platformsdkversion=205

# Sensors
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.sensors=beckham \
    ro.vendor.sensors.maghalcal=false \
    ro.vendor.sensors.pmd=false \
    ro.vendor.sensors.amd=false \
    ro.vendor.sensors.rmd=false \
    ro.vendor.sensors.scrn_ortn=false \
    ro.vendor.sensors.pedometer=false \
    ro.vendor.sensors.mot_ltv=true \
    ro.vendor.sensors.facing=false \
    ro.vendor.sensors.cmc=false \
    ro.vendor.sensors.dev_ori=true \
    ro.vendor.sensors.sta_detect=true \
    ro.vendor.sensors.mot_detect=true \
    ro.vendor.sdk.sensors.gestures=false

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=420
