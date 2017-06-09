//
//  ViewControllerModel.h
//  SearchDome1
//
//  Created by shaoqing on 2017/6/9.
//  Copyright © 2017年 shaoqing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MemberCellInfo.h"
#import "BusinessCellInfo.h"
#import "ScheduleCellInfo.h"
#import "NotesCellInfo.h"
#import "InformationCellInfo.h"
#import "FileCellInfo.h"
#import "MemberHeaderCellInfo.h"
#import "ScheduleHeaderCellInfo.h"

typedef NS_ENUM(NSUInteger, CellType) {
  MemberTap = 1,
  BusinessTap,
  ScheduleTap,
  NotesTap,
  InformationTap,
  FileTap
};

@interface ViewControllerModel : NSObject

@property (retain) NSString *keyWords;
@property (assign) CellType cellType;
@property (retain) NSMutableArray *tableviewCellArray;

- (void)changeCellArrayfromKeyWords:(NSString*)keywords;
@end
