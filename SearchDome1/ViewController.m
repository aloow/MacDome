//
//  ViewController.m
//  SearchDome1
//
//  Created by shaoqing on 2017/6/5.
//  Copyright © 2017年 shaoqing. All rights reserved.
//

#import "ViewController.h"
#import "SBButton.h"

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

@property (assign) IBOutlet SBButton *memberBnt;
@property (assign) IBOutlet SBButton *businessBnt;
@property (assign) IBOutlet SBButton *scheduleBnt;
@property (assign) IBOutlet SBButton *notesBnt;
@property (assign) IBOutlet SBButton *informationBnt;
@property (assign) IBOutlet SBButton *fileBnt;

@property (assign) IBOutlet NSBox *memberLine;
@property (assign) IBOutlet NSBox *businessLine;
@property (assign) IBOutlet NSBox *scheduleLine;
@property (assign) IBOutlet NSBox *notesLine;
@property (assign) IBOutlet NSBox *informationLine;
@property (assign) IBOutlet NSBox *fileLine;

@property (assign) CellType cellType;
@property (retain) NSMutableArray *tableviewCellArray;

@end

@implementation ViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
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
- (void)getDataFromType:(CellType)cellType {
    if (!self.tableviewCellArray) {
        self.tableviewCellArray = [NSMutableArray array];
    } else {
        [self.tableviewCellArray removeAllObjects];
    }
    
    switch (cellType) {
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
    [self.tableView reloadData];
}

- (void)setupUI {
    [self setWindowSize:NSMakeSize(480.f, 60.f)];
    self.searchBarText.delegate = self;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.identifier = MemberCell;
    self.cellType = 1;
    _searchBarText.delegate = self;
    [_searchBarText setFocusRingType:NSFocusRingTypeNone];
}

#pragma mark - User Even
- (IBAction)reloadTableViewBntTap:(SBButton *)sender {
    
    [self.memberBnt setColor:[NSColor blackColor]];
    [self.businessBnt setColor:[NSColor blackColor]];
    [self.scheduleBnt setColor:[NSColor blackColor]];
    [self.notesBnt setColor:[NSColor blackColor]];
    [self.informationBnt setColor:[NSColor blackColor]];
    [self.fileBnt setColor:[NSColor blackColor]];
    self.memberLine.fillColor = [NSColor clearColor];
    self.businessLine.fillColor = [NSColor clearColor];
    self.scheduleLine.fillColor = [NSColor clearColor];
    self.notesLine.fillColor = [NSColor clearColor];
    self.informationLine.fillColor = [NSColor clearColor];
    self.fileLine.fillColor = [NSColor clearColor];
    
    switch (sender.tag) {
        case 101:
            self.memberLine.fillColor = [NSColor colorWithCGColor:CGColorCreateGenericRGB(255.0/255, 152.0/255, 25.0/255, 1.f)];
            self.cellType = MemberTap;
            break;
        case 102:
            self.businessLine.fillColor = [NSColor colorWithCalibratedRed:255.0/255 green:152.0/255 blue:25.0/255 alpha:1.f];
            self.cellType = BusinessTap;
            break;
        case 103:
            self.scheduleLine.fillColor = [NSColor colorWithCalibratedRed:255.0/255 green:152.0/255 blue:25.0/255 alpha:1.f];
            self.cellType = ScheduleTap;
            break;
        case 104:
            self.notesLine.fillColor = [NSColor colorWithCalibratedRed:255.0/255 green:152.0/255 blue:25.0/255 alpha:1.f];
            self.cellType = NotesTap;
            break;
        case 105:
            self.informationLine.fillColor = [NSColor colorWithCalibratedRed:255.0/255 green:152.0/255 blue:25.0/255 alpha:1.f];
            self.cellType = InformationTap;
            break;
        case 106:
            self.fileLine.fillColor = [NSColor colorWithCalibratedRed:255.0/255 green:152.0/255 blue:25.0/255 alpha:1.f];
            self.cellType = FileTap;
            break;
        default:
            break;
    }
    [sender setColor:[NSColor colorWithCGColor:CGColorCreateGenericRGB(255.0/255, 152.0/255, 25.0/255, 1.f)]];
    [self getDataFromType:self.cellType];
}
#pragma mark - NSTableViewDataSource
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.tableviewCellArray.count;
}

