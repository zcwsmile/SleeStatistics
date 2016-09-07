//
//  JXConfig.m
//  SleepStatistics
//
//  Created by kiveen.zhao on 16/8/27.
//  Copyright © 2016年 kiveen.zhao. All rights reserved.
//

#import "JXConfig.h"

@implementation JXConfig


JXConfig *config=nil;

+ (instancetype)shareInstance{
    
    if (!config) {
        NSLog(@"shareInstance-%@", [self class]);
        config = [[JXConfig alloc] init];
    }
    return config;
}

+ (void)resetInstance
{
    NSLog(@"reset-%@", [self class]);
    config = nil;
    
}

- (instancetype)init
{
    NSLog(@"init-%@", [self class]);
    self = [super init];
    if (self) {
        _mp2Name = @"Enigma";
        _vibrateOption = JXVibrateReserve;
        
    }
    return self;
}





@end
