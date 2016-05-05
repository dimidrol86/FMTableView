//
//  FMTableCellManager.m
//  FMTableView
//
//  Created by Dmitry Konygin on 06.05.16.
//  Copyright © 2016 FM. All rights reserved.
//

#import "FMTableCellManager.h"
#import "FMTableCell.h"

@implementation FMTableCellManager

RCT_EXPORT_MODULE()


- (UIView *)view
{
    return [FMTableCell new];
}


@end
