//
//  NSArray+Tools.m
//
//  Created by Uroš Milivojević.
//  Copyright 2011 Uroš Milivojević. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray (Tools)

- (id) get:(NSNumber *)firstArg, ... NS_REQUIRES_NIL_TERMINATION;
- (NSMutableArray *) getAll:(NSString *)key;
- (NSMutableArray *) getAllWith:(NSString *)key 
                        equalTo:(id)reference;
- (NSMutableArray *) transformToMutable;

@end
