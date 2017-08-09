//
//  ViewController.m
//  TestDataTable
//
//  Created by Алексей Ермолаев on 08.08.17.
//  Copyright © 2017 Алексей Ермолаев. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)add:(id)sender {
    
    Person *person = [[Person alloc] init];
    NSString *fullName = [_name stringValue];

    NSArray *names = [fullName componentsSeparatedByString:@" "];
    
    NSInteger namesCount = [names count];
    
    NSString *name;
    NSString *surname;
    
    if (namesCount >= 2) {
        name = names[0];
        surname = names[1];
    }
    else if (namesCount == 1) {
        name = names[0];
        surname = @"";
    }
    else if(namesCount == 0) {
        NSLog(@"Error");
    }

    [person setName: name];
    [person setSurname: surname];

    [_tableDataSource addPersonObject:person];
}
- (IBAction)delete:(id)sender {
    NSLog(@"%ld", (long)[_tableView selectedRow]);
    long row = (long)[_tableView selectedRow];
    [_tableDataSource deletePersonObjectatIndex:row];
}
@end
