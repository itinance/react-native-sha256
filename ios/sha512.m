//
//  sha512.m
//  react-native-sha512
//
//  Created by Hagen Hübel on 18/05/2017.
//  Copyright © 2017 ITinance GmbH. All rights reserved.
//

#import "sha512.h"

#import <React/RCTUtils.h>
#import <React/RCTImageLoader.h>

#include <CommonCrypto/CommonDigest.h>

@implementation sha512lib

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


RCT_EXPORT_METHOD(sha512: (NSString *) string
                  resolver: (RCTPromiseResolveBlock) resolve
                  rejecter: (RCTPromiseRejectBlock) reject)

{
    const char *cstr = [string cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:string.length];
    uint8_t digest[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(data.bytes, data.length, digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA512_DIGEST_LENGTH*2];

    for(int i = 0; i < CC_SHA512_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];

    resolve(output);
}

@end
