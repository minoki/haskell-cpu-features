# cpu-features for Haskell

This is a library to detect the features supported by the CPU running the Haskell program.

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
