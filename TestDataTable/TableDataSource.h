//
//  TableDataSource.h
//  TestDataTable
//
//  Created by Алексей Ермолаев on 08.08.17.
//  Copyright © 2017 Алексей Ермолаев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cocoa/Cocoa.h"
#import "Person.h"

@interface TableDataSource : NSObject <NSTableViewDataSource, NSTableViewDelegate>
@property (weak) IBOutlet NSTableView *tableView;
@property (weak) IBOutlet NSTextFieldCell *changeName;
@property (weak) IBOutlet NSTextFieldCell *changeSurname;
@property BOOL;

@property (nonatomic, strong) NSMutableArray* persons;
//@property NSInteger *row;

- (TableDataSource*) init;
- (void) addPersonObject: (Person*) person;
- (void) changePersonObject:(Person*) person atIndex:(unsigned long) row;
- (void) deletePersonObjectatIndex:(unsigned long) row;

@end
