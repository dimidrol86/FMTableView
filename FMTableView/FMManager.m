//
//  FMManager.m
//  FMTableView
//
//  Created by Dimidrol on 14.04.16.
//  Copyright © 2016 FM. All rights reserved.
//

#import "FMManager.h"

@implementation FMManager

@synthesize bridge = _bridge;

+(instancetype _Nonnull)sharedManager{
    static FMManager *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [FMManager new];
    });
    return shared;
}

@end
