//
//  ScheduleCellInfo.h
//  SearchDome1
//
//  Created by shaoqing on 2017/6/7.
//  Copyright © 2017年 shaoqing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScheduleCellInfo : NSObject

@property (retain) NSString *type; //时间 几月几号
@property (retain) NSString *schedule;
@property (retain) NSString *dayTime;

-(instancetype)initWithDict:(NSDictionary *)dict;
@end
