//
//  FMTableViewCell.h
//  FMTableView
//
//  Created by Dimidrol on 06.04.16.
//  Copyright © 2016 FM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCTRootView.h"

@interface FMTableViewCell : UITableViewCell

-(void)configurateCell:(RCTBridge*)bridge;

@end
