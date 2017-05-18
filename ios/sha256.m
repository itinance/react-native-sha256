//
//  sha256.m
//  react-native-sha256
//
//  Created by Hagen Hübel on 18/05/2017.
//  Copyright © 2017 ITinance GmbH. All rights reserved.
//

#import "sha256.h"

@implementation sha256

RCT_EXPORT_METHOD(sha256:(NSString *)data
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    resolve(data);
}

@end
