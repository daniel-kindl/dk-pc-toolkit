# DK PC Toolkit

Portable, reproducible PC diagnostic and repair toolkit for Windows and Linux systems.

The project defines the layout, manifests, validation, and service workflows for a bootable external SSD or USB drive. Third-party operating system images and proprietary binaries are not stored in this repository.

## Goals

- Boot on as many standard x86-64 PCs as practical.
- Keep diagnostic and repair tools portable.
- Make toolkit updates reproducible.
- Verify downloads with published checksums or signatures when available.
- Keep third-party licenses and redistribution restrictions explicit.
- Provide short, repeatable troubleshooting workflows.
- Prefer official upstream sources.

## Planned disk layout

```text
PC-TOOLKIT/
├── ISO/
│   ├── Recovery/
│   ├── Windows/
│   └── Linux/
├── Tools/
│   ├── Hardware/
│   ├── Storage/
│   ├── Windows/
│   ├── Network/
│   ├── Recovery/
│   └── Benchmark/
├── Drivers/
├── Firmware/
├── Images/
├── Logs/
├── Scripts/
└── Docs/
```

## Initial tool set

Boot and recovery:

- Ventoy
- SystemRescue
- Memtest86+
- Rescuezilla
- Clonezilla
- Windows 11 installation/recovery media
- Hiren's BootCD PE as an optional compatibility/recovery environment

Portable Windows diagnostics:

- Microsoft Sysinternals Suite
- HWiNFO Portable
- CrystalDiskInfo
- CrystalDiskMark
- CPU-Z
- GPU-Z
- Display Driver Uninstaller
- OCCT
- TestDisk / PhotoRec
- 7-Zip
- Wireshark
- PuTTY / WinSCP
- Rufus
- Notepad++

The manifests decide which tools can be downloaded automatically and which tools require manual acquisition because of licensing, download flow, or redistribution restrictions.

## Repository layout

```text
.github/workflows/   Repository validation
config/              Toolkit configuration
manifests/           Tool metadata and acquisition policy
scripts/             Build, update, inventory, and verification scripts
docs/                Architecture and repair workflows
```

## Safety model

A repair toolkit can destroy data if it is used incorrectly. Destructive actions such as partition changes, filesystem repair, disk cloning, secure erase, and bootloader modification must be explicit. Scripts in this repository must not automatically modify a target machine or disk unless the operator selects that action.

For failing storage devices, the default recovery principle is: **image first, repair later**.

## Status

The repository is in the bootstrap stage. The first milestone is a reproducible V0 that can prepare the data partition of a Ventoy-based service drive, download approved tools, verify them, and produce an inventory report.
