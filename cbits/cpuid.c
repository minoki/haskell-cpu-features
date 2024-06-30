#include <stdint.h>
#include <cpuid.h>
#include <immintrin.h>

void hs_cpu_features_cpuid(uint32_t eax, uint32_t ecx, uint32_t result[4])
{
    __cpuid_count(eax, ecx, result[0], result[1], result[2], result[3]);
}

__attribute__((target("xsave")))
uint64_t hs_cpu_features_xgetbv(uint32_t a)
{
    return _xgetbv(a);
}
