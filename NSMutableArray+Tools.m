//
//  NSMutableArray+Tools.m
//
//  Created by Uroš Milivojević.
//  Copyright 2011 Uroš Milivojević. All rights reserved.
//

#import "NSMutableArray+Tools.h"


@implementation NSMutableArray (Tools)

- (void) set:(id)object
          at:(NSNumber *)firstArg, ...
{
    
}

- (void) sortUsingDescriptorsKeys:(NSString *)firstArg, ... {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSSortDescriptor *anSorter;
    va_list args;
    va_start(args, firstArg);
    NSString *arg = firstArg;
    for (; arg != nil; arg = va_arg(args, id)) {
        anSorter = [[NSSortDescriptor alloc] initWithKey:arg ascending:YES];
        [array addObject:anSorter];
        [anSorter release];
    }
    va_end(args);
    [self sortUsingDescriptors:array];
    [array release];
}

@end
