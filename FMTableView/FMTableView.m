//
//  FMTableView.m
//  FMTableView
//
//  Created by Dimidrol on 11.03.16.
//  Copyright © 2016 FM. All rights reserved.
//

#import "FMTableView.h"
#import "UIScrollView+BottomRefreshControl.h"
#import "UIView+React.h"
#import "FMManager.h"

@class RCTBridge;

@interface FMTableView ()

@property (nonatomic,strong) UIRefreshControl *bottomRefresh;

@end

@implementation FMTableView

@synthesize model=_model;

-(instancetype)init{
    
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        
        _bottomRefresh = [UIRefreshControl new];
        _bottomRefresh.triggerVerticalOffset = 100;
        [_bottomRefresh addTarget:self action:@selector(paginationLoad) forControlEvents: UIControlEventValueChanged];
        self.bottomRefreshControl = _bottomRefresh;
        [self bringSubviewToFront:self.bottomRefreshControl];
        return self;
    }

    return nil;
}


-(void)setModel:(NSDictionary *)model{
    _model = model;
    
    [self.bottomRefreshControl endRefreshing];
    [self reloadData];
}

#pragma mark - Actions

-(void)paginationLoad{

    if([_fmDelegate respondsToSelector:@selector(paginationLoad:)]){
        [_fmDelegate paginationLoad:self];
    }
}

@end
