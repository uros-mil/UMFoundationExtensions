//
//  NSString+Tools.h
//
//  Created by Uroš Milivojević.
//  Copyright 2011 Uroš Milivojević. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (Tools) 

- (BOOL) isEqualToAnyString:(NSString *)string, ... NS_REQUIRES_NIL_TERMINATION;

@end
