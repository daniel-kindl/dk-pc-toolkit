# Recommended hardware

This document defines the recommended physical hardware for DK PC Toolkit.

The project does not require one exact vendor or model. Reference models show the intended class of hardware. Prefer reliable, standard hardware over the cheapest option.

Recommendations were last reviewed in September 2026.

## Purchase order

Build the kit in stages. The first stage is enough to start using DK PC Toolkit. Later stages add hardware for drive access, data recovery, and physical repair work.

### Stage 1: minimum toolkit

#### 1. Main service drive

Recommended specification:

- 1 TB portable SSD
- USB 3.2 Gen 2, 10 Gbit/s
- USB-C device connector
- UASP support
- durable enclosure
- no vendor software required for normal use
- compatible with both USB-C and USB-A hosts through carried cables or adapters

Primary reference model:

- Samsung Portable SSD T7 Shield 1 TB

Why:

- USB 3.2 Gen 2
- up to 1,050 MB/s sequential read and 1,000 MB/s sequential write
- IP65-rated enclosure
- rated for drops up to 3 m
- compact enough to remain permanently in the toolkit case

Value reference model:

- Kingston XS1000 1 TB

Why:

- USB 3.2 Gen 2
- up to 1,050 MB/s sequential read and 1,000 MB/s sequential write
- very small and light
- USB Type-A compatibility through the included cable/adapter set
- five-year limited warranty

The T7 Shield is the default recommendation when durability matters more than minimum cost. The XS1000 is the value option when compact size and price matter more.

Do not use the main service drive as the only destination for recovered data. Keep recovered files or full disk images on a separate destination drive when practical.

#### 2. Emergency boot flash drive

Recommended specification:

- 64 GB
- USB 3.x
- USB-A connector for broad firmware and older-PC compatibility
- physically separate from the main service SSD

Purpose:

- emergency SystemRescue or recovery environment
- fallback when a firmware does not boot the main Ventoy SSD
- fallback when the main service drive is unavailable

A basic reputable-brand flash drive is sufficient. Capacity and compatibility matter more than peak benchmark speed.

#### 3. Connection kit

Always carry:

- USB-C to USB-C data cable, 10 Gbit/s capable
- USB-C to USB-A data cable or adapter, 10 Gbit/s capable where possible
- one spare known-good USB cable

A failed or charge-only cable can look like a disk, USB controller, or firmware problem. The toolkit must always contain a known-good replacement cable.

### Stage 2: drive access and recovery

#### SATA to USB adapter or dock

Recommended specification:

- USB 3.x
- SATA III support
- 2.5-inch SATA HDD/SSD support
- 3.5-inch SATA HDD support
- external 12 V power supply for 3.5-inch drives
- no required driver installation

A powered adapter or single-bay dock is preferred over an unpowered cable because 3.5-inch disks require external power.

This adapter is useful for:

- reading a removed system disk
- imaging a failing disk
- copying data before reinstalling an operating system
- testing whether a SATA drive works outside the original PC

For older systems, an adapter that also supports IDE/PATA can be useful, but IDE support is not required for V0.

#### M.2 NVMe to USB enclosure

Recommended specification:

- M.2 NVMe PCIe support
- USB 3.2 Gen 2, 10 Gbit/s or better
- 2280 support at minimum
- tool-free or quick-open design preferred
- thermal pad and metal enclosure preferred

Purpose:

- inspect a removed NVMe SSD
- recover files from a non-booting PC
- clone or image an NVMe device outside the source system

Do not assume that one enclosure supports both NVMe and M.2 SATA. Confirm protocol support before purchase.

#### Separate recovery destination drive

Recommended specification:

- at least 2 TB
- SSD preferred for portability and speed
- capacity must be greater than the source data that must be imaged

This drive is intentionally separate from the toolkit SSD. A full-device image can consume the complete nominal capacity of the source disk.

### Stage 3: connectivity and physical service

Useful additions:

- powered USB 3.x hub
- USB to Gigabit Ethernet adapter
- known-good Ethernet cable
- precision screwdriver set
- ESD wrist strap
- plastic spudger or opening tools
- small flashlight
- spare SATA data cable
- spare CR2032 CMOS battery
- small container for screws

The powered USB hub is especially useful when several storage devices are connected during cloning or recovery. Do not rely on a bus-powered hub for 3.5-inch hard drives.

### Stage 4: advanced recovery

Optional advanced hardware:

- hardware SATA/USB write blocker
- spare known-good ATX power supply
- POST/debug card where compatible
- multimeter for users trained to work safely around PC power electronics

These are not required for the normal DK PC Toolkit workflow. A hardware write blocker is useful when preserving a source disk is more important than repair convenience.

## Recommended first purchase

For a new kit with no existing hardware, buy these items first:

1. Samsung Portable SSD T7 Shield 1 TB, or Kingston XS1000 1 TB as the value alternative.
2. Reputable 64 GB USB-A flash drive.
3. USB-C to USB-C and USB-C to USB-A known-good data cables.
4. Small protective case for the drive, flash drive, and cables.

This is enough to build and use V0. Add SATA and NVMe adapters when the toolkit starts being used for removed-drive diagnostics and data recovery.

## Hardware rules

- Prefer plug-and-play hardware that needs no installed driver package.
- Prefer standard USB mass-storage and USB networking classes where possible.
- Keep at least one known-good cable for comparison testing.
- Never keep recovered customer or personal data on the service drive longer than necessary.
- Do not image a failing source disk back onto itself.
- Use external power for 3.5-inch SATA disks.
- Treat cheap storage bridges and unstable cables as possible diagnostic variables.
- Keep the main toolkit drive and emergency boot drive physically separate.
