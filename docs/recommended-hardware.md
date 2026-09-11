# Recommended hardware

This document defines the recommended physical hardware for DK PC Toolkit.

The project does not require one exact vendor or model. Reference models show the intended class of hardware. Prefer reliable, standard, replaceable hardware over the cheapest option or a sealed proprietary external drive.

Recommendations were last reviewed in September 2026.

## Purchase order

Build the kit in stages. V0 intentionally starts with the minimum hardware needed to create and use the toolkit. Recovery adapters, fallback media, and physical service hardware can be added later.

### Stage 1: V0 minimum

V0 requires exactly two storage components:

1. one M.2 NVMe SSD
2. one USB enclosure for that SSD

No second M.2 enclosure, separate recovery drive, or emergency flash drive is required for V0.

#### Main toolkit SSD

Recommended specification:

- 500 GB capacity
- M.2 2280 NVMe
- PCIe 3.0 or PCIe 4.0
- no factory heatsink
- reputable vendor
- S.M.A.R.T. and TRIM support
- five-year warranty preferred

500 GB is the default V0 capacity. It provides ample space for boot images, Windows installation media, portable tools, drivers, scripts, logs, and future additions without paying for capacity that is unlikely to be used.

1 TB is optional when the price difference is small or when more local images and driver archives are expected.

A high-end PCIe 4.0 or PCIe 5.0 SSD is not required. A 10 Gbit/s USB enclosure limits practical sequential throughput to about 1 GB/s, so native SSD benchmark speed above that level does not materially improve normal toolkit use.

TLC NAND is preferred when available at a reasonable price, but it is not a hard V0 requirement. For this mostly read-heavy workload, a reputable budget NVMe drive is acceptable.

Current V0 reference SSD:

- Kingston NV3 500 GB

The reference model is a cost-focused example, not a hard dependency.

#### Main toolkit enclosure

Required specification:

- M.2 NVMe PCIe support
- M.2 2280 support
- USB 3.2 Gen 2, 10 Gbit/s
- USB-C connector on the enclosure
- UASP support
- TRIM support
- S.M.A.R.T. passthrough
- boot support
- no proprietary driver requirement
- thermally conductive enclosure
- thermal pad for the SSD
- removable USB cable

Preferred:

- stable bridge chipset and firmware
- metal enclosure
- USB-C to USB-C and USB-C to USB-A connectivity through carried cables or adapters

USB4 or Thunderbolt is optional. USB 3.2 Gen 2 at 10 Gbit/s is the V0 default because it is fast enough for the toolkit and has broader compatibility with repair targets.

Current V0 reference enclosure:

- AXAGON EEM2-UG2

The SSD remains installed in this enclosure during normal use. Treat the assembled pair as one portable toolkit drive.

### V0 reference build

```text
DK PC Toolkit V0

Kingston NV3 500 GB
└── AXAGON EEM2-UG2
    ├── Ventoy
    ├── ISO images
    ├── portable tools
    ├── drivers
    ├── scripts
    └── documentation
```

This is enough to build and use the first version of DK PC Toolkit.

### Stage 2: reliability and compatibility

Add these items after V0 if the toolkit starts being carried between multiple systems:

- 64 GB USB-A emergency boot flash drive
- known-good USB-C to USB-C data cable
- known-good USB-C to USB-A data cable or adapter
- one spare known-good USB cable
- small protective case

The emergency flash drive is a fallback when firmware does not boot the main Ventoy SSD or when the main enclosure is unavailable. It is useful, but it is not required to start V0.

### Stage 3: drive access and recovery

Add recovery hardware when the toolkit is used to work with drives removed from other computers.

#### SATA to USB adapter or dock

Recommended specification:

- USB 3.x
- SATA III support
- 2.5-inch SATA HDD/SSD support
- 3.5-inch SATA HDD support
- external 12 V power supply for 3.5-inch drives
- no required driver installation

This adapter is useful for reading, imaging, or testing SATA drives outside the original computer.

#### Separate M.2 recovery enclosure

This is the point at which a second M.2 enclosure becomes useful.

Recommended specification:

- M.2 NVMe support
- M.2 SATA support preferred
- M.2 2230, 2242, 2260, and 2280 support preferred
- USB 3.2 Gen 2, 10 Gbit/s
- tool-free or quick-open design
- UASP
- S.M.A.R.T. passthrough
- metal enclosure and thermal pad

Reference class:

- AXAGON EEM2-SB2 or another tool-free enclosure that supports both NVMe and M.2 SATA

Use this enclosure for drives removed from repair targets. Do not dismantle the main toolkit enclosure each time another M.2 drive must be inspected.

#### Separate recovery destination drive

Add a separate destination drive when disk imaging or significant data recovery becomes part of the workflow.

Recommended specification:

- at least 2 TB
- SSD preferred for portability and speed
- enough capacity for the complete source image

Do not use the toolkit SSD as the only destination for recovered data or full source-disk images.

### Stage 4: connectivity and physical service

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

### Stage 5: advanced recovery

Optional advanced hardware:

- hardware SATA/USB write blocker
- spare known-good ATX power supply
- POST/debug card where compatible
- multimeter for users trained to work safely around PC power electronics

These items are not required for normal DK PC Toolkit use.

## Hardware rules

- Keep V0 simple: one SSD and one enclosure.
- Prefer standard, modular, replaceable components.
- Prefer plug-and-play hardware that needs no installed driver package.
- Do not pay for internal SSD performance that the USB bridge cannot use.
- Keep the toolkit SSD installed in its enclosure during normal use.
- Add separate recovery adapters only when the use case requires them.
- Do not image a failing source disk back onto itself.
- Use external power for 3.5-inch SATA disks.
- Treat cheap storage bridges and unstable cables as possible diagnostic variables.
