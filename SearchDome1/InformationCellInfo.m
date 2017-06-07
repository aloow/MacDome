//
//  InformationCellInfo.m
//  SearchDome1
//
//  Created by shaoqing on 2017/6/7.
//  Copyright © 2017年 shaoqing. All rights reserved.
//

#import "InformationCellInfo.h"

@implementation InformationCellInfo

- (void)dealloc {
    [self.information release];
    [self.fileIconUrl release];
    [self.name release];
    [self.detailsTime release];
    [super dealloc];
}

@end
