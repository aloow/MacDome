//
//  SBButton.h
//  SearchDome1
//
//  Created by shaoqing on 2017/6/5.
//  Copyright © 2017年 shaoqing. All rights reserved.
//

#import <Cocoa/Cocoa.h>
IB_DESIGNABLE
@interface SBButton : NSButton

@property (nonatomic, strong) IBInspectable NSColor *BGColor;
@property (nonatomic, strong) IBInspectable NSColor *TextColor;

- (void)setColor:(NSColor*)color;

@end
