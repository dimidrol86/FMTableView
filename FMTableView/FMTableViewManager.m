//
//  RCTFinchTableViewManager.m
//  FMTableView
//
//  Created by Dimidrol on 31.03.16.
//  Copyright © 2016 FM. All rights reserved.
//

#import "FMTableViewManager.h"
#import "FMTableView.h"
#import "FMTableViewCell.h"
#import "FMManager.h"

@interface FMTableViewManager () <UITableViewDelegate,UITableViewDataSource>


@end

@implementation FMTableViewManager

RCT_EXPORT_MODULE()


- (UIView *)view
{
    FMTableView *tableView = [[FMTableView alloc] init];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    static NSString * cellIdentificator = @"FMTableViewCell";
    
    [tableView registerClass:[FMTableViewCell class] forCellReuseIdentifier:cellIdentificator];
    
    return tableView;
    
}

//RCT_EXPORT_VIEW_PROPERTY(cellModule, NSString)

RCT_CUSTOM_VIEW_PROPERTY(cellModule, NSString*, FMTableView) {
    [view setCellModule:[RCTConvert NSString:json]];
}

#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}


#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellIdentificator = @"FMTableViewCell";
    FMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentificator];
    [cell configurateCell:[[FMManager sharedManager] bridge] module:[(FMTableView*)tableView cellModule]];
    return cell;
    
}


#pragma mark - UIScrollViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    
}



@end
