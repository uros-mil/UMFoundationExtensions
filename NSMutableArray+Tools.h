//
//  NSMutableArray+Tools.h
//
//  Created by Uroš Milivojević.
//  Copyright 2011 Uroš Milivojević. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSMutableArray (Tools)

- (void) set:(id)object
          at:(NSNumber *)firstArg, ... NS_REQUIRES_NIL_TERMINATION;
- (void) sortUsingDescriptorsKeys:(NSString *)firstArg, ... NS_REQUIRES_NIL_TERMINATION;

@end
