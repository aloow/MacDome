//
//  MemberCellInfo.m
//  SearchDome1
//
//  Created by shaoqing on 2017/6/8.
//  Copyright © 2017年 shaoqing. All rights reserved.
//

#import "MemberCellInfo.h"

@implementation MemberCellInfo

//+ (NSArray*)arrayByJSONString:(NSString*)jsonString {
//  NSError* error = nil;
//  NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
//  NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
//  if (dic && !error) {
//    NSMutableArray *mArray = [NSMutableArray array];
//    [mArray retain];
//    NSArray *array = [NSArray array];
//    [array retain];
//    array = dic[@"data"][@""];
//  }
//  
//  
//  MemberCellInfo *entity = [[MemberCellInfo alloc] initWithDict:@{}];
//  
//  [array release];
//  return mArray;
//}

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
