//
//  FMTableView.h
//  FMTableView
//
//  Created by Dimidrol on 11.03.16.
//  Copyright © 2016 FM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FMManager.h"

@class FMTableView;

@protocol FMTableViewDelegate <NSObject>
-(void)paginationLoad:(FMTableView*)tableView;
@end

@interface FMTableView : UITableView

@property (nonatomic,strong,nullable) NSString *cellModule;
@property (nonatomic,strong,nullable) NSDictionary *model;

@property (nonatomic,assign) id<FMTableViewDelegate> fmDelegate;


@end

