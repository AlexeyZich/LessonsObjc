//
//  Person.m
//  TestDataTable
//
//  Created by Алексей Ермолаев on 08.08.17.
//  Copyright © 2017 Алексей Ермолаев. All rights reserved.
//

#import "Person.h"

@implementation Person

- (BOOL) checkEmptyName:(NSString *)fullName {
    NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
    if([[fullName stringByTrimmingCharactersInSet: set] length] == 0) {
        return YES;
    } else {
        return NO;
    }
}
@end
