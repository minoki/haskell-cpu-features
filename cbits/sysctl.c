#include "HsFFI.h"
#include <sys/sysctl.h>

HsBool hs_cpu_features_sysctl(const char *name)
{
    int result = 0;
    size_t len = sizeof(result);
    int succ = sysctlbyname(name, &result, &len, NULL, 0);
    return succ == 0 && result != 0;
}
