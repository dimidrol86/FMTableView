//
//  FMTableViewCell.m
//  FMTableView
//
//  Created by Dimidrol on 06.04.16.
//  Copyright © 2016 FM. All rights reserved.
//

#import "FMTableViewCell.h"

@interface FMTableViewCell ()

{
    RCTRootView *_reactView;
}

@end

@implementation FMTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)configurateCell:(RCTBridge*)bridge module:(NSString* _Nonnull)cellModule props:(NSDictionary * _Nullable)props{
    
    _reactView = [[RCTRootView alloc] initWithBridge:bridge moduleName:cellModule initialProperties:props];
    [self.contentView addSubview:_reactView];
    _reactView.frame = self.contentView.frame;
    
    _reactView = nil;
    
}


@end
