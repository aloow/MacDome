//
//  BusinessCellInfo.m
//  SearchDome1
//
//  Created by shaoqing on 2017/6/7.
//  Copyright © 2017年 shaoqing. All rights reserved.
//

#import "BusinessCellInfo.h"

@implementation BusinessCellInfo

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
