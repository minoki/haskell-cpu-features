# Revision history for cpu-features

## 0.1.0.0 -- 2025-04-26

Initial release.

Supported platforms:

* x86_64: via `cpuid`
    * Windows
    * macOS: uses `sysctlbyname` to detect AVX-512
    * Linux
* AArch64
    * macOS: via `sysctlbyname`
    * Linux: via `getauxval(AT_HWCAP/AT_HWCAP2)`
* RISC-V 64
    * Linux: via `getauxval(AT_HWCAP)` and hwprobe
