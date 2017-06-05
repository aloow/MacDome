//
//  MyWindow.m
//  SearchDome1
//
//  Created by shaoqing on 2017/6/5.
//  Copyright © 2017年 shaoqing. All rights reserved.
//

#import "MyWindow.h"

@implementation MyWindow

- (instancetype)initWithContentRect:(NSRect)contentRect styleMask:(NSWindowStyleMask)style backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag{
    self = [super initWithContentRect:contentRect styleMask:style backing:bufferingType defer:flag];
    if (!self) return nil;
    
    NSLog(@"%s",__func__);
    self.titlebarAppearsTransparent = true;
    self.titleVisibility = NSWindowTitleHidden;
    self.styleMask |= NSWindowStyleMaskFullSizeContentView;
    [self setTitlebarAppearsTransparent:YES];
    
    //可拖拽
    self.movableByWindowBackground = YES;
    return self;
}
@end
