//
//  BusinessCellInfo.m
//  SearchDome1
//
//  Created by shaoqing on 2017/6/7.
//  Copyright © 2017年 shaoqing. All rights reserved.
//

#import "BusinessCellInfo.h"

@implementation BusinessCellInfo

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self == [super init]) {
        self.progressType = dict[@"progressType"];
        self.department = dict[@"department"];
        self.date = dict[@"date"];
        self.name = dict[@"name"];
        self.fileIconUrl = dict[@"fileIconUrl"];
        self.chargeName = dict[@"chargeName"];
        self.detailsTime = dict[@"detailsTime"];
    }
    return self;
}

- (void)dealloc {
    [self.progressType release];
    [self.department release];
    [self.date release];
    [self.name release];
    [self.fileIconUrl release];
    [self.chargeName release];
    [self.detailsTime release];
    [super dealloc];
}

@end
