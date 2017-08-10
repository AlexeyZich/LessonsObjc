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
    
    unsigned long namesCount = [names count];
    
    NSString *name;
    NSString *surname;
    if ([person checkEmptyName:fullName]) {
        NSLog(@"Name is empty");
    } else {
    
        if (namesCount >= 2) {
            name = names[0];
            if(![person checkEmptyName:names[1]]) {
                surname = names[1];
                [person setName: name];
                [person setSurname: surname];
                [_tableDataSource addPersonObject:person];
            }
            else {
                NSLog(@"Error");
            }
        }
    }
}
- (IBAction)delete:(id)sender {
    NSLog(@"%ld", (long)[_tableView selectedRow]);
    long row = (long)[_tableView selectedRow];
    @try {
        [_tableDataSource deletePersonObjectatIndex:row];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception);
    } @finally {
        NSLog(@"finaly");
    }
    

}
@end
