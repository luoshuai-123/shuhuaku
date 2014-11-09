


/**
 
 在Debug模式下正常输出NSLog
 在Release模式下,启用NSLogger远程查看Log
 
 **/
#import "LoggerClient.h"

#ifdef RELEASE
#define NSLog(...) LogMessageF( \
__FILE__,           \
__LINE__,           \
__FUNCTION__,       \
nil, 0,             \
__VA_ARGS__)
#else
#endif

