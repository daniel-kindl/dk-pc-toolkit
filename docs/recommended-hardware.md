# Recommended hardware

This document defines the recommended physical hardware for DK PC Toolkit.

The project does not require one exact vendor or model. Reference models show the intended class of hardware. Prefer reliable, standard, replaceable hardware over the cheapest option or a sealed proprietary external drive.

Recommendations were last reviewed in September 2026.

## Purchase order

Build the kit in stages. The first stage is enough to start using DK PC Toolkit. Later stages add hardware for drive access, data recovery, and physical repair work.

### Stage 1: minimum toolkit

#### 1. Main service drive

The preferred design is a standard M.2 NVMe SSD installed in a separate USB enclosure.

This keeps the storage device and USB bridge replaceable. A failed enclosure does not force replacement of the SSD, and the SSD can be connected directly to an M.2 slot if USB bridge troubleshooting is required.

##### SSD specification

Recommended:

- 1 TB capacity
- M.2 2280 NVMe
- TLC NAND preferred
- PCIe 3.0 or PCIe 4.0
- no factory heatsink
- low idle and active power consumption preferred
- five-year warranty preferred
- S.M.A.R.T. and TRIM support
- reputable controller and NAND vendor

A high-end PCIe 4.0 or PCIe 5.0 SSD is not required. A 10 Gbit/s USB enclosure limits practical sequential throughput to about 1 GB/s, so reliability, power use, thermals, and endurance matter more than the SSD's native peak benchmark speed.

DRAM is useful but not required for this role. A good TLC HMB drive is acceptable because the toolkit workload is dominated by boot images, portable utilities, logs, and occasional large sequential transfers.

Avoid QLC when a similarly priced TLC drive is available. Avoid unknown SSD brands and drives with unclear NAND or controller revisions.

Reference SSD class:

- Samsung 990 EVO Plus 1 TB or another reputable 1 TB TLC M.2 2280 NVMe drive

The reference model is not a performance requirement. A lower-cost reliable TLC NVMe drive is sufficient when it has good warranty and thermal behavior.

##### Enclosure specification

Required:

- M.2 NVMe PCIe support
- M.2 2280 support
- USB 3.2 Gen 2, 10 Gbit/s minimum
- USB-C connector on the enclosure
- UASP support
- TRIM support
- S.M.A.R.T. passthrough
- boot support
- no proprietary driver requirement
- aluminum or other thermally conductive enclosure
- thermal pad between SSD and enclosure
- removable USB cable

Preferred:

- known bridge chipset such as Realtek RTL9210-series or ASMedia equivalent
- stable firmware
- screw-secured enclosure for the permanently installed toolkit SSD
- USB-C to USB-C and USB-C to USB-A connectivity in the carried cable set

USB4 or Thunderbolt is optional. It adds cost and usually does not improve compatibility with older repair targets. USB 3.2 Gen 2 at 10 Gbit/s is the default because it provides broad compatibility and is already fast enough for the toolkit workload.

Reference enclosure class:

- AXAGON EEM2-UG2 or another metal 10 Gbit/s NVMe enclosure with UASP, TRIM, S.M.A.R.T. passthrough, and boot support

A dual-protocol NVMe + M.2 SATA enclosure is acceptable, but it is not required for the main service drive.

##### Main-drive operating rule

Treat the assembled NVMe drive and enclosure as one permanent toolkit device during normal use. Do not repeatedly remove the toolkit SSD to inspect other computers' drives.

Use a separate quick-open enclosure for foreign M.2 drives in Stage 2.

Do not use the main service drive as the only destination for recovered data. Keep recovered files or full disk images on a separate destination drive when practical.

#### 2. Emergency boot flash drive

Recommended specification:

- 64 GB
- USB 3.x
- USB-A connector for broad firmware and older-PC compatibility
- physically separate from the main service SSD

Purpose:

- emergency SystemRescue or recovery environment
- fallback when firmware does not boot the main Ventoy SSD
- fallback when the main service drive or USB enclosure is unavailable

A basic reputable-brand flash drive is sufficient. Capacity and compatibility matter more than peak benchmark speed.

#### 3. Connection kit

Always carry:

- USB-C to USB-C data cable, 10 Gbit/s capable
- USB-C to USB-A data cable or adapter, 10 Gbit/s capable where possible
- one spare known-good USB cable

A failed or charge-only cable can look like a disk, USB controller, or firmware problem. The toolkit must always contain a known-good replacement cable.

#### 4. Protective case

Use a small case that keeps the following items together:

- main NVMe service drive
- emergency flash drive
- USB cables and adapters
- later Stage 2 adapters

The enclosure does not need to be ruggedized like a sealed portable SSD if the complete kit is stored in a protective case.

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

#### Separate M.2 recovery enclosure

This enclosure is different from the enclosure that permanently contains the toolkit SSD.

Recommended specification:

- M.2 NVMe PCIe support
- M.2 2230, 2242, 2260, and 2280 support preferred
- USB 3.2 Gen 2, 10 Gbit/s or better
- tool-free or quick-open design
- thermal pad and metal enclosure
- UASP
- S.M.A.R.T. passthrough
- USB-C and USB-A host connectivity

Optional but useful:

- support for both NVMe and M.2 SATA drives

A dual-protocol enclosure is more useful here than for the main service SSD because this device is intended to inspect unknown drives removed from other systems.

Reference recovery-enclosure class:

- AXAGON EEM2-SB2 or another tool-free 10 Gbit/s enclosure that supports both NVMe and M.2 SATA when broad compatibility is wanted

Purpose:

- inspect a removed NVMe or M.2 SATA SSD
- recover files from a non-booting PC
- clone or image an M.2 device outside the source system

Do not assume that every M.2 enclosure supports both NVMe and M.2 SATA. Confirm protocol support before connecting a drive.

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

1. Reputable 1 TB TLC M.2 2280 NVMe SSD.
2. Metal USB 3.2 Gen 2 10 Gbit/s NVMe enclosure with UASP, TRIM, S.M.A.R.T. passthrough, and boot support.
3. Reputable 64 GB USB-A emergency flash drive.
4. USB-C to USB-C and USB-C to USB-A known-good data cables.
5. Small protective case for the drive, flash drive, and cables.

This is enough to build and use V0. Add the separate SATA and M.2 recovery adapters when the toolkit starts being used for removed-drive diagnostics and data recovery.

## Hardware rules

- Prefer standard, modular, replaceable components.
- Prefer plug-and-play hardware that needs no installed driver package.
- Prefer standard USB mass-storage and USB networking classes where possible.
- Keep at least one known-good cable for comparison testing.
- Keep the main toolkit SSD installed in its own enclosure during normal use.
- Use a separate enclosure or adapter for drives removed from repair targets.
- Never keep recovered customer or personal data on the service drive longer than necessary.
- Do not image a failing source disk back onto itself.
- Use external power for 3.5-inch SATA disks.
- Treat cheap storage bridges and unstable cables as possible diagnostic variables.
- Keep the main toolkit drive and emergency boot drive physically separate.
