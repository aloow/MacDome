//
//  FileCellInfo.m
//  SearchDome1
//
//  Created by shaoqing on 2017/6/7.
//  Copyright © 2017年 shaoqing. All rights reserved.
//

#import "FileCellInfo.h"

@implementation FileCellInfo

- (void)dealloc {
    [self.fileIconUrl release];
    [self.fileName release];
    [self.detailsTime release];
    [super dealloc];
}

@end
