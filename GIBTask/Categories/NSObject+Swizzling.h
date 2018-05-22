//
//  NSObject+Swizzling.h
//  GIBTask
//
//  Created by Isa Aliev on 22.05.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (Swizzling)

- (void)swizzleImplementationsFor:(SEL)s1 and:(SEL)s2;

@end
