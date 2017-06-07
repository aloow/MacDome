//
//  MemberCellInfo.m
//  SearchDome1
//
//  Created by shaoqing on 2017/6/7.
//  Copyright © 2017年 shaoqing. All rights reserved.
//

#import "MemberCellInfo.h"

@implementation MemberCellInfo

- (void)dealloc {
    [self.name release];
    [self.headIconUrl release];
    [self.fileIconUrl release];
    [super dealloc];
}

@end