#pragma mark - NSTableViewDelegate
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    NSTableCellView *cell = nil;
    switch (self.cellType) {
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
    if ([self.tableviewCellArray[row] isKindOfClass:[MemberHeaderCellInfo class]] || [self.tableviewCellArray[row] isKindOfClass:[ScheduleHeaderCellInfo class]]) {
        return NO;
    }
    return YES;
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    switch (self.cellType) {
        case 1:
            if ([self.tableviewCellArray[row] isKindOfClass:[MemberHeaderCellInfo class]]) {
                return 23;
            } else {
                return 41.f;
            }
            break;
        case 2: return 45.f; break;
        case 3:
            if ([self.tableviewCellArray[row] isKindOfClass:[ScheduleHeaderCellInfo class]]) {
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
    
    if ([self.tableviewCellArray[index] isKindOfClass:[MemberHeaderCellInfo class]]) {
        NSTableCellView* cell = [tableView makeViewWithIdentifier:MemberHeaderCell owner:self];
        MemberHeaderCellInfo *entity = self.tableviewCellArray[index];
        NSTextField *type = [cell viewWithTag:101];
        type.stringValue = entity.type;
        return cell;
    }
    
    NSTableCellView* cell = [tableView makeViewWithIdentifier:cellIdentifier owner:self];
    MemberCellInfo *entity = self.tableviewCellArray[index];
    
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
    BusinessCellInfo *entity = self.tableviewCellArray[index];
    
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
    
    if ([self.tableviewCellArray[index] isKindOfClass:[ScheduleHeaderCellInfo class]]) {
        NSTableCellView* cell = [tableView makeViewWithIdentifier:ScheduleHeader owner:self];
        ScheduleHeaderCellInfo *entity = self.tableviewCellArray[index];
        
        NSTextField *time = [cell viewWithTag:101];
        time.stringValue = entity.time;
        
        NSTextField *day = [cell viewWithTag:102];
        day.stringValue = entity.day;
        
        NSTextField *dateTime = [cell viewWithTag:103];
        dateTime.stringValue = entity.dateTime;
        return cell;
    }
    
    NSTableCellView* cell = [tableView makeViewWithIdentifier:cellIdentifier owner:self];
    ScheduleCellInfo *entity = self.tableviewCellArray[index];
    
    NSTextField *schedule = [cell viewWithTag:101];
    schedule.stringValue = entity.schedule;
    
    NSTextField *dayTime = [cell viewWithTag:102];
    dayTime.stringValue = entity.dayTime;
    return cell;
}

- (NSTableCellView *)configureNotesCell:(NSTableView*)tableView WithcellID:(NSString *)cellIdentifier row:(NSInteger)index{
    NSTableCellView* cell = [tableView makeViewWithIdentifier:cellIdentifier owner:self];
    NotesCellInfo *entity = self.tableviewCellArray[index];
    
    NSTextField *notes = [cell viewWithTag:101];
    notes.stringValue = entity.notes;
    return cell;
}

- (NSTableCellView *)configureInformationCell:(NSTableView*)tableView WithcellID:(NSString *)cellIdentifier row:(NSInteger)index{
    NSTableCellView* cell = [tableView makeViewWithIdentifier:cellIdentifier owner:self];
    InformationCellInfo *entity = self.tableviewCellArray[index];
    
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
    FileCellInfo *entity = self.tableviewCellArray[index];
    
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
        [self getDataFromType:self.cellType];
    } else {
        [self setWindowSize:NSMakeSize(480.f, 60.f)];
        [self.tableviewCellArray removeAllObjects];
    }
}

- (BOOL)control:(NSControl*)control textView:(NSTextView*)textView doCommandBySelector:(SEL)commandSelector
{
    BOOL result = NO;
    if (self.tableviewCellArray.count == 0) return NO;
    
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
        self.cellType = self.cellType < 6 ? self.cellType + 1 : 1;
        switch (self.cellType) {
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
        
        NSInteger newInteger = [self.tableView selectedRow] < (NSInteger)self.tableviewCellArray.count ? [self.tableView selectedRow] + 1: [self.tableView selectedRow];
        NSIndexSet *newIndexSet = [NSIndexSet indexSetWithIndex:newInteger];
        [self.tableView selectRowIndexes:newIndexSet byExtendingSelection:NO];
        
        result = YES;
    }
    return result;
}
#pragma mark - Tool
- (void)originalTextField:(NSTextField*)orgTextField targetString:(NSString*)tarString setColor:(NSColor*)color {
    NSRange range = [orgTextField.stringValue rangeOfString:tarString];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:orgTextField.stringValue];
    NSDictionary *attrsDictionary  = [NSDictionary dictionaryWithObjectsAndKeys:[NSColor redColor], NSForegroundColorAttributeName, nil];
    [attrStr addAttributes:attrsDictionary range:range];
    [orgTextField setAttributedStringValue:attrStr];
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
    [self.tableviewCellArray release];
    [super dealloc];
}
@end
