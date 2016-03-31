//
//  RCTFinchTableViewManager.m
//  FMTableView
//
//  Created by Dimidrol on 31.03.16.
//  Copyright © 2016 FM. All rights reserved.
//

#import "FMTableViewManager.h"
#import "FMTableView.h"

@interface FMTableViewManager ()

@end

@implementation FMTableViewManager


RCT_EXPORT_MODULE()

- (UIView *)view
{
    return [[FMTableView alloc] init];
}


@end
