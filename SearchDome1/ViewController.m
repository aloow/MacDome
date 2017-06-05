//
//  ViewController.m
//  SearchDome1
//
//  Created by shaoqing on 2017/6/5.
//  Copyright © 2017年 shaoqing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()<NSTextFieldDelegate>

@property (weak) IBOutlet NSVisualEffectView *searchContainView;
@property (weak) IBOutlet NSTextField *searchBarText;
@property (weak) IBOutlet NSImageView *fileTypeImage;

@property (weak) IBOutlet NSButton *memberBnt;
@property (weak) IBOutlet NSButton *businessBnt;
@property (weak) IBOutlet NSButton *scheduleBnt;
@property (weak) IBOutlet NSButton *notesBnt;
@property (weak) IBOutlet NSButton *informationBnt;
@property (weak) IBOutlet NSButton *fileBnt;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    [self setupUI];
//    NSMutableParagraphStyle *pstyle = [NSMutableParagraphStyle new];
//    pstyle.alignment = NSTextAlignmentCenter;
//    _memberBnt.attributedTitle = [[NSAttributedString alloc] initWithString:@"成员" attributes:@{NSForegroundColorAttributeName: NSColor.redColor,NSParagraphStyleAttributeName:pstyle}];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}
#pragma mark - UI
- (void)setupUI {
    //(480,60) (480,60)
    [self.view.window setContentSize:NSMakeSize(480.f, 60.f)];
    //searchContainView border shadow
    _searchBarText.delegate = self;
    [_searchBarText setFocusRingType:NSFocusRingTypeNone];
    //
}

#pragma mark - NSTextFieldDelegate
- (void)controlTextDidBeginEditing:(NSNotification *)obj {

    NSLog(@"%s",__func__);
}

- (void)controlTextDidChange:(NSNotification *)obj {
    NSLog(@"%s",__func__);
    
    
}

- (void)controlTextDidEndEditing:(NSNotification *)obj {
    NSLog(@"%s",__func__);
}
@end
