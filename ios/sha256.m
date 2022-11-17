//
//  sha256.m
//  react-native-sha256
//
//  Created by Hagen Hübel on 18/05/2017.
//  Copyright © 2017 ITinance GmbH. All rights reserved.
//

#import "sha256.h"

#import <React/RCTUtils.h>
#include <CommonCrypto/CommonDigest.h>

@implementation sha256Lib

RCT_EXPORT_MODULE()

typedef unsigned char (*DIGEST_FUNCTION)(const void *data, CC_LONG len, unsigned char *md);

- (NSString*) calcHash: (NSString*) subject withDigestFunction: (DIGEST_FUNCTION) digest withDigestLength: (int) digestLength {

    const char* str = [subject UTF8String];
    unsigned char result[digestLength];
    digest(str, strlen(str), result);

    NSMutableString *ret = [NSMutableString stringWithCapacity:digestLength * 2];
    for(int i = 0; i < digestLength; i++)
    {
        [ret appendFormat:@"%02x",result[i]];
    }

    return ret;
}

- (NSString*) calcHashWithBytes: (NSArray *) subject withDigestFunction: (DIGEST_FUNCTION) digest withDigestLength: (int) digestLength {
    NSUInteger count = [subject count];
    unsigned char *array = (unsigned char *) malloc(count);

    if (array == nil) return nil;

    for (int i = 0; i < count; ++i) {
        array[i] = [[subject objectAtIndex: i] unsignedCharValue];
    }

    unsigned char result[digestLength];

    digest(array, count, result);

    free(array);

    NSMutableString *ret = [NSMutableString stringWithCapacity:digestLength * 2];
    for(int i = 0; i < digestLength; i++)
    {
        [ret appendFormat:@"%02x",result[i]];
    }

    return ret;
}

RCT_EXPORT_METHOD(sha1: (NSString *) data
                  resolver: (RCTPromiseResolveBlock) resolve
                  rejecter: (RCTPromiseRejectBlock) reject)

{
    NSString *ret = [self calcHash:data withDigestFunction:CC_SHA1 withDigestLength: CC_SHA1_DIGEST_LENGTH];
    resolve(ret);
}

RCT_EXPORT_METHOD(sha1Bytes: (NSArray *) data
                  resolver: (RCTPromiseResolveBlock) resolve
                  rejecter: (RCTPromiseRejectBlock) reject)

{
    NSString *ret = [self calcHashWithBytes:data withDigestFunction:CC_SHA1 withDigestLength: CC_SHA1_DIGEST_LENGTH];

    if (ret) {
        resolve(ret);
    } else {
        reject(@"error", @"out of memory", nil);
    }
}

RCT_EXPORT_METHOD(sha256: (NSString *) data
                  resolver: (RCTPromiseResolveBlock) resolve
                  rejecter: (RCTPromiseRejectBlock) reject)

{
    NSString *ret = [self calcHash:data withDigestFunction:CC_SHA256 withDigestLength: CC_SHA256_DIGEST_LENGTH];
    resolve(ret);
}

RCT_EXPORT_METHOD(sha256Bytes: (NSArray *) data
                  resolver: (RCTPromiseResolveBlock) resolve
                  rejecter: (RCTPromiseRejectBlock) reject)

{
    NSString *ret = [self calcHashWithBytes:data withDigestFunction:CC_SHA256 withDigestLength: CC_SHA256_DIGEST_LENGTH];

    if (ret) {
        resolve(ret);
    } else {
        reject(@"error", @"out of memory", nil);
    }
}

@end
