//
//  NotesCellInfo.m
//  SearchDome1
//
//  Created by shaoqing on 2017/6/7.
//  Copyright © 2017年 shaoqing. All rights reserved.
//

#import "NotesCellInfo.h"

@implementation NotesCellInfo

- (void)dealloc {
    [self.notes release];
    [super dealloc];
}

@end
