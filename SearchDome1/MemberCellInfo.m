//
//  MemberCellInfo.m
//  SearchDome1
//
//  Created by shaoqing on 2017/6/8.
//  Copyright © 2017年 shaoqing. All rights reserved.
//

#import "MemberCellInfo.h"

@implementation MemberCellInfo

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self == [super init]) {
        self.name = dict[@"name"];
        self.headIconUrl = dict[@"headIconUrl"];
        self.fileIconUrl = dict[@"fileIconUrl"];
    }
    return self;
}

- (void)dealloc {
    [self.name release];
    [self.headIconUrl release];
    [self.fileIconUrl release];
    [super dealloc];
}
@end
