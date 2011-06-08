//
//  NSMutableDictionary+Tools.h
//
//  Created by Uroš Milivojević.
//  Copyright 2011 Uroš Milivojević. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSMutableDictionary (Tools)

- (void) set:(id)object
          at:(NSString *)firstArg, ... NS_REQUIRES_NIL_TERMINATION;

@end
