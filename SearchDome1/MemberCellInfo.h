//
//  MemberCellInfo.h
//  SearchDome1
//
//  Created by shaoqing on 2017/6/7.
//  Copyright © 2017年 shaoqing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MemberCellInfo : NSObject

@property (retain) NSString *name;
@property (assign) NSString *headIconUrl;
@property (assign) NSString *fileIconUrl;

-(instancetype)initWithDict:(NSDictionary *)dict;
@end
