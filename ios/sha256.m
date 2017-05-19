//
//  sha256.m
//  react-native-sha256
//
//  Created by Hagen Hübel on 18/05/2017.
//  Copyright © 2017 ITinance GmbH. All rights reserved.
//

#import "sha256.h"

#import <React/RCTUtils.h>
#import <React/RCTImageLoader.h>

#include <CommonCrypto/CommonDigest.h>

@implementation sha256Lib

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(sha256: (NSString *) data
                  resolver: (RCTPromiseResolveBlock) resolve
                  rejecter: (RCTPromiseRejectBlock) reject)

{
    const char* str = [data UTF8String];
    unsigned char result[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(str, strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_SHA256_DIGEST_LENGTH; i++)
    {
        [ret appendFormat:@"%02x",result[i]];
    }
    
    resolve(ret);
}

@end
