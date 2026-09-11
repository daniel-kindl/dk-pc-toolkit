# Failing storage workflow

Use this workflow when a disk shows read errors, disappears intermittently, reports SMART warnings, becomes very slow, or contains important data that may be at risk.

## Principle

**Image first. Repair later.**

Do not run write-heavy repair tools on the original device before you have a recoverable copy when the data matters.

## Procedure

1. Stop normal use of the affected disk.
2. Record the disk model, serial number, capacity, connection type, and visible symptoms.
3. Read SMART/NVMe health information without starting an extended destructive test.
4. If the disk contains important data, prepare a destination disk with enough free capacity.
5. Boot SystemRescue or another trusted recovery environment when the host operating system is unstable.
6. Create an image or clone of the failing device. Prefer tools designed to handle read errors, such as GNU ddrescue.
7. Save the recovery log/map file separately from the source disk.
8. Perform filesystem repair, partition reconstruction, or file recovery against the clone or image whenever possible.
9. Replace hardware that continues to report media, controller, or interface errors after cable and enclosure checks.

## Avoid

Do not:

- format the source disk
- initialize an unknown disk when Windows prompts for it
- run `chkdsk /f`, filesystem write repair, or similar operations before imaging important data
- repeatedly power-cycle a mechanically failing drive without a recovery reason
- clone in the wrong direction

Always identify source and destination by model, serial number, and capacity before a copy operation.
