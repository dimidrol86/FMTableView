//
//  FMManager.h
//  FMTableView
//
//  Created by Dimidrol on 14.04.16.
//  Copyright © 2016 FM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCTBridgeModule.h"

@interface FMManager : NSObject <RCTBridgeModule>

@property(nullable,strong,nonatomic) RCTBridge *bridge;

+(instancetype _Nonnull)sharedManager;


@end
