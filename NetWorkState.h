//
//  NetWorkState.h
//  NetWorkState
//
//  Created by 威盛电气 on 2017/6/20.
//  Copyright © 2017年 fzy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"
@protocol NetWorkStateDelegate <NSObject>
@optional
-(void)netWorkStateChanged;
@end




@interface NetWorkState : NSObject
@property(nonatomic , strong)Reachability *conn;
@property(nonatomic,assign)id<NetWorkStateDelegate>delegate;





+ (NetWorkState *)shareMonitorNetWorkState;


- (NSString *)getCurrentNetWorkType;


- (void)addMonitorNetWorkState;


- (BOOL)getNetWorkState;
@end
