//
//  NotesCellInfo.m
//  SearchDome1
//
//  Created by shaoqing on 2017/6/7.
//  Copyright © 2017年 shaoqing. All rights reserved.
//

#import "NotesCellInfo.h"

@implementation NotesCellInfo

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self == [super init]) {
        self.notes = dict[@"notes"];
    }
    return self;
}

- (void)dealloc {
    [self.notes release];
    [super dealloc];
}

@end
