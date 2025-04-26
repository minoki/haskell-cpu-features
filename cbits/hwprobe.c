// For RISC-V Linux
#define _GNU_SOURCE
#include <stdint.h>
#include <unistd.h>
#include <asm/hwprobe.h>
#include <sched.h> // cpu_set_t
#include <sys/syscall.h> // SYS_riscv_hwprobe

uint64_t hs_cpu_features_hwprobe_ima_ext_0(void)
{
    struct riscv_hwprobe probe[1] = {
        {.key = RISCV_HWPROBE_KEY_IMA_EXT_0, .value = 0},
    };
    // long result = sys_riscv_hwprobe(probe, 1, 0, NULL, 0);
    long result = syscall(SYS_riscv_hwprobe, probe, (size_t)1, (size_t)0, (cpu_set_t *)NULL, 0u);
    if (result == 0) {
        return probe[0].value;
    } else {
        return 0;
    }
}
