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
#import "UIView+React.h"

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

RCT_CUSTOM_VIEW_PROPERTY(model, NSDictionary*, FMTableView) {
    [view setModel:[RCTConvert NSDictionary:json]];
    
    
    //NSLog(@"%@",[RCTConvert NSDictionary:json]);
}


#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}


-(void)tableView:(FMTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *event = @{@"target": tableView.reactTag,
                            @"data": @""};
    
    [[FMManager sharedManager].bridge.eventDispatcher sendInputEventWithName:@"change" body:event];
    
}


#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if ([(FMTableView*)tableView model]) {
        NSArray *a = [(FMTableView*)tableView model][@"list"];
        if([a isKindOfClass:[NSArray class]]){
            return a.count;
        }
    }
    
    return 0;
}

-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellIdentificator = @"FMTableViewCell";
    FMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentificator];
    
    NSDictionary *d;
    if ([(FMTableView*)tableView model]) {
        NSArray *a = [(FMTableView*)tableView model][@"list"];
        if([a isKindOfClass:[NSArray class]]){
            d = a[indexPath.row];
        }
    }
    
    [cell configurateCell:[[FMManager sharedManager] bridge] module:[(FMTableView*)tableView cellModule] props:d];
    return cell;
}


#pragma mark - UIScrollViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    
}



@end
