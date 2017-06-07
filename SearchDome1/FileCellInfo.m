//
//  FileCellInfo.m
//  SearchDome1
//
//  Created by shaoqing on 2017/6/7.
//  Copyright © 2017年 shaoqing. All rights reserved.
//

#import "FileCellInfo.h"

@implementation FileCellInfo

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self == [super init]) {
        self.fileIconUrl = dict[@"fileIconUrl"];
        self.fileName = dict[@"fileName"];
        self.detailsTime = dict[@"detailsTime"];
    }
    return self;
}

- (void)dealloc {
    [self.fileIconUrl release];
    [self.fileName release];
    [self.detailsTime release];
    [super dealloc];
}

@end
