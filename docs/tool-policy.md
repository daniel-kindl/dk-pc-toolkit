# Tool Policy

DK PC Toolkit prefers tools that can run without a traditional installation on the target Windows system.

## Portable requirement

A Windows tool is eligible for the core toolkit when it can run from an extracted archive or standalone executable without a permanent MSI/MSIX/setup installation.

A tool may require administrator rights or load a temporary kernel driver at runtime. This is acceptable when the driver is part of normal tool operation and does not require a permanent installed product.

## Priority

- `core`: Included in the default toolkit profile.
- `optional`: Useful fallback or specialist tool. Not required for the default profile.

## Risk classes

- `read-only`: Intended to inspect or report state without modifying the target system.
- `stress`: Generates significant CPU, GPU, memory, disk, or network load.
- `write`: Can modify the operating system, configuration, files, drivers, or storage metadata.
- `destructive`: Can cause data loss or make the system unbootable if used incorrectly.

The risk class describes capability, not normal expected behavior.

## Acquisition

Every manifest entry records an update strategy.

- `manual`: The operator obtains the artifact from the official source.
- `direct`: The synchronizer may download an artifact from a stable official URL.
- `release-api`: The synchronizer may resolve releases through an official upstream API or release feed.
- `vendor-resolver`: A dedicated resolver is required for the vendor download flow.

Automatic acquisition must not bypass licenses, authentication, anti-bot controls, or unsupported vendor workflows.

## Verification

Preferred verification order:

1. Cryptographic signature published by upstream.
2. Cryptographic checksum published by upstream.
3. Authenticode or another vendor signature where applicable.
4. Local SHA-256 inventory when upstream does not publish a checksum.

A failed verification must never replace an existing artifact.

## Offline capability

`offline_capable: true` means the tool can perform its primary diagnostic or repair purpose without Internet access after it is present on the toolkit drive. Some features, signature databases, lookups, or updates can still require network access.
