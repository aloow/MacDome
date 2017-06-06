//
//  SBButton.m
//  SearchDome1
//
//  Created by shaoqing on 2017/6/5.
//  Copyright © 2017年 shaoqing. All rights reserved.
//

#import "SBButton.h"

@implementation SBButton

- (void)awakeFromNib
{
    if (self.TextColor)
    {
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        [style setAlignment:NSTextAlignmentCenter];
        NSDictionary *attrsDictionary  = [NSDictionary dictionaryWithObjectsAndKeys:
                                          self.TextColor, NSForegroundColorAttributeName,
                                          self.font, NSFontAttributeName,
                                          style, NSParagraphStyleAttributeName, nil];
        NSAttributedString *attrString = [[NSAttributedString alloc]initWithString:self.title attributes:attrsDictionary];
        [self setAttributedTitle:attrString];
    }
}


- (void)drawRect:(NSRect)dirtyRect
{
    if (self.BGColor)
    {
        // add a background colour
        [self.BGColor setFill];
        NSRectFill(dirtyRect);
    }
    
    [super drawRect:dirtyRect];
}

- (void)setColor:(NSColor*)color {
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setAlignment:NSTextAlignmentCenter];
    NSDictionary *attrsDictionary  = [NSDictionary dictionaryWithObjectsAndKeys:
                                      self.TextColor, NSForegroundColorAttributeName,
                                      self.font, NSFontAttributeName,
                                      style, NSParagraphStyleAttributeName, nil];
    
    NSMutableAttributedString *attrTitle =
    [[NSMutableAttributedString alloc] initWithString:self.title attributes:attrsDictionary];
    NSUInteger len = [attrTitle length];
    NSRange range = NSMakeRange(0, len);
    [attrTitle addAttribute:NSForegroundColorAttributeName value:color range:range];
    [attrTitle fixAttributesInRange:range];
    [self setAttributedTitle:attrTitle];
    
}

@end
