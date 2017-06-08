//
//  ScheduleHeaderCellInfo.h
//  SearchDome1
//
//  Created by shaoqing on 2017/6/8.
//  Copyright © 2017年 shaoqing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScheduleHeaderCellInfo : NSObject

@property (retain) NSString *time;
@property (assign) NSString *day;
@property (assign) NSString *dateTime;

-(instancetype)initWithDict:(NSDictionary *)dict;
@end
