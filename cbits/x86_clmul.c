#include <wmmintrin.h>
#include <stdint.h>

__attribute__((target("pclmul")))
uint64_t hs_cpu_features_clmul_lo(uint64_t a, uint64_t b)
{
    __m128i aa = _mm_set_epi64x(0, a);
    __m128i bb = _mm_set_epi64x(0, b);
    __m128i result = _mm_clmulepi64_si128(aa, bb, 0);
    uint64_t result2;
    _mm_storeu_si64(&result2, result);
    return result2;
}

__attribute__((target("pclmul")))
uint64_t hs_cpu_features_clmul_hi(uint64_t a, uint64_t b)
{
    __m128i aa = _mm_set_epi64x(0, a);
    __m128i bb = _mm_set_epi64x(0, b);
    __m128i result = _mm_clmulepi64_si128(aa, bb, 0);
    _Alignas(16) uint64_t result2[2];
    _mm_store_si128((__m128i *)result2, result);
    return result2[1];
}
