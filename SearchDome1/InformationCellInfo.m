//
//  InformationCellInfo.m
//  SearchDome1
//
//  Created by shaoqing on 2017/6/7.
//  Copyright © 2017年 shaoqing. All rights reserved.
//

#import "InformationCellInfo.h"

@implementation InformationCellInfo

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self == [super init]) {
        self.information = dict[@"information"];
        self.fileIconUrl = dict[@"fileIconUrl"];
        self.name = dict[@"name"];
        self.detailsTime = dict[@"detailsTime"];
    }
    return self;
}

- (void)dealloc {
    [self.information release];
    [self.fileIconUrl release];
    [self.name release];
    [self.detailsTime release];
    [super dealloc];
}

@end
