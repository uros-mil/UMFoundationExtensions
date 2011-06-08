//
//  NSString+Tools.m
//
//  Created by Uroš Milivojević.
//  Copyright 2011 Uroš Milivojević. All rights reserved.
//

#import "NSString+Tools.h"


@implementation NSString (Tools)

- (BOOL) isEqualToAnyString:(NSString *)string, ... {
    BOOL isEqual = NO;
    va_list args;
    va_start(args, string);
    NSString *arg = string;
    for (; arg != nil; arg = va_arg(args, NSString*)) {
        if ([self isEqualToString:arg]) {
            isEqual = YES;
            break;
        }
    }
    va_end(args);
    return isEqual;
}

@end
