//
//  MemberHeaderCellInfo.m
//  SearchDome1
//
//  Created by shaoqing on 2017/6/8.
//  Copyright © 2017年 shaoqing. All rights reserved.
//

#import "MemberHeaderCellInfo.h"

@implementation MemberHeaderCellInfo
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self == [super init]) {
        self.type = dict[@"type"];
    }
    return self;
}

- (void)dealloc {
    [self.type release];
    [super dealloc];
}
@end
