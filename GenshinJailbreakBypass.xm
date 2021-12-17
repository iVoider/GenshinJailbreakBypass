#include <os/log.h>
#include <dlfcn.h>
#import "substrate.h"

#define CS_OPS_ENTITLEMENTS_BLOB 7

static int (*orig_csops)(pid_t, unsigned int, user_addr_t , size_t);
 
int my_csops(pid_t pid, uint32_t ops, user_addr_t useraddr, user_size_t usersize) {
  if (ops == CS_OPS_ENTITLEMENTS_BLOB) {
        return orig_csops(pid, ops, useraddr, usersize);
    } else {
        printf("Hooked CSOPS %d \n", ops);
    }
    return 0;
}


%ctor {
    MSHookFunction(dlsym(RTLD_NEXT, "csops"),(void *)my_csops, (void **)&orig_csops);
}
