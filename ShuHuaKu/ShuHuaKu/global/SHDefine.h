#pragma mark - 配置文件
#define NET_MAX_OPERATIONCOUNT  10  //网络最大连接数


#define  APP_Name    @"KuaiDian"

#pragma mark - 字体扩展
#define font(a) [UIFont systemFontOfSize:a]
#define font_B(a) [UIFont boldSystemFontOfSize:a]
//手机号码验证
#define isPhoneNumber @"^1((3[0-9])|(5[0|1|2|3|5|6|7|8|9])|(8[0-9])|(4[5|7]))\\d{8}$"
//身份证验证
#define isCardID @"/^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{4}$/"
//邮编
#define iszipNumber @"[1-9]\\d{5}(?!\\d)"


