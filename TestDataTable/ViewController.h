//
//  ViewController.h
//  TestDataTable
//
//  Created by Алексей Ермолаев on 08.08.17.
//  Copyright © 2017 Алексей Ермолаев. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TableDataSource.h"

@interface ViewController : NSViewController
- (IBAction)add:(id)sender;
@property (weak) IBOutlet NSTextField *name;
@property (strong) IBOutlet TableDataSource *tableDataSource;
- (IBAction)delete:(id)sender;
@property (weak) IBOutlet NSTableView *tableView;

@end

