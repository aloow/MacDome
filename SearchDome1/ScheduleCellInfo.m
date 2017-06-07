//
//  ScheduleCellInfo.m
//  SearchDome1
//
//  Created by shaoqing on 2017/6/7.
//  Copyright © 2017年 shaoqing. All rights reserved.
//

#import "ScheduleCellInfo.h"

@implementation ScheduleCellInfo

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self == [super init]) {
        self.schedule = dict[@"schedule"];
        self.dayTime = dict[@"dayTime"];
    }
    return self;
}

- (void)dealloc {
    [self.schedule release];
    [self.dayTime release];
    [super dealloc];
}

@end
