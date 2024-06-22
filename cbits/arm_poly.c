#include <arm_acle.h>
#include <arm_neon.h>

uint64_t hs_cpu_features_polymul_lo(uint64_t a, uint64_t b)
{
    poly64x1_t aa = vcreate_p64(a);
    poly64x1_t bb = vcreate_p64(b);
    poly128_t result = vmull_p64(vget_lane_p64(aa, 0), vget_lane_p64(bb, 0));
    uint64x2_t result2 = vreinterpretq_u64_p128(result);
    return vgetq_lane_u64(result2, 0);
}

uint64_t hs_cpu_features_polymul_hi(uint64_t a, uint64_t b)
{
    poly64x1_t aa = vcreate_p64(a);
    poly64x1_t bb = vcreate_p64(b);
    poly128_t result = vmull_p64(vget_lane_p64(aa, 0), vget_lane_p64(bb, 0));
    uint64x2_t result2 = vreinterpretq_u64_p128(result);
    return vgetq_lane_u64(result2, 1);
}

/*
uint64_t hs_cpu_features_polymul(uint64_t a, uint64_t b, uint64_t *out_hi)
{
    poly64x1_t aa = vcreate_p64(a);
    poly64x1_t bb = vcreate_p64(b);
    poly128_t result = vmull_p64(vget_lane_p64(aa, 0), vget_lane_p64(bb, 0));
    uint64x2_t result2 = vreinterpretq_u64_p128(result);
    *out_hi = vgetq_lane_u64(result2, 1);
    return vgetq_lane_u64(result2, 0);
}
*/
