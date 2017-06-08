//
//  ScheduleHeaderCellInfo.m
//  SearchDome1
//
//  Created by shaoqing on 2017/6/8.
//  Copyright © 2017年 shaoqing. All rights reserved.
//

#import "ScheduleHeaderCellInfo.h"

@implementation ScheduleHeaderCellInfo

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self == [super init]) {
        self.time = dict[@"time"];
        self.day = dict[@"day"];
        self.dateTime = dict[@"dateTime"];
    }
    return self;
}

- (void)dealloc {
    [self.time release];
    [self.day release];
    [self.dateTime release];
    [super dealloc];
}
@end
