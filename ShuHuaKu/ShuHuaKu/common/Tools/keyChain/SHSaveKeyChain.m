//
//  KDSaveKeyChain.m
//  KuaiDian
//
//  Created by luoshuai on 14-9-27.
//  Copyright (c) 2014年 KD. All rights reserved.
//

#import "SHSaveKeyChain.h"

@implementation SHSaveKeyChain

#if __has_feature(objc_arc)
#define BRIDGE_T      __bridge_transfer
#define BRIDGE_R      __bridge_retained
#else
#define BRIDGE_T
#define BRIDGE_R
#endif

+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service {
    
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (BRIDGE_T id)kSecClassGenericPassword,(BRIDGE_T id)kSecClass,
            service, (BRIDGE_T id)kSecAttrService,
            service, (BRIDGE_T id)kSecAttrAccount,
            (BRIDGE_T id)kSecAttrAccessibleAfterFirstUnlock,(BRIDGE_T id)kSecAttrAccessible,
            nil];
    
}

+ (void)save:(NSString *)service data:(id)data {
    //Get search dictionary
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Delete old item before add new item
    SecItemDelete((BRIDGE_R CFDictionaryRef)keychainQuery);
    //Add new object to search dictionary(Attention:the data format)
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(BRIDGE_T id)kSecValueData];
    //Add item to keychain with the search dictionary
    SecItemAdd((BRIDGE_R CFDictionaryRef)keychainQuery, NULL);
}

+ (id)load:(NSString *)service {
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Configure the search setting
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(BRIDGE_T id)kSecReturnData];
    [keychainQuery setObject:(BRIDGE_T id)kSecMatchLimitOne forKey:(BRIDGE_T id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((BRIDGE_R CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(BRIDGE_T NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"Unarchive of %@ failed: %@", service, e);
        } @finally {
        }
    }
    return ret;
}

+ (void)delete:(NSString *)service {
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    SecItemDelete((BRIDGE_R CFDictionaryRef)keychainQuery);
}

@end
