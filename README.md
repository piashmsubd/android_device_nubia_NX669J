# Android Device Tree for Nubia RedMagic 6S Pro (NX669J)

## Device Specifications

| Feature | Specification |
| -------:|:------------- |
| Chipset | Qualcomm SM8350 Snapdragon 888+ (5nm) |
| CPU | Octa-core (1x2.995 GHz Cortex-X1 & 3x2.42 GHz Cortex-A78 & 4x1.80 GHz Cortex-A55) |
| GPU | Adreno 660 |
| Memory | 8GB / 12GB / 16GB |
| Storage | 128GB / 256GB UFS 3.1 |
| Display | 6.8 inch AMOLED, 165Hz |
| Battery | 5050 mAh, 120W fast charging |
| Camera | 64MP + 8MP + 2MP |
| Released | September 2021 |

## Build Instructions

### Prerequisites

1. A Linux-based operating system (Ubuntu 20.04+ recommended)
2. At least 200GB of free disk space
3. 16GB+ RAM recommended
4. Fast internet connection

### Building for LineageOS

```bash
# Initialize repo
repo init -u https://github.com/LineageOS/android.git -b lineage-19.1

# Setup local manifest
mkdir -p .repo/local_manifests
cat > .repo/local_manifests/nubia_nx669j.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
    <project name="piashmsubd/android_device_nubia_NX669J" path="device/nubia/NX669J" remote="github" revision="lineage-19.1" />
    <project name="ztemt/NX669J-kernel" path="kernel/nubia/sm8350" remote="github" revision="main" />
</manifest>
EOF

# Sync sources
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

# Build
source build/envsetup.sh
breakfast NX669J
brunch NX669J
```

### Building Halium Boot

For Ubuntu Touch/Halium, use the GitHub Actions workflow or build manually:

```bash
# Initialize repo
repo init -u https://github.com/halium/android.git -b halium-11

# Setup local manifest
mkdir -p .repo/local_manifests
cat > .repo/local_manifests/nubia_nx669j.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
    <project name="piashmsubd/android_device_nubia_NX669J" path="device/nubia/NX669J" remote="github" revision="lineage-19.1" />
    <project name="ztemt/NX669J-kernel" path="kernel/nubia/sm8350" remote="github" revision="main" />
</manifest>
EOF

# Sync sources
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

# Build halium-boot
source build/envsetup.sh
breakfast NX669J
make -j$(nproc --all) halium-boot
```

## GitHub Actions

The repository includes a GitHub Actions workflow for automated Halium boot building:

1. Go to the **Actions** tab
2. Select **Build Halium Boot**
3. Click **Run workflow**
4. Select the Halium version (halium-9.0, halium-10, halium-11, or halium-12)
5. Download the artifact once the build completes

## Kernel Source

This device tree uses the official kernel source from ZTE/Nubia:
- Repository: [ztemt/NX669J-kernel](https://github.com/ztemt/NX669J-kernel)
- Branch: main
- Android version: Android 11

## Notes

- This is a minimal device tree for building Halium boot
- For full LineageOS builds, additional vendor blobs are required
- The kernel source is from the official Nubia open source release

## Credits

- [Nubia/ZTE](https://github.com/ztemt) for the kernel source
- [LineageOS](https://github.com/LineageOS) for the base code
- [Halium](https://github.com/halium) for the Halium framework

## License

```
Copyright (C) 2021-2024 The LineageOS Project

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
