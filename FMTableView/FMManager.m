//
//  FMManager.m
//  FMTableView
//
//  Created by Dimidrol on 14.04.16.
//  Copyright © 2016 FM. All rights reserved.
//

#import "FMManager.h"
#import "UIView+React.h"

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

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(setTableSize:(NSInteger)count)
{
    NSLog(@"Вывод ячейка %ld", (long)count);
}

-(NSString*) getCurrentLocale{
    NSString *localeString=[[NSLocale currentLocale] localeIdentifier];
    return localeString;
}

- (NSDictionary *)constantsToExport
{
    return @{ @"locale": [self getCurrentLocale] };
}


@end
