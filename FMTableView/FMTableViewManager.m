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

{
    FMTableView *_tableView;
}

@end

@implementation FMTableViewManager

RCT_EXPORT_MODULE()

RCT_EXPORT_VIEW_PROPERTY(cellModule, NSString)

- (UIView *)view
{
    _tableView = [[FMTableView alloc] init];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    static NSString * cellIdentificator = @"FMTableViewCell";
    
    [_tableView registerClass:[FMTableViewCell class] forCellReuseIdentifier:cellIdentificator];
    
    return _tableView;
    
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
    [cell configurateCell:[[FMManager sharedManager] bridge] module:_tableView.cellModule];
    return cell;
    
    
}



@end
