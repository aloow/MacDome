//
//  InformationCellInfo.h
//  SearchDome1
//
//  Created by shaoqing on 2017/6/7.
//  Copyright © 2017年 shaoqing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InformationCellInfo : NSObject

@property (retain) NSString *information;
@property (retain) NSString *fileIconUrl;
@property (retain) NSString *name;
@property (retain) NSString *detailsTime;
//@property (retain) NSString *dateTime;
//@property (retain) NSString *dayTime;

-(instancetype)initWithDict:(NSDictionary *)dict;
@end
