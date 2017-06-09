//
//  ViewController.m
//  SearchDome1
//
//  Created by shaoqing on 2017/6/5.
//  Copyright © 2017年 shaoqing. All rights reserved.
/**
成员：https://yun.115.com/api/1.0/web/1.0/5/contact/get_all_list?keyword=

 **/

#import "ViewController.h"
#import "ViewControllerModel.h"

static NSString *MemberCell = @"memberCellID";
static NSString *BusinessCell = @"businessCellID";
static NSString *ScheduleCell = @"scheduleCellID";
static NSString *NotesCell = @"notesCellID";
static NSString *InformationCell = @"informationCellID";
static NSString *FileCell = @"fileCellID";
static NSString *MemberHeaderCell = @"memberHeaderCellID";
static NSString *ScheduleHeader = @"scheduleHeaderCellID";

@interface ViewController()<NSTextFieldDelegate,NSTableViewDelegate,NSTableViewDataSource>
@property (assign) IBOutlet NSBox *seatchContainBox;

@property (assign) IBOutlet NSTableView *tableView;
@property (assign) IBOutlet NSTextField *searchBarText;

@property (assign) IBOutlet NSBox *cellContainView;
@property (assign) IBOutlet NSTextField *promptLabel;

@property (assign) IBOutlet NSButton *memberBnt;
@property (assign) IBOutlet NSButton *businessBnt;
@property (assign) IBOutlet NSButton *scheduleBnt;
@property (assign) IBOutlet NSButton *notesBnt;
@property (assign) IBOutlet NSButton *informationBnt;
@property (assign) IBOutlet NSButton *fileBnt;

@property (assign) IBOutlet NSBox *memberLine;
@property (assign) IBOutlet NSBox *businessLine;
@property (assign) IBOutlet NSBox *scheduleLine;
@property (assign) IBOutlet NSBox *notesLine;
@property (assign) IBOutlet NSBox *informationLine;
@property (assign) IBOutlet NSBox *fileLine;

@property (retain) ViewControllerModel *viewControllerModel;
@end

@implementation ViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
  [super viewDidLoad];
  self.viewControllerModel = [ViewControllerModel new];
  [self.viewControllerModel addObserver:self forKeyPath:@"cellType" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
  [self.viewControllerModel addObserver:self forKeyPath:@"keyWords" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)viewWillAppear {
    [super viewWillAppear];
    [self setupUI];
}
- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}
#pragma mark - UI & Data
- (void)setupUI {
  [self setWindowSize:NSMakeSize(480.f, 60.f)];
  self.searchBarText.delegate = self;
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  self.identifier = MemberCell;
  self.viewControllerModel.cellType = 1;
  [_searchBarText setFocusRingType:NSFocusRingTypeNone];
}

#pragma mark - User Even
- (IBAction)reloadTableViewBntTap:(NSButton *)sender {
    
  [self setButton:self.memberBnt toColor:[NSColor blackColor]];
  [self setButton:self.businessBnt toColor:[NSColor blackColor]];
  [self setButton:self.scheduleBnt toColor:[NSColor blackColor]];
  [self setButton:self.notesBnt toColor:[NSColor blackColor]];
  [self setButton:self.informationBnt toColor:[NSColor blackColor]];
  [self setButton:self.fileBnt toColor:[NSColor blackColor]];
  self.memberLine.fillColor = [NSColor clearColor];
  self.businessLine.fillColor = [NSColor clearColor];
  self.scheduleLine.fillColor = [NSColor clearColor];
  self.notesLine.fillColor = [NSColor clearColor];
  self.informationLine.fillColor = [NSColor clearColor];
  self.fileLine.fillColor = [NSColor clearColor];
    
    switch (sender.tag) {
        case 101:
            self.memberLine.fillColor = [NSColor colorWithCGColor:CGColorCreateGenericRGB(255.0/255, 152.0/255, 25.0/255, 1.f)];
            self.viewControllerModel.cellType = MemberTap;
            break;
        case 102:
            self.businessLine.fillColor = [NSColor colorWithCalibratedRed:255.0/255 green:152.0/255 blue:25.0/255 alpha:1.f];
            self.viewControllerModel.cellType = BusinessTap;
            break;
        case 103:
            self.scheduleLine.fillColor = [NSColor colorWithCalibratedRed:255.0/255 green:152.0/255 blue:25.0/255 alpha:1.f];
            self.viewControllerModel.cellType = ScheduleTap;
            break;
        case 104:
            self.notesLine.fillColor = [NSColor colorWithCalibratedRed:255.0/255 green:152.0/255 blue:25.0/255 alpha:1.f];
            self.viewControllerModel.cellType = NotesTap;
            break;
        case 105:
            self.informationLine.fillColor = [NSColor colorWithCalibratedRed:255.0/255 green:152.0/255 blue:25.0/255 alpha:1.f];
            self.viewControllerModel.cellType = InformationTap;
            break;
        case 106:
            self.fileLine.fillColor = [NSColor colorWithCalibratedRed:255.0/255 green:152.0/255 blue:25.0/255 alpha:1.f];
            self.viewControllerModel.cellType = FileTap;
            break;
        default:
            break;
    }
  [self setButton:sender toColor:[NSColor colorWithCGColor:CGColorCreateGenericRGB(255.0/255, 152.0/255, 25.0/255, 1.f)]];
}
#pragma mark - NSTableViewDataSource
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.viewControllerModel.tableviewCellArray.count;
}

