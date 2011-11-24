//
//  NSArray+Tools.m
//
//  Created by Uroš Milivojević.
//  Copyright 2011 Uroš Milivojević. All rights reserved.
//

#import "NSArray+Tools.h"


@implementation NSArray (Tools)

- (id) get:(NSNumber *)firstArg, ... {
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
- (NSMutableArray *) getAll:(NSString *)key {
    NSMutableArray *resultsList = [[NSMutableArray alloc] init];
    id value;
    for (id anObject in self) {
        if ([anObject isMemberOfClass:[NSDictionary class]] || [anObject isKindOfClass:[NSObject class]]) {
            value = [anObject valueForKey:key];
            if ([value isKindOfClass:[NSDictionary class]]) {
                [resultsList addObject:value];
            } else if ([value isKindOfClass:[NSArray class]]) {
                [resultsList addObjectsFromArray:value];
            } else if ([value isKindOfClass:[NSObject class]]) {
                [resultsList addObject:value];
            }
        }
    }
    return [resultsList autorelease];
}
// --------------------------------------------------------------------------------------------------------------------
- (NSMutableArray *) getAllWith:(NSString *)key 
                        equalTo:(id)reference
{
    NSMutableArray *resultsList = [[NSMutableArray alloc] init];
    id value;
    for (id anObject in self) {
        if ([anObject isMemberOfClass:[NSDictionary class]] || [anObject isKindOfClass:[NSObject class]]) {
            value = [anObject valueForKey:key];
            if (value && [value isEqual:reference]) {
                [resultsList addObject:anObject];
            }
        }
    }
    return [resultsList autorelease];
}
// --------------------------------------------------------------------------------------------------------------------
- (NSMutableArray *) transformToMutable {
    NSMutableArray *result = [[NSMutableArray alloc] initWithArray:self];
    id anOldValue, anNewObject;
    for (int i=0; i<[result count]; i++) {
        anOldValue = [result objectAtIndex:i];
        if ([anOldValue isKindOfClass:[NSDictionary class]] || [anOldValue isKindOfClass:[NSArray class]]) {
            anNewObject = [anOldValue transformToMutable];
            if (anNewObject) {
                [result replaceObjectAtIndex:i withObject:anNewObject];
            }
        }
    }
    return [result autorelease];
}

@end
