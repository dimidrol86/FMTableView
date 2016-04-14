//
//  FMManager.h
//  FMTableView
//
//  Created by Dimidrol on 14.04.16.
//  Copyright © 2016 FM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCTRootView.h"

@interface FMManager : NSObject

@property(nullable,strong,nonatomic) RCTBridge *bridge;

+(instancetype _Nonnull)sharedManager;


@end
