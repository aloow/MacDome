//
//  NotesCellInfo.h
//  SearchDome1
//
//  Created by shaoqing on 2017/6/7.
//  Copyright © 2017年 shaoqing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NotesCellInfo : NSObject

@property (retain) NSString *notes;

-(instancetype)initWithDict:(NSDictionary *)dict;
@end
