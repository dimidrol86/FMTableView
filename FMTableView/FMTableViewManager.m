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



#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}


#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellIdentificator = @"FMTableViewCell";
    FMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentificator];
    [cell configurateCell:[[FMManager sharedManager] bridge]];
    return cell;


}



@end
