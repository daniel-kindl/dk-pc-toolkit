# Architecture

## Purpose

DK PC Toolkit is a reproducible definition of a portable PC service drive. The repository controls metadata, directory layout, validation, and operator workflows. The service drive contains the downloaded artifacts.

## Design principles

1. Prefer official upstream sources.
2. Do not redistribute third-party binaries unless redistribution is explicitly permitted.
3. Verify artifacts when an upstream checksum or signature is available.
4. Separate acquisition from destructive disk operations.
5. Keep logs and inventory for each toolkit update.
6. Make manual-only tools explicit instead of bypassing licensing or download controls.
7. Never select a repair target disk automatically.

## Components

### Boot layer

Ventoy provides the multi-boot layer. ISO and bootable image files live on the Ventoy data partition.

Installing or upgrading Ventoy itself is intentionally separate from normal toolkit synchronization because it writes disk partition metadata.

### Artifact layer

The manifests describe tools and images. Each entry records:

- identifier
- category
- upstream project
- homepage
- acquisition mode
- destination
- verification policy
- notes

Acquisition modes:

- `automatic`: updater can fetch the artifact from an official stable URL or supported release API.
- `manual`: operator must download the artifact.
- `disabled`: known tool that is not part of the current build.

### Update layer

The updater prepares directories, resolves automatic artifacts, downloads to a temporary location, verifies them, and moves verified files into place.

A failed verification must never replace an existing known-good artifact.

### Inventory layer

Each synchronized drive gets an inventory that records artifact name, version when known, SHA-256, size, source, and update time.

### Workflow layer

Documents under `docs/workflows` describe repeatable diagnostic procedures. They start with low-risk inspection and clearly mark destructive steps.

## Target disk layout

```text
/
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

## V0 boundary

V0 prepares and synchronizes the data partition. It does not automatically:

- partition a disk
- install Ventoy
- change firmware settings
- modify a target PC
- download Windows installation media through unsupported URLs
- bypass licenses, authentication, or download gates
