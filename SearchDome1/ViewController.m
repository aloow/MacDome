//
//  ViewController.m
//  SearchDome1
//
//  Created by shaoqing on 2017/6/5.
//  Copyright © 2017年 shaoqing. All rights reserved.
//

#import "ViewController.h"
#import "SBButton.h"

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

@property (assign) IBOutlet NSImageView *fileTypeImage;
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

@property (assign) NSString *cellIdentifier;
@property (assign) TTGState cellType;
@end

@implementation ViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}
#pragma mark - UI
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
    NSTableCellView *cell = nil;
    switch (self.cellType) {
        case 1:
            self.cellIdentifier = MemberCell;
            cell = [tableView makeViewWithIdentifier:self.cellIdentifier owner:self];
            //configure cell
            break;
        case 2:
            self.cellIdentifier = BusinessCell;
            cell = [tableView makeViewWithIdentifier:self.cellIdentifier owner:self];
            //configure cell
            break;
        case 3:
            self.cellIdentifier = ScheduleCell;
            cell = [tableView makeViewWithIdentifier:self.cellIdentifier owner:self];
            //configure cell
            break;
        case 4:
            self.cellIdentifier = NotesCell;
            cell = [tableView makeViewWithIdentifier:self.cellIdentifier owner:self];
            //configure cell
            break;
        case 5:
            self.cellIdentifier = InformationCell;
            cell = [tableView makeViewWithIdentifier:self.cellIdentifier owner:self];
            //configure cell
            break;
        case 6:
            self.cellIdentifier = FileCell;
            cell = [tableView makeViewWithIdentifier:self.cellIdentifier owner:self];
            //configure cell
            break;
        default:
            return nil;
            break;
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
