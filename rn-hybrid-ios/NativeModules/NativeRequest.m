//
//  NativeRequest.m
//  rn-hybrid-ios
//
//  Created by Tomoyuki Ito on 2018/04/27.
//  Copyright © 2018 Nagisa Inc. All rights reserved.
//

#import "NativeRequest.h"
#import "rn_hybrid_ios-Swift.h"

@implementation NativeRequest

RCT_EXPORT_MODULE(NativeRequest)

RCT_EXPORT_METHOD(send:(NSString *)action payload:(NSDictionary *)payload)
{
    NSLog(@"NativeRequest action: %@, payload %@", action, payload);
    [NativeService handleRequstWithActionString:action payload:payload];
}

@end
