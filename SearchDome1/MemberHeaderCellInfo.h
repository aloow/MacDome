//
//  MemberHeaderCellInfo.h
//  SearchDome1
//
//  Created by shaoqing on 2017/6/8.
//  Copyright © 2017年 shaoqing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MemberHeaderCellInfo : NSObject

@property (retain) NSString *type;

-(instancetype)initWithDict:(NSDictionary *)dict;

@end
