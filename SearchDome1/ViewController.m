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

typedef NS_ENUM(NSUInteger, TTGState) {
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

@interface ViewController()<NSTextFieldDelegate,NSTableViewDelegate,NSTableViewDataSource>
@property (assign) IBOutlet NSBox *seatchContainBox;

@property (assign) IBOutlet NSTableView *tableView;
@property (assign) IBOutlet NSTextField *searchBarText;

@property (assign) IBOutlet NSBox *cellContainView;

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

//@property (assign) NSString *cellIdentifier;
@property (assign) TTGState cellType;
@property (retain) NSMutableArray *tableviewCellArray;
@property (assign) IBOutlet NSArrayController *searchResultsController;

@end

@implementation ViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
    [self setupData];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}
#pragma mark - UI & Data
- (void)setupUI {
    //(480,60)
    [self.view.window setContentSize:NSMakeSize(480.f, 60.f)];
    self.searchBarText.delegate = self;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.identifier = MemberCell;
    self.cellType = 1;
    //searchContainView border shadow
    _searchBarText.delegate = self;
    [_searchBarText setFocusRingType:NSFocusRingTypeNone];
    //
}

- (void)setupData {
    MemberCellInfo *entity = [MemberCellInfo new];
    entity.name = @"小六";
    MemberCellInfo *entity2 = [MemberCellInfo new];
    entity2.name = @"小liu";
    self.searchResultsController.content = @[entity,entity2];
    
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
    [self.tableView reloadData];
}
#pragma mark - NSTableViewDataSource
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return 10;
}

#pragma mark - NSTableViewDelegate
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    /**
     个别cell显示section问题，根据model中类型判断返回cellIdentifier
     **/
    
    NSTableCellView *cell = nil;
    switch (self.cellType) {
        case 1:
            [self configureMemberCell:tableView WithcellID:MemberCell row:row];
            break;
        case 2:
            [self configureBusinessCell:tableView WithcellID:BusinessCell row:row];
            break;
        case 3:
            [self configureScheduleCell:tableView WithcellID:ScheduleCell row:row];
            break;
        case 4:
            [self configureNotesCell:tableView WithcellID:NotesCell row:row];
            break;
        case 5:
            [self configureInformationCell:tableView WithcellID:InformationCell row:row];
            break;
        case 6:
            [self configureFileCell:tableView WithcellID:FileCell row:row];
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

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    switch (self.cellType) {
        case 1: return 41.f; break;
        case 2: return 45.f; break;
        case 3: return 50.f; break;
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
    progressType.stringValue = entity.progressType;
    
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
    
    NSTextField *detailsTime = [cell viewWithTag:102];
    detailsTime.stringValue = entity.detailsTime;
    return cell;
}

#pragma mark - NSTextFieldDelegate
- (void)controlTextDidChange:(NSNotification *)obj {
    if (obj.object == self.searchBarText && self.searchBarText.stringValue.length != 0) {
        //configure text change
        
//        self
    }
}

#pragma mark - String Tool
- (void)originalTextField:(NSTextField*)orgTextField targetString:(NSString*)tarString setColor:(NSColor*)color {
    NSRange range = [orgTextField.stringValue rangeOfString:tarString];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:orgTextField.stringValue];
    NSDictionary *attrsDictionary  = [NSDictionary dictionaryWithObjectsAndKeys:[NSColor redColor], NSForegroundColorAttributeName, nil];
    [attrStr addAttributes:attrsDictionary range:range];
    [orgTextField setAttributedStringValue:attrStr];
}

- (void)dealloc {
    [self.tableviewCellArray release];
    [super dealloc];
}
@end
