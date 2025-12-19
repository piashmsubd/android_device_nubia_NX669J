# Prebuilt Kernel Files

This directory should contain the prebuilt kernel files for the Nubia RedMagic 6S Pro (NX669J).

## Required Files

1. **kernel** - The prebuilt kernel Image
2. **dtb.img** - The device tree blob image
3. **dtbo.img** - The device tree blob overlay image

## How to Extract

You can extract these files from an existing firmware:

### From Stock Firmware

1. Download the stock firmware for NX669J
2. Extract boot.img and vendor_boot.img
3. Use `unpackbootimg` to extract the files:

```bash
# Extract from boot.img
unpackbootimg -i boot.img -o boot_extracted/

# Extract from vendor_boot.img
unpackbootimg -i vendor_boot.img -o vendor_boot_extracted/
```

### Build from Source

To build from source using the official kernel:

```bash
cd kernel/nubia/sm8350/msm-5.4
export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-
make vendor/lahaina-qgki_defconfig
make -j$(nproc)
```

## Notes

- The kernel version for this device is 5.4.x
- The SoC is Qualcomm SM8350 (codenamed "lahaina")
- A/B partition scheme is used, so recovery is part of boot.img
