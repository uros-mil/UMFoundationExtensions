//
//  NSDictionary+Tools.m
//
//  Created by Uroš Milivojević.
//  Copyright 2011 Uroš Milivojević. All rights reserved.
//

#import "NSMutableDictionary+Tools.h"


@implementation NSDictionary (Tools)

- (id) get:(NSString *)firstArg, ... {
    id result = nil;
    id data = self;
    va_list args;
    va_start(args, firstArg);
    id arg = firstArg;
    for (; arg != nil; arg = va_arg(args, id)) {
        if (data) {
            if ([data isKindOfClass:[NSDictionary class]]) {
                data = [data valueForKey:arg];
            } else if ([data isKindOfClass:[NSArray class]]) {
                data = [data objectAtIndex:[arg integerValue]];
            } else if ([data isMemberOfClass:[NSObject class]]) {
                data = [data valueForKey:arg];
            }
        } else {
            break;
        }
    }
    if (arg == nil) {
        result = data;
    }
    va_end(args);
    return result;
}
// --------------------------------------------------------------------------------------------------------------------
- (NSMutableDictionary *) transformToMutable{
    NSMutableDictionary *result = [[NSMutableDictionary alloc] initWithDictionary:self];
    id anOldValue, anNewValue;
    for (NSString *anKey in [result allKeys]) {
        anOldValue = [result valueForKey:anKey];
        if ([anOldValue isKindOfClass:[NSDictionary class]] || [anOldValue isKindOfClass:[NSArray class]]) {
            anNewValue = [anOldValue transformToMutable];
            if (anNewValue) {
                [result setObject:anNewValue forKey:anKey];
            }
        }
    }
    return [result autorelease];
}

@end
