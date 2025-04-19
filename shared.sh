#!/bin/sh
# Shared definitions for buildroot scripts

# The defconfig from the buildroot directory we use for qemu builds
RPI4_DEFCONFIG=configs/raspberrypi4_64_defconfig
# The place we store customizations to the qemu configuration
MODIFIED_RPI_DEFCONFIG=base_external/configs/aesd_rpi_defconfig
# The defconfig from the buildroot directory we use for the project
AESD_DEFAULT_DEFCONFIG=${RPI4_DEFCONFIG}
AESD_MODIFIED_DEFCONFIG=${MODIFIED_RPI_DEFCONFIG}
AESD_MODIFIED_DEFCONFIG_REL_BUILDROOT=../${AESD_MODIFIED_DEFCONFIG}