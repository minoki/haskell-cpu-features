# cpu-features for Haskell

This is a library to detect the features supported by the CPU running the Haskell program.

Supported platforms:

* x86_64: uses `cpuid`
    * Windows
    * macOS
    * Linux
* AArch64
    * macOS: uses `sysctlbyname`
    * Linux: uses `getauxval(AT_HWCAP/AT_HWCAP2)`
