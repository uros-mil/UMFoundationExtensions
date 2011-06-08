//
//  NSDictionary+Tools.m
//
//  Created by Uroš Milivojević.
//  Copyright 2011 Uroš Milivojević. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDictionary (Tools)

- (id) get:(NSString *)firstArg, ... NS_REQUIRES_NIL_TERMINATION;
- (NSMutableDictionary *) transformToMutable;

@end