#pragma mark - NSTableViewDelegate
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    NSTableCellView *cell = nil;
    switch (self.viewControllerModel.cellType) {
        case 1:
            cell = [self configureMemberCell:tableView WithcellID:MemberCell row:row];
            break;
        case 2:
            cell = [self configureBusinessCell:tableView WithcellID:BusinessCell row:row];
            break;
        case 3:
            cell = [self configureScheduleCell:tableView WithcellID:ScheduleCell row:row];
            break;
        case 4:
            cell = [self configureNotesCell:tableView WithcellID:NotesCell row:row];
            break;
        case 5:
            cell = [self configureInformationCell:tableView WithcellID:InformationCell row:row];
            break;
        case 6:
            cell = [self configureFileCell:tableView WithcellID:FileCell row:row];
            break;
        default:
            return nil;
            break;
    }
    NSArray *views = cell.subviews;
    for ( NSView *view in views) {
        if ([view isKindOfClass:[NSTextField class]]) {
            [self originalTextField:(NSTextField*)view targetString:self.searchBarText.stringValue setColor:[NSColor redColor]];
        }
    }
    return cell;
}

- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row {
    if ([self.viewControllerModel.tableviewCellArray[row] isKindOfClass:[MemberHeaderCellInfo class]] || [self.viewControllerModel.tableviewCellArray[row] isKindOfClass:[ScheduleHeaderCellInfo class]]) {
        return NO;
    }
    return YES;
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    switch (self.viewControllerModel.cellType) {
        case 1:
            if ([self.viewControllerModel.tableviewCellArray[row] isKindOfClass:[MemberHeaderCellInfo class]]) {
                return 23;
            } else {
                return 41.f;
            }
            break;
        case 2: return 45.f; break;
        case 3:
            if ([self.viewControllerModel.tableviewCellArray[row] isKindOfClass:[ScheduleHeaderCellInfo class]]) {
                return 23;
            } else {
                return 44.f;
            }
            break;
        case 4: return 33.f; break;
        case 5: return 53.f; break;
        case 6: return 49.f; break;
        default:
            break;
    }
    return 10.0f;
}
#pragma mark - Configure Cell
- (NSTableCellView *)configureMemberCell:(NSTableView*)tableView WithcellID:(NSString *)cellIdentifier row:(NSInteger)index{
    
    if ([self.viewControllerModel.tableviewCellArray[index] isKindOfClass:[MemberHeaderCellInfo class]]) {
        NSTableCellView* cell = [tableView makeViewWithIdentifier:MemberHeaderCell owner:self];
        MemberHeaderCellInfo *entity = self.viewControllerModel.tableviewCellArray[index];
        NSTextField *type = [cell viewWithTag:101];
        type.stringValue = entity.type;
        return cell;
    }
    
    NSTableCellView* cell = [tableView makeViewWithIdentifier:cellIdentifier owner:self];
    MemberCellInfo *entity = self.viewControllerModel.tableviewCellArray[index];
    
    NSImageView *headIcon = [cell viewWithTag:101];
    headIcon.image = [[NSImage alloc]initWithContentsOfURL:[NSURL URLWithString:entity.headIconUrl]];
    
    NSTextField *nameTextFiel = [cell viewWithTag:102];
    nameTextFiel.stringValue = entity.name;
    
    NSImageView *fileIcon = [cell viewWithTag:103];
    fileIcon.image = [[NSImage alloc]initWithContentsOfURL:[NSURL URLWithString:entity.fileIconUrl]];
    return cell;
}

