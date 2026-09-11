# DK PC Toolkit

Portable, reproducible PC diagnostic and repair toolkit for Windows and Linux systems.

The project defines the layout, manifests, validation, and service workflows for a bootable external SSD or USB drive. Third-party operating system images and proprietary binaries are not stored in this repository.

## Goals

- Boot on as many standard x86-64 PCs as practical.
- Keep Windows diagnostic and repair tools portable or standalone.
- Avoid permanent installation on the target Windows system.
- Make toolkit updates reproducible.
- Verify downloads with published checksums or signatures when available.
- Keep third-party licenses and redistribution restrictions explicit.
- Provide short, repeatable troubleshooting workflows.
- Prefer official upstream sources.

A portable tool may still require administrator rights or load a temporary runtime driver when this is required for low-level hardware access. It must not require a permanent installed product to be part of the default toolkit.

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
│   ├── Drivers/
│   ├── Security/
│   ├── Files/
│   ├── Network/
│   ├── Software/
│   ├── Recovery/
│   └── Benchmark/
├── Firmware/
├── Images/
├── Logs/
├── Scripts/
└── Docs/
```

## V0 core tool set

Boot and recovery:

- Ventoy
- SystemRescue
- Memtest86+
- Rescuezilla
- Windows 11 installation/recovery media

Portable Windows diagnostics and repair:

- Microsoft Sysinternals Suite
- HWiNFO Portable
- CPU-Z
- GPU-Z
- OCCT
- CrystalDiskInfo
- CrystalDiskMark
- TestDisk / PhotoRec
- FullEventLogView
- BlueScreenView
- Display Driver Uninstaller
- Driver Store Explorer
- Microsoft Safety Scanner
- Emsisoft Emergency Kit
- Everything
- Advanced IP Scanner
- Bulk Crap Uninstaller Portable
- Notepad++ Portable
- 7-Zip Extra

Optional tools:

- Libre Hardware Monitor
- Geek Uninstaller
- USBDeview
- DevManView
- ShellExView
- PuTTY
- WinSCP Portable
- WizTree Portable
- Clonezilla Live
- Hiren's BootCD PE

The default V0 intentionally excludes tools that duplicate core capability or require installation for their main purpose. Wireshark is excluded because packet capture needs a capture driver. Prime95 and FurMark are excluded because OCCT covers the default stress-testing requirement. IObit Unlocker is excluded because Sysinternals Handle and Process Explorer already cover locked-file diagnostics and forced handle closure. IObit Uninstaller is excluded in favor of the self-contained portable Bulk Crap Uninstaller workflow.

## Tool metadata

Each manifest entry records:

- `priority`: `core` or `optional`
- `mode`: portable, standalone, boot image, or boot manager
- `risk`: `read-only`, `stress`, `write`, or `destructive`
- `requires_admin`
- `offline_capable`
- official upstream source
- update strategy
- verification strategy
- destination on the service drive

See `docs/tool-policy.md` for the rules behind these fields.

## Recommended hardware

The minimum V0 storage hardware is intentionally small:

- one 500 GB M.2 2280 NVMe SSD
- one USB 3.2 Gen 2 10 Gbit/s NVMe enclosure with UASP, TRIM, S.M.A.R.T. passthrough, and boot support

The current reference V0 build is:

```text
Kingston NV3 500 GB
└── AXAGON EEM2-UG2
```

The SSD and enclosure are separate replaceable components. 1 TB capacity is optional, not required. USB4 is also optional; 10 Gbit/s USB is the compatibility-focused default.

Emergency boot media, a second quick-open M.2 recovery enclosure, SATA adapters, and a separate recovery destination drive are later-stage additions rather than V0 requirements.

See `docs/recommended-hardware.md` for the complete staged hardware guide.

## Repository layout

```text
.github/workflows/   Repository validation
config/              Toolkit configuration
manifests/           Tool metadata and acquisition policy
scripts/             Build, update, inventory, and verification scripts
docs/                Architecture, policy, hardware, and repair workflows
```

## Safety model

A repair toolkit can destroy data if it is used incorrectly. Destructive actions such as partition changes, filesystem repair, disk cloning, driver removal, software removal, forced handle closure, secure erase, and bootloader modification must be explicit. Scripts in this repository must not automatically modify a target machine or disk unless the operator selects that action.

For failing storage devices, the default recovery principle is: **image first, repair later**.

## Status

The repository is in the bootstrap stage. The first milestone is a reproducible V0 that can prepare the data partition of a Ventoy-based service drive, download approved tools, verify them, and produce an inventory report.
