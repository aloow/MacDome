//
//  ViewControllerModel.m
//  SearchDome1
//
//  Created by shaoqing on 2017/6/9.
//  Copyright © 2017年 shaoqing. All rights reserved.
//

#import "ViewControllerModel.h"


@interface ViewControllerModel ()

@end

@implementation ViewControllerModel

- (void)changeCellArrayfromKeyWords:(NSString*)keywords {

  if (!self.tableviewCellArray) {
    self.tableviewCellArray = [NSMutableArray array];
  } else {
    [self.tableviewCellArray removeAllObjects];
  }
  
  switch (self.cellType) {
    case MemberTap:
      for (int i = 0; i < 10; i ++) {
        if (i == 0) {
          [self.tableviewCellArray addObject:[[MemberHeaderCellInfo alloc] initWithDict:@{@"type":@"成员"}]];
          continue;
        }
        if (i == 5) {
          [self.tableviewCellArray addObject:[[MemberHeaderCellInfo alloc] initWithDict:@{@"type":@"群聊"}]];
          continue;
        }
        [self.tableviewCellArray addObject:[[MemberCellInfo alloc] initWithDict:@{@"name":@"小五小三0123456789",@"headIconUrl":@"http://news.xinhuanet.com/travel/2014-06/12/126610717_14025522740001n.jpg",@"fileIconUrl":@"http://news.xinhuanet.com/travel/2014-06/12/126610717_14025522740621n.jpg"}]];
        
      }
      break;
    case BusinessTap:
      for (int i = 0; i < 14; i ++) {
        [self.tableviewCellArray addObject:[[BusinessCellInfo alloc] initWithDict:@{@"progressType":@"进",@"department":@"[周报][产品中心][产品部]",@"date":@"(2月3日-2月4日)",@"name":@"小五小",@"fileIconUrl":@"http://news.xinhuanet.com/travel/2014-06/12/126610717_14025522740001n.jpg",@"chargeName":@"王大锤",@"detailsTime":@"05-12 18:00"}]];
      }
      break;
    case ScheduleTap:
      for (int i = 0; i < 20; i ++) {
        if (i == 0) {
          [self.tableviewCellArray addObject:[[ScheduleHeaderCellInfo alloc] initWithDict:@{@"time":@"02-15",@"day":@"周一",@"dateTime":@"正月十九"}]];
          continue;
        }
        if (i == 4) {
          [self.tableviewCellArray addObject:[[ScheduleHeaderCellInfo alloc] initWithDict:@{@"time":@"08-15",@"day":@"周日",@"dateTime":@"三月十九"}]];
          continue;
        }
        if (i == 9) {
          [self.tableviewCellArray addObject:[[ScheduleHeaderCellInfo alloc] initWithDict:@{@"time":@"07-15",@"day":@"周一",@"dateTime":@"四月十九"}]];
          continue;
        }
        [self.tableviewCellArray addObject:[[ScheduleCellInfo alloc] initWithDict:@{@"schedule":@"小五更新浏览器、电脑版本内测包",@"dayTime":@"18:00"}]];
      }
      break;
    case NotesTap:
      for (int i = 0; i < 7; i ++) {
        [self.tableviewCellArray addObject:[[NotesCellInfo alloc] initWithDict:@{@"notes":@"小五更新浏览器、电脑版本内测包"}]];
      }
      break;
    case InformationTap:
      for (int i = 0; i < 3; i ++) {
        [self.tableviewCellArray addObject:[[InformationCellInfo alloc] initWithDict:@{@"information":@"小五更新浏览器、电脑版本内测包",@"fileIconUrl":@"http://news.xinhuanet.com/travel/2014-06/12/126610717_14025522740001n.jpg",@"name":@"李小白",@"detailsTime":@"02-12 18:00"}]];
      }
      break;
    case FileTap:
      for (int i = 0; i < 5; i ++) {
        [self.tableviewCellArray addObject:[[FileCellInfo alloc] initWithDict:@{@"fileIconUrl":@"http://news.xinhuanet.com/travel/2014-06/12/126610717_14025522740001n.jpg",@"detailsTime":@"02-12 18:00",@"fileName":@"小文件夹"}]];
      }
      break;
    default:
      break;
  }
  
}

#pragma mark - Get & Set
- (void)dealloc {
  [self.keyWords release];
  [self.tableviewCellArray release];
  [super dealloc];
}
@end