- (NSTableCellView *)configureBusinessCell:(NSTableView*)tableView WithcellID:(NSString *)cellIdentifier row:(NSInteger)index{
    NSTableCellView* cell = [tableView makeViewWithIdentifier:cellIdentifier owner:self];
    BusinessCellInfo *entity = self.viewControllerModel.tableviewCellArray[index];
    
    //进行 ...略
    NSTextField *progressType = [cell viewWithTag:101];
    progressType.stringValue = @"进\n行";
//    progressType.stringValue = entity.progressType;
    
    NSTextField *department = [cell viewWithTag:102];
    department.stringValue = entity.department;
    
    NSTextField *date = [cell viewWithTag:103];
    date.stringValue = entity.date;
    
    NSTextField *name = [cell viewWithTag:104];
    name.stringValue = entity.name;
    
    NSImageView *fileIcon = [cell viewWithTag:105];
    fileIcon.image = [[NSImage alloc]initWithContentsOfURL:[NSURL URLWithString:entity.fileIconUrl]];
    
    NSTextField *chargeName = [cell viewWithTag:106];
    chargeName.stringValue = entity.chargeName;
    
    NSTextField *detailsTime = [cell viewWithTag:107];
    detailsTime.stringValue = entity.detailsTime;
    return cell;
}

- (NSTableCellView *)configureScheduleCell:(NSTableView*)tableView WithcellID:(NSString *)cellIdentifier row:(NSInteger)index{
    
    if ([self.viewControllerModel.tableviewCellArray[index] isKindOfClass:[ScheduleHeaderCellInfo class]]) {
        NSTableCellView* cell = [tableView makeViewWithIdentifier:ScheduleHeader owner:self];
        ScheduleHeaderCellInfo *entity = self.viewControllerModel.tableviewCellArray[index];
        
        NSTextField *time = [cell viewWithTag:101];
        time.stringValue = entity.time;
        
        NSTextField *day = [cell viewWithTag:102];
        day.stringValue = entity.day;
        
        NSTextField *dateTime = [cell viewWithTag:103];
        dateTime.stringValue = entity.dateTime;
        return cell;
    }
    
    NSTableCellView* cell = [tableView makeViewWithIdentifier:cellIdentifier owner:self];
    ScheduleCellInfo *entity = self.viewControllerModel.tableviewCellArray[index];
    
    NSTextField *schedule = [cell viewWithTag:101];
    schedule.stringValue = entity.schedule;
    
    NSTextField *dayTime = [cell viewWithTag:102];
    dayTime.stringValue = entity.dayTime;
    return cell;
}

- (NSTableCellView *)configureNotesCell:(NSTableView*)tableView WithcellID:(NSString *)cellIdentifier row:(NSInteger)index{
    NSTableCellView* cell = [tableView makeViewWithIdentifier:cellIdentifier owner:self];
    NotesCellInfo *entity = self.viewControllerModel.tableviewCellArray[index];
    
    NSTextField *notes = [cell viewWithTag:101];
    notes.stringValue = entity.notes;
    return cell;
}

- (NSTableCellView *)configureInformationCell:(NSTableView*)tableView WithcellID:(NSString *)cellIdentifier row:(NSInteger)index{
    NSTableCellView* cell = [tableView makeViewWithIdentifier:cellIdentifier owner:self];
    InformationCellInfo *entity = self.viewControllerModel.tableviewCellArray[index];
    
    NSTextField *information = [cell viewWithTag:101];
    information.stringValue = entity.information;
    
    NSImageView *fileIcon = [cell viewWithTag:102];
    fileIcon.image = [[NSImage alloc]initWithContentsOfURL:[NSURL URLWithString:entity.fileIconUrl]];
    
    NSTextField *name = [cell viewWithTag:103];
    name.stringValue = entity.name;
    
    NSTextField *detailsTime = [cell viewWithTag:104];
    detailsTime.stringValue = entity.detailsTime;
    return cell;
}

- (NSTableCellView *)configureFileCell:(NSTableView*)tableView WithcellID:(NSString *)cellIdentifier row:(NSInteger)index{
    NSTableCellView* cell = [tableView makeViewWithIdentifier:cellIdentifier owner:self];
    FileCellInfo *entity = self.viewControllerModel.tableviewCellArray[index];
    
    NSImageView *fileIcon = [cell viewWithTag:101];
    fileIcon.image = [[NSImage alloc]initWithContentsOfURL:[NSURL URLWithString:entity.fileIconUrl]];
    
    NSTextField *fileName = [cell viewWithTag:102];
    fileName.stringValue = entity.fileName;
    
    NSTextField *detailsTime = [cell viewWithTag:103];
    detailsTime.stringValue = entity.detailsTime;
    return cell;
}

#pragma mark - NSTextFieldDelegate
- (void)controlTextDidChange:(NSNotification *)obj {
    if (obj.object == self.searchBarText && self.searchBarText.stringValue.length != 0) {
        [self setWindowSize:NSMakeSize(480.f, 400.f)];
        //get Date & reflush tableview
      self.viewControllerModel.keyWords = self.searchBarText.stringValue;
    } else {
      [self setWindowSize:NSMakeSize(480.f, 60.f)];
      [self.viewControllerModel.tableviewCellArray removeAllObjects];
    }
}

