//
//  TableDataSource.m
//  TestDataTable
//
//  Created by Алексей Ермолаев on 08.08.17.
//  Copyright © 2017 Алексей Ермолаев. All rights reserved.
//

#import "TableDataSource.h"

@implementation TableDataSource

@synthesize persons = _persons;

- (TableDataSource*) init {
    _persons = [[NSMutableArray alloc] init];
    
    return self;
}

- (void) addPersonObject:(Person*) person {
    [_persons addObject: person];
    [_tableView reloadData];
}

- (void) changePersonObject:(Person*) person atIndex:(unsigned long) row{
    [_persons replaceObjectAtIndex:row withObject:person];
    [_tableView reloadData];
}

- (void) deletePersonObjectatIndex:(unsigned long) row {
    [_persons removeObjectAtIndex:row];
    [_tableView reloadData];
}
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [_persons count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    if ([tableColumn.identifier isEqualToString:@"names"]) {
        return [[_persons objectAtIndex:row] name];
    }
    else if ([tableColumn.identifier isEqualToString:@"surnames"]) {
        return [[_persons objectAtIndex:row] surname];
    }
    else {
        return @"";
    }
}
//
//- (void) tableViewSelectionDidChange:(NSNotification *)notification {
//    NSLog(@"%ld", (long)[_tableView selectedRow]);
//}


- (void)tableView:(NSTableView *)tableView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    Person *person = [[Person alloc] init];
    
    Person *prevPerson = [_persons objectAtIndex:row];
    
    if([[tableColumn identifier] isEqualToString:@"names"]) {
        [person setName: object];
        [person setSurname: [prevPerson surname]];
        
    } else if ([[tableColumn identifier] isEqualToString:@"surnames"]) {
        [person setName: [prevPerson name]];
        [person setSurname: object];
    }

    [self changePersonObject:person atIndex:row];
}

@end
