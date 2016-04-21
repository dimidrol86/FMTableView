//
//  FMTableView.m
//  FMTableView
//
//  Created by Dimidrol on 11.03.16.
//  Copyright © 2016 FM. All rights reserved.
//

#import "FMTableView.h"

@implementation FMTableView

@synthesize model=_model;

-(instancetype)init{
    
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        return self;
    }
    
    return nil;
}


-(void)setModel:(NSDictionary *)model{
    _model = model;
    
    [self reloadData];

    
}

@end