- (BOOL)control:(NSControl*)control textView:(NSTextView*)textView doCommandBySelector:(SEL)commandSelector
{
    BOOL result = NO;
    if (self.viewControllerModel.tableviewCellArray.count == 0) return NO;
    
    if (commandSelector == @selector(insertNewline:))
    {
        // new line action:
        NSLog(@"Return tap");
//        [textView insertNewlineIgnoringFieldEditor:self];
        result = YES;
    }
    else if (commandSelector == @selector(insertTab:))
    {
        // tab action:
        self.viewControllerModel.cellType = self.viewControllerModel.cellType < 6 ? self.viewControllerModel.cellType + 1 : 1;
        switch (self.viewControllerModel.cellType) {
            case 1: [self reloadTableViewBntTap:self.memberBnt];     break;
            case 2: [self reloadTableViewBntTap:self.businessBnt];   break;
            case 3: [self reloadTableViewBntTap:self.scheduleBnt];   break;
            case 4: [self reloadTableViewBntTap:self.notesBnt];      break;
            case 5: [self reloadTableViewBntTap:self.informationBnt];break;
            case 6: [self reloadTableViewBntTap:self.fileBnt];       break;
            default:
                break;
        }
//        [textView insertTabIgnoringFieldEditor:self];
        result = YES;
    }
    if( commandSelector == @selector(moveUp:) ){
        
        NSInteger newInteger = [self.tableView selectedRow] == 0 ? 0: [self.tableView selectedRow] - 1;
        NSIndexSet *newIndexSet = [NSIndexSet indexSetWithIndex:newInteger];
        [self.tableView selectRowIndexes:newIndexSet byExtendingSelection:NO];
        result = YES;
    }
    if( commandSelector == @selector(moveDown:) ){
        
        NSInteger newInteger = [self.tableView selectedRow] < (NSInteger)self.viewControllerModel.tableviewCellArray.count ? [self.tableView selectedRow] + 1: [self.tableView selectedRow];
        NSIndexSet *newIndexSet = [NSIndexSet indexSetWithIndex:newInteger];
        [self.tableView selectRowIndexes:newIndexSet byExtendingSelection:NO];
        
        result = YES;
      
    }
    return result;
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
  if ([keyPath isEqualToString:@"cellType"] && object == self.viewControllerModel) {
    [self.viewControllerModel changeCellArrayfromKeyWords:self.searchBarText.stringValue];
    [self.tableView reloadData];
  }
  if ([keyPath isEqualToString:@"keyWords"] && object == self.viewControllerModel) {
    [self.viewControllerModel changeCellArrayfromKeyWords:self.searchBarText.stringValue];
    [self.tableView reloadData];
  }
}

#pragma mark - Tool
- (void)originalTextField:(NSTextField*)orgTextField targetString:(NSString*)tarString setColor:(NSColor*)color {
    NSRange range = [orgTextField.stringValue rangeOfString:tarString];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:orgTextField.stringValue];
    NSDictionary *attrsDictionary  = [NSDictionary dictionaryWithObjectsAndKeys:[NSColor redColor], NSForegroundColorAttributeName, nil];
    [attrStr addAttributes:attrsDictionary range:range];
    [orgTextField setAttributedStringValue:attrStr];
}

- (void)setButton:(NSButton*)targetBnt toColor:(NSColor*)color {
  NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
  [style setAlignment:NSTextAlignmentCenter];
  NSDictionary *attrsDictionary  = [NSDictionary dictionaryWithObjectsAndKeys:
                                    color, NSForegroundColorAttributeName,
                                    targetBnt.font, NSFontAttributeName,
                                    style, NSParagraphStyleAttributeName, nil];
  
  NSMutableAttributedString *attrTitle =
  [[NSMutableAttributedString alloc] initWithString:targetBnt.title attributes:attrsDictionary];
  NSUInteger len = [attrTitle length];
  NSRange range = NSMakeRange(0, len);
  [attrTitle addAttribute:NSForegroundColorAttributeName value:color range:range];
  [attrTitle fixAttributesInRange:range];
  [targetBnt setAttributedTitle:attrTitle];
  
}

- (void)setWindowSize:(NSSize)size {
    NSRect originalFrame = [self.view.window frame];
    NSSize originalSize = originalFrame.size;
    NSPoint originalPoint = originalFrame.origin;
    
    CGFloat newWidth = size.width;
    CGFloat newHight = size.height;
    
    CGFloat newX = originalPoint.x;
    CGFloat newY = originalPoint.y + (originalSize.height - newHight);

    [self.view.window setFrame:NSMakeRect(newX, newY, newWidth, newHight) display:YES animate:YES];
}

#pragma mark - dealloc
- (void)dealloc {
    [self.viewControllerModel.tableviewCellArray release];
    [super dealloc];
}
@end
